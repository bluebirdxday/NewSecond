package project.kh.newsecond.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.user.model.service.UserService;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class UserController {
	
	@Autowired
	private UserService service;
	
	@PostMapping("/login")
	public String login(User inputUser, Model model
						,@RequestHeader(value="referer") String referer
						,RedirectAttributes ra) {
		
		
		User loginUser = service.login(inputUser);
		
		String path = "redirect:";
		
		if(loginUser != null) {
			
			path += "/";
			model.addAttribute("loginUser", loginUser);
			System.out.println(loginUser);
		} else {
			path += referer;
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return path;
	} 
	
}
