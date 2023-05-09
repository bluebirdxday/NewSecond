package project.kh.newsecond.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Maincontroller {
	
	@RequestMapping("/")
	public String mainForward() {
		return "common/main";
	}
}
