package project.kh.newsecond.myPage.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.myPage.model.service.MyPageService;
import project.kh.newsecond.user.model.dto.User;

@SessionAttributes({"loginUser"})
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
	
	
	/* ---------- 상세 페이지 로직 ----------- */
	
	/* ------------ 내정보 ------------------- */
	
	// 닉네임 변경
	@PostMapping("/info/changeNickname")
	public String ChangeNickname(String userNickname
								,Model model
								,@SessionAttribute("loginUser") User loginUser
								,RedirectAttributes ra) {
		
		int checkResult = service.checkNickname(userNickname);
		
		String alertType = null;
		String message = null;
		
		
		if(checkResult > 0) { // 닉네임이 중복된 경우
			alertType = "fail";
			message = "중복된 닉네임이 있습니다, 다른 닉네임으로 수정해주세요.";
		}else { // 닉네임이 중복되지 않은 경우
			
			int userNo = loginUser.getUserNo();
			
			int updateResult = service.changeNickname(userNo, userNickname);
			
			if(!(updateResult > 0)) { // 닉네임 변경 실패
				
				alertType = "fail";
				message = "닉네임 변경에 실패했습니다. 다시 시도해주세요";
				
			}else { // 닉네임 변경 성공
				
				alertType = "success";
				message = "닉네임이 변경되었습니다.";
				loginUser.setUserNickname(userNickname);
				model.addAttribute("loginUser", loginUser);
				
			}
			
		}
		
		ra.addFlashAttribute("alertType", alertType);
		ra.addFlashAttribute("message", message);
		
		
		return "redirect:/myPage/info";
	}
	
	// 전화번호 변경
	@PostMapping("/info/changeTel")
	public String changeTel(String userTel
							,Model model
							,@SessionAttribute("loginUser") User loginUser
							,RedirectAttributes ra) {
		
		int userNo = loginUser.getUserNo();
		
		int result = service.changeTel(userNo, userTel);
		
		String alertType = null;
		String message = null;
		
		if(result > 0) {
			
			loginUser.setUserTel(userTel);
			model.addAttribute("loginUser", loginUser);
			alertType = "success";
			message = "전화번호가 변경되었습니다.";
			
		}else {
			
			alertType = "fail";
			message = "전화번호 변경에 실패했습니다. 다시 시도해주세요";
			
		}
		
		ra.addFlashAttribute("alertType", alertType);
		ra.addFlashAttribute("message", message);
		
		
		return "redirect:/myPage/info";
	}
	
	// 주소 변경
	@PostMapping("/info/changeAddress")
	public String changeTel(String[] userAddress
							,Model model
							,@SessionAttribute("loginUser") User loginUser
							,RedirectAttributes ra) {
		
		String addr = String.join("^^^", userAddress);
		loginUser.setUserAddress(addr);
		
		int result = service.changeAddress(loginUser);
		
		String alertType = null;
		String message = null;
		
		if(result > 0) {
			
			loginUser.setUserAddress(addr);
			model.addAttribute("loginUser", loginUser);
			alertType = "success";
			message = "주소가 변경되었습니다.";
			
		}else {
			
			alertType = "fail";
			message = "주소 변경에 실패했습니다. 다시 시도해주세요";
			
		}
		
		ra.addFlashAttribute("alertType", alertType);
		ra.addFlashAttribute("message", message);
		
		return "redirect:/myPage/info";
	}
	
	
	/* --------------------------------------- */
	
	// 비밀번호 변경
	@PostMapping("/changePassword")
	public String changePw(String userPassword, String newUserPassword
							,@SessionAttribute("loginUser") User loginUser
							,RedirectAttributes ra) {
		
		// 로그인한 회원 번호(DB에서 어떤 회원을 조회, 수정하는지 알아야 되니까)
		int userNo = loginUser.getUserNo();
		
		// 비밀번호 변경 서비스 호출
		int result = service.changePassword(userPassword, newUserPassword, userNo);

		String alertType = null;
		String message = null;
		String path = "redirect:";
		
		if(result > 0) { // 변경 성공
			alertType = "success";
			message = "비밀번호가 변경 되었습니다.";
			path += "info";
			
		}else { // 변경 실패
			alertType = "fail";
			message = "현재 비밀번호가 일치하지 않습니다.";
			path += "changePw";
		}
		
		ra.addFlashAttribute("alertType", alertType);
		ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	
	
	// 회원 탈퇴
	@PostMapping("/secession")
	public String secession(String userPassword
							,@SessionAttribute("loginUser") User loginUser
							,SessionStatus status
							,HttpServletResponse resp
							,RedirectAttributes ra) {
		
		int userNo = loginUser.getUserNo();
		
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




