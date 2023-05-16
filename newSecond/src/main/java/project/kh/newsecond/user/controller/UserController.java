package project.kh.newsecond.user.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.user.model.service.UserService;

@Controller
@RequestMapping("/user")
@SessionAttributes({"loginUser"})
public class UserController{
	
	@Autowired
	private UserService service;
	
	// 로그인 -> 유저 정보 세션 넘기기
	@PostMapping("/login")
	public String login(User inputUser, Model model
						,@RequestHeader(value="referer") String referer
						,RedirectAttributes ra) {
		
		
		User loginUser = service.login(inputUser);
		
		if(loginUser != null) {
			
			model.addAttribute("loginUser", loginUser);
			
			ra.addFlashAttribute("alertType", "success");
			ra.addFlashAttribute("message", loginUser.getUserNickname() + "님의 방문을 환영합니다!");
			
		} else {
			ra.addFlashAttribute("alertType", "fail");
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return "redirect:/";
	} 
	
	// 로그아웃 -> 세션 만료
	@GetMapping("/logout")
	public String logout(SessionStatus status,
						RedirectAttributes ra) {
		
		status.setComplete(); 
		ra.addFlashAttribute("alertType", "success");
		ra.addFlashAttribute("message", "로그아웃 되었습니다.");
		
		return "redirect:/";
	}
	
	// 회원가입 화면 전환
	@GetMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	
	@PostMapping("/signUp")
	public String signUp(User inputUser
						,String[] userAddress
						,RedirectAttributes ra) {
		
		// 받아온 유저 주소 값 3개의 배열을 다시 하나의 스트링으로 합치기
		String addr = String.join("^^^", userAddress);
		inputUser.setUserAddress(addr);
		
		int result = service.signUp(inputUser);
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0) {
			path += "/";
			
			message = inputUser.getUserNickname() + "님의 가입을 환영합니다."; 
		} else {
			
			path += "signUp";
			
			message = "회원 가입 실패";
			
		}
		
		ra.addAttribute("message", message);
		
		
		
		return path;
	}
	
	
	
}
