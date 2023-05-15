package project.kh.newsecond.wish.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/wish")
public class WishController {

	@GetMapping("/wish")
	public String wish(){
		return "wish/wish";
	
}




		
	

	
}
