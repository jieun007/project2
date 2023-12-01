package com.travel.seoul.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.travel.seoul.service.UserService;
import com.travel.seoul.vo.UserVO;

import lombok.Setter;

@Controller
public class MainController {
	@Setter(onMethod_=@Autowired)
	private UserService service;
	
	@GetMapping("/")
	public String main(HttpServletRequest request, UserVO vo, Model model, HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("loginMember");
		if(user != null)
			model.addAttribute("user",user);
		
		return "/Main";
	}
	
	@GetMapping("/main")
	public String mainSession(HttpServletRequest request, HttpSession session, UserVO vo, Model model) {
		UserVO user = (UserVO) session.getAttribute("loginMember");
		model.addAttribute("user",user);
		/*
		 * session.setAttribute("userID",
		 * service.userByIdAndPassword(vo).getUserName());
		 */
		System.out.println("로그인 되었어요"+user);
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session, UserVO vo, Model model) {
		session.removeAttribute("loginMember");
		return "redirect:/";
	}
}
