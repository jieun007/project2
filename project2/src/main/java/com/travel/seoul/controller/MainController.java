package com.travel.seoul.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.travel.seoul.service.UserService;
import com.travel.seoul.vo.UserVO;

import lombok.Setter;

@Controller
public class MainController {
	
	@Setter(onMethod_=@Autowired)
	private UserService service;
	@GetMapping("/main")
	public String main(HttpServletRequest request, UserVO vo) {

		HttpSession session = request.getSession();
		session.setAttribute("userID", service.userByIdAndPassword(vo).getUserName());
		System.out.println("로그인 되었어요");
		return "/login/main";
	}
}
