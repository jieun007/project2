import cv2
import face_recognition
import pickle
import requests
from flask import Flask, jsonify, request
from flask_cors import CORS, cross_origin
import threading
from waitress import serve
import time  # Import time if you want to introduce some delay between checks

app = Flask(__name__)
CORS(app)

# Load the trained KNN model
with open("trained_knn_model.clf", 'rb') as f:
    knn_clf = pickle.load(f)

# ESP32 URL
URL = "http://192.168.0.96"

# Face recognition and OpenCV setup
cap = cv2.VideoCapture(URL + ":81/stream")

font_path = 'C:/Windows/Fonts/NanumGothic.ttf'


def set_face_detect(url: str, face_detect: int = 1):
    try:
        requests.get(url + "/control?var=face_detect&val={}".format(1 if face_detect else 0))
    except:
        print("SET_FACE_DETECT: something went wrong")
    return face_detect


set_face_detect(URL, 1)
names=[]
name =""
def recognize_face(frame):
    # Find all face locations in the current frame
    face_locations = face_recognition.face_locations(frame)
    print(face_locations)
    global  name
    # If no faces are found in the frame, return an empty list
    if len(face_locations) == 0:
        return []

    # Find face encodings for the faces in the frame
    faces_encodings = face_recognition.face_encodings(frame, known_face_locations=face_locations)

    # Use the KNN model to find the best matches for the faces
    closest_distances = knn_clf.kneighbors(faces_encodings, n_neighbors=1)
    are_matches = [closest_distances[0][i][0] <= 0.6 for i in range(len(face_locations))]

    # Prepare a list of dictionaries containing face information
    faces_info = []
    for (top, right, bottom, left), are_match in zip(face_locations, are_matches):
        if are_match:
            name = knn_clf.predict([faces_encodings[are_matches.index(True)]])[0]
        else:
            name = ""
        # Append face information to the list
        faces_info.append({
            'top': top,
            'right': right,
            'bottom': bottom,
            'left': left,
            'name': name
        })

    return faces_info


def face_recognition_thread():
    while True:
        if cap.isOpened():
            ret, frame = cap.read()
            if ret:
                # Perform face recognition
                faces_info = recognize_face(frame)

                # Display face information in the console
                print(faces_info)

                # Break the loop when 'q' key is pressed
                if cv2.waitKey(1) & 0xFF == ord('q'):
                    break

    # Release the video capture object and close all OpenCV windows
    cv2.destroyAllWindows()
    cap.release()

def check_for_name():
    while True:  # Infinite loop
        if name is not None and name != "":  # Check if 'name' is not null or empty
            # print("얼굴인식", name)
            names.append(name)
            print("names:",names)
            return jsonify(message=name)  # Return 'name' using jsonify
        else:
            # Optionally introduce some delay before the next check
            time.sleep(1)  # Sleep for 1 second before checking again

@app.route('/face')
@cross_origin()
def home_post():
    global name
    print("여기는 얼굴인식하는곳이야")
    # You can call this function to start checking for 'name'
    result = name
    print("인식된 얼굴: ", result)
    if name is not None and name != "":  return result #spring으로 전달
    else:pass

if __name__ == '__main__':
    set_face_detect(URL, 1)

    # Create a thread for face recognition
    face_thread = threading.Thread(target=face_recognition_thread)
    face_thread.start()

    # Run the Flask app using Waitress
    serve(app, host='0.0.0.0', port=5000)

    # Wait for the face recognition thread to finish
    face_thread.join()
