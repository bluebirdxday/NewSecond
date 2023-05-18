package project.kh.newsecond.writing.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.writing.model.dto.Writing;
import project.kh.newsecond.writing.model.dto.WritingImage;
import project.kh.newsecond.writing.model.service.WritingService;

@Controller
@RequestMapping("/writing")
@SessionAttributes({"loginUser"})
public class WritingController {
	
	@Autowired
	private WritingService service;

	// 글쓰기 페이지 접속
	@GetMapping("/writing")
	public String writing() {
		
		return "writing/writing";
	}
	
	// 게시글 제출
	@PostMapping("/{goodsNo:[0-9]+}/insert")
	public String writingInsert(
			@ModelAttribute Writing writing,
			@ModelAttribute WritingImage writingImage,
			RedirectAttributes ra,
			HttpSession session,
			Model model
			) {
		
		int result = 0;
		
		return null;
	}
}

