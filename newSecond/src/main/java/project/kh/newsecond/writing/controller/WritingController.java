package project.kh.newsecond.writing.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.writing.model.dto.Writing;
import project.kh.newsecond.writing.model.dto.WritingImage;

@Controller
@RequestMapping("/writing")
@SessionAttributes({"loginUser"})
public class WritingController {

	@GetMapping("/writing")
	public String writing(
			@ModelAttribute Writing writing,
			@ModelAttribute WritingImage writingImage,
			RedirectAttributes ra,
			HttpSession session,
			Model model
			) {
		
		return "writing/writing";
	}
	
	public String writingSubmit() {
		
		return null;
	}
}
