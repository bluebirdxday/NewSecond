package project.kh.newsecond.recent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/new")
public class NewController {

	@GetMapping("/new")
	public String recent(){
		return "new/new";
	
}




		
	

	
}
