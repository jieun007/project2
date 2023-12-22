package com.travel.seoul.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		if(user==null) {
			vo= service.selectID(vo.getUserID());
		}
		
		System.out.println("vo : "+vo);
		model.addAttribute("user",user);
		/*
		 * session.setAttribute("userID",
		 * service.userByIdAndPassword(vo).getUserName());
		 */
		System.out.println("로그인 되었어요 : "+user);
		return "redirect:/";
	}
	
	@GetMapping("/face")
	public ResponseEntity<UserVO> faceSession(@RequestParam("userID") String userID) {
	    System.out.println("1번 출력: " + userID);
	    UserVO vo = service.selectID(userID);
	    System.out.println("2번 출력: " + vo);
	    return new ResponseEntity<UserVO>(vo, HttpStatus.OK);
	}

	
  	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session, UserVO vo, Model model) {
		session.removeAttribute("loginMember");
		System.out.println("로그아웃 했습니다.");
		return "redirect:/";
	}
	

//	 * @GetMapping("/logout") public String logout(UserVO vo, HttpServletRequest
//	 * request) throws InterruptedException { System.out.println("로그아웃 컨트롤러");
//	 * HttpSession session = request.getSession(false); // Session이 없으면 null return
//	 * if(session != null) { System.out.println("Before invalidate: " +
//	 * session.getId()); session.invalidate(); session = request.getSession(false);
//	 * System.out.println("로그아웃 후 세션: "+session); return "redirect:/"; } return
//	 * "null"; }

}
