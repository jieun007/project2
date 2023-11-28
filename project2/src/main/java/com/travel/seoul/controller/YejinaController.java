package com.travel.seoul.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.travel.seoul.service.UserService;
import com.travel.seoul.vo.UserVO;

import lombok.Setter;

@Controller
@RequestMapping("/register/*")
public class YejinaController {
	@Setter(onMethod_=@Autowired) 
	private UserService service;
	
	//회원가입
	@GetMapping("/join")
	public String a(Model model) {
		List<UserVO> list = service.list();
		model.addAttribute("list", list);
		return "login/join";
	}
	
	@PostMapping("/join")
	public String registerPost(UserVO vo, RedirectAttributes rttr) {
		System.out.println("회원가입 controller post : "+vo);
		String mm= vo.getUserAge().substring(0,3);
		System.out.println(mm);
		vo.setUserAge(mm);
		service.insert(vo);
		return "redirect:/register/login";
	}
	
	//로그인
	@GetMapping("/login")
	public String login(UserVO vo) {
		System.out.println("컨트롤러에서 로그인 vo : "+ vo);
		return "/login/login";
	}
	
	//로그인
	@PostMapping("/login")
	public String loginPost(UserVO vo) {
		System.out.println("컨트롤러에서 로그인 포스트  vo : "+ vo);
		UserVO user = service.userByIdAndPassword(vo);
		if (user!=null) return "redirect:/main";
		else return "/login/login";
	}
	
	//삭제
	@GetMapping("/delete")
	public String delete(Long userSerial) {
		service.delete(userSerial);
		return "/sample/3";	
	}
	
	//업데이트
	@GetMapping("/update")
	public String update(UserVO userSerial, Model model) {
		int update = service.update(userSerial);
		System.out.println(update);
		model.addAttribute("User",update);
		return "/sample/4";
	}
	
	//Id 중복 확인
	@GetMapping("/check")
	public String v() {
		return "/login/join";
	}
	
	@GetMapping("/confirmId")
	@ResponseBody
	public String confirmId(String id) {
		System.out.println(id);
		UserVO user = service.selectID(id);
		System.out.println(user);
	    return user != null ? "success":"fail";
	}
	
	//아이디 찾기
	@GetMapping("find_ID")
	public String find_ID() {
		return "login/search_id";
	}

	//아이디 찾기
	@RequestMapping(value = "find_ID", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<UserVO> find_IDPost(@RequestBody UserVO vo) {
		System.out.println("컨트롤러 :" +vo);
		String mm="";
		UserVO a=null;
		try {
			mm= vo.getUserAge().substring(0,3);
			System.out.println(mm);
			vo.setUserAge(mm);
			a = service.find_ID(vo);
			System.out.println(a);// 검색이 되었고
		} catch(Exception e) {
			
		}
		return ResponseEntity.ok(a);
	}
	
	
	//비밀번호 찾기
	@GetMapping("find_PW")
	public String find_PW() {
		return "login/search_pw";
	}

	//비밀번호 찾기
	@RequestMapping(value = "find_PW", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<UserVO> find_PWPost(@RequestBody UserVO vo) {
		System.out.println("컨트롤러 :" +vo);
		String mm="";
		UserVO a=null;
		try {
			mm= vo.getUserAge().substring(0,3);
			System.out.println(mm);
			vo.setUserAge(mm);
			a = service.find_PW(vo);
			System.out.println(a);// 검색이 되었고
		} catch(Exception e) {
			
		}
		return ResponseEntity.ok(a);
	}
	
}