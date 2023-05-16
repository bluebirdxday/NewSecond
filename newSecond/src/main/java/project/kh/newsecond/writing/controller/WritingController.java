package project.kh.newsecond.writing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/writing")
public class WritingController {
	
	@GetMapping("/writing")
	public String writing() {
		
		return "writing/writing";
	}
}
