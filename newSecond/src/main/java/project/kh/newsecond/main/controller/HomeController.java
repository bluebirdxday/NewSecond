package project.kh.newsecond.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import project.kh.newsecond.user.model.dto.User;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String homeForward(User loginUser) {
		
		return "common/home";
	}
	
}
