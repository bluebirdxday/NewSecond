package project.kh.newsecond.myPage.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.myPage.model.service.MyPageService;
import project.kh.newsecond.user.model.dto.User;

@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
	@Autowired 
	private MyPageService service;
	
	/* 페이지 이동 파트(3개)*/

	@GetMapping("/info")
	public String info() {
		return "user/mypage/myPage-info";
	}
	
	@GetMapping("/changePw")
	public String changePw() {
		return "user/mypage/myPage-changePw";
	}
	
	@GetMapping("/secession")
	public String secession() {
		return "user/mypage/myPage-secession";
	}
	
	
	@PostMapping("/secession")
	public String secession(String userPassword
							,@SessionAttribute("loginUser") User loginUser
							,SessionStatus status
							,HttpServletResponse resp
							,RedirectAttributes ra) {
		
		System.out.println(loginUser);
		
		int userNo = loginUser.getUserNo();
		
		System.out.println(userPassword);
		System.out.println(userNo);
		
		int result = service.secession(userNo, userPassword);
		
		
		String path = "redirect:";
		String message = null;
		String alertType = null;
		
		if(result > 0) {
			alertType = "success";
			message = "탈퇴 되었습니다.";
			
			path+="/";
			
			status.setComplete();
			
			Cookie cookie = new Cookie("saveId", "");
			
			cookie.setMaxAge(0); 
			cookie.setPath("/"); 
			resp.addCookie(cookie); 
			
		}
		
		else {
			alertType = "fail";
			message = "현재 비밀번호가 일치하지 않습니다.";
			
			// 	- 회원 탈퇴 페이지로 리다이렉트
			path += "secession";
		}
		
		ra.addFlashAttribute("alertType", alertType);
		ra.addFlashAttribute("message", message);
		
		return path;
	}
}




