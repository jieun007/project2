package com.travel.seoul.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MapController {

    @GetMapping("/map2")
    public static String main(@RequestParam String place, Model model) {
        try {
            StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
            urlBuilder.append("/" + URLEncoder.encode("7666485574616e733131306c4a787178", "UTF-8"));
            urlBuilder.append("/" + URLEncoder.encode("xml", "UTF-8"));
            urlBuilder.append("/" + URLEncoder.encode("citydata", "UTF-8"));
            urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8"));
            urlBuilder.append("/" + URLEncoder.encode("3", "UTF-8"));
            urlBuilder.append("/" + URLEncoder.encode(place, "UTF-8"));
            
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            System.out.println("Response code: " + conn.getResponseCode());
            
            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            
            JSONObject json = XML.toJSONObject(sb.toString());
            String jsonStr = json.toString(4);
            System.out.println(jsonStr);

            rd.close();
            conn.disconnect();
            System.out.println(sb.toString());

            model.addAttribute("jsonStr", jsonStr);
            return "map/map";
        } catch (IOException e) {
            return "API 호출 중 오류 발생";
        }
    }
}
