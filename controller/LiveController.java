package com.travel.seoul.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/live/*")
public class LiveController {
	@GetMapping("/map")
	public String a() {
		return "live/map";
	}
	@GetMapping("/sample")
	public String b() {
		return "nav";
	}
}
