package project.kh.newsecond.myPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import project.kh.newsecond.myPage.model.service.MyPageService;

@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
	@Autowired 
	private MyPageService service;
	
	/* 페이지 이동 파트(4개)*/
	@GetMapping("/profile")
	public String profile() {
		return "user/myPage/myPage-profile";
	}

	@GetMapping("/info")
	public String info() {
		return "user/myPage/myPage-info";
	}
	
	@GetMapping("/changePw")
	public String changePw() {
		return "user/myPage/myPage-changePw";
	}
	
	@GetMapping("/secession")
	public String secession() {
		return "user/myPage/myPage-secession";
	}
	
	
	
	
	
}
