package project.kh.newsecond.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class TEst {
	
	@RequestMapping("/a")
	public String mainForward() {
		return "qna";
	}
}
