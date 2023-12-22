package com.travel.seoul.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.travel.seoul.vo.AttachFileVO;

@Controller
public class UploadController {
	
		
	//p500 (ajax 를 이용한 파일업로드)
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		System.out.println("upload ajax");
	}
		
	//p504 => 파일 저장
	@PostMapping("/uploadAjaxAction")
	public ResponseEntity<List<AttachFileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		System.out.println("ajax file Controller: ");
		List<AttachFileVO> list = new ArrayList<>(); // 추가
		String uploadFolder="C:\\je\\gitproject1\\project1\\project1\\face_recognition-master\\examples\\knn_examples\\train\\";
		String fileName= uploadFile[0].getOriginalFilename();
		int lastDotIndex = fileName.lastIndexOf(".");
        if (lastDotIndex != -1) {
        	fileName = fileName.substring(0, lastDotIndex);
        }
		File uploadPath = new File(uploadFolder+fileName); // 변경
		boolean bool2 = uploadPath.mkdirs();  
		System.out.println("upload path: "+uploadPath + "  : " +bool2);
		
		// 연도 폴더 생성
		for(MultipartFile i : uploadFile) {
			AttachFileVO attachDto = new AttachFileVO(); // 추가
			System.out.println("-------------------");
			System.out.println("Upload File Name: "+ i.getOriginalFilename());
			System.out.println("Upload File Size: "+ i.getSize());
			String uploadFileName = i.getOriginalFilename();
			attachDto.setFileName(uploadFileName); // 추가
			// IE 에 대한 처리 (전체 경로가 오므로 마지막 파일만 추출하기 위해
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +1); // \ 가 마지막 글자부터 몇번째 있는가, 0부터 1을 더한다
			// C:\\upload\a.jpg
			System.out.println("only file name: "+ uploadFileName);

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				i.transferTo(saveFile); // 저장은 여기에서 한다				
				
				// 리스트 에 추가
				list.add(attachDto); // 추가
			} catch (Exception e) {
				e.printStackTrace();
			} // catch
		}// for
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	//p526
	@GetMapping("/display")
	@ResponseBody
	public  ResponseEntity<byte[]> getFile(String fileName) { // File 객체를 Byte 배열로 변환하여 header 와 함께 반환함
		System.out.println("upload controller file display: " + fileName);
		File file = new File("c:\\upload\\" + fileName);
		System.out.println("file 객체 : "+ file);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	//p531
	// MIME 타입은 다운로드 할 수 있는 application/octet_stream 으로 지정하고 다운로드시 저장되는 이름은
	// Content-Disposition 을 이용하여 저장
	@GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName) {
		System.out.println("upload controller download : " + fileName);
		FileSystemResource resource = new FileSystemResource("C:\\upload\\"+fileName);
		System.out.println("resource : "+resource);
		String resourceName = resource.getFilename();
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Disposition", "attachment; fileName=" + new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}
	//p548
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		System.out.println("upload controller 삭제 : fileName: "+ fileName + " , type: "+ type);
		File file;
		try {
			file= new File("c:\\upload\\"+ URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				System.out.println("원래 파일명: " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			} // if
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
