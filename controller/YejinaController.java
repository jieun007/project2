package com.travel.seoul.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.travel.seoul.vo.UserVO;
import com.travel.seoul.service.UserService;

import lombok.Setter;

@Controller
@RequestMapping("/sample")
public class YejinaController {
	@Setter(onMethod_=@Autowired) 
	private UserService Service;
	
	@GetMapping("/a")
	public String a(Model model) {
		List<UserVO> a = Service.list();
		model.addAttribute("a", a);
		return "sample/1";
	}
}
