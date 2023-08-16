package project.kh.newsecond.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
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
						,@RequestParam(value="saveId", required=false) String saveId
						,HttpServletResponse resp
						,RedirectAttributes ra) {
		
		User loginUser = service.login(inputUser);
		
		if(loginUser != null) {
			
			model.addAttribute("loginUser", loginUser);
			
			// 쿠키 생성(해당 쿠키에 담을 데이터를 K:V 로 지정)
			Cookie cookie = new Cookie("saveId", loginUser.getUserEmail());
			
			/* 쿠키의 유통기한 설정 */
			if(saveId != null) { // 체크 되었을 때
				cookie.setMaxAge(60 * 60 * 24 * 30); // 한 달(30일) 동안 유지되는 쿠키 생성
			}else { // 체크 안되었을 때
				cookie.setMaxAge(0); // 0초 동안 유지 되는 쿠키 생성 == 기존 쿠키 삭제
			}
			
			// 클라이언트가 어떤 요청을 할때 쿠키가 첨부될지 경로(주소)를 지정
			cookie.setPath("/"); // localhost / 이하 모든 주소 == 모든 요청에 쿠키 첨부
			
			// 응답 객체(HttpsServletResponse)를 이용해서
			// 만들어진 쿠키를 클라이언트에게 전달
			resp.addCookie(cookie);
			
			ra.addFlashAttribute("alertType", "success");
			ra.addFlashAttribute("message", loginUser.getUserNickname() + "님의 방문을 환영합니다!");
			
		} else {
			
			ra.addFlashAttribute("alertType", "fail");
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
		}
		
		return "redirect:" + referer; // HTTP Header - referer(이전 주소)
	} 
	
	// 로그아웃 -> 세션 만료
	@GetMapping("/logout")
	public String logout(SessionStatus status,
						HttpSession session,
						RedirectAttributes ra) {
		
		status.setComplete(); // 세션 만료
		
		ra.addFlashAttribute("alertType", "success");
		ra.addFlashAttribute("message", "로그아웃 되었습니다.");
		
		return "redirect:/";
	}
	
	// 회원가입 화면 전환
	@GetMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	
	// 회원가입 서비스
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
		String alertType = null;
		
		if(result > 0) {
			path += "/";
			
			alertType = "success";
			message = inputUser.getUserNickname() + "님의 가입을 환영합니다."; 
		} else {
			
			path += "signUp";
			
			alertType = "fail";
			message = "회원 가입 실패, 나중에 다시 시도해주세요";
			
		}
		
		ra.addFlashAttribute("alertType", alertType);
		ra.addFlashAttribute("message", message);
		
		
		
		return path;
	}
	
	
	
}
