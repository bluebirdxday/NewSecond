package project.kh.newsecond.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna")
public class QnaController {

		@GetMapping("/qna")
		public String qna(){
			return "qna/qna";
		}
		
		@GetMapping("/qna_check")
		public String qna_check(){
			return "qna/qna_check";
		}
	
	

	
}
