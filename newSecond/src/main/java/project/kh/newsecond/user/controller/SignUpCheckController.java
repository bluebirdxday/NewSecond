package project.kh.newsecond.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.kh.newsecond.user.model.service.SignUpCheckService;

@Controller
public class SignUpCheckController {

	@Autowired
	private SignUpCheckService service;
	
	@GetMapping("dupCheck/email")
	@ResponseBody
	public int CheckMail(String email) {
		return service.checkEmail(email);
	}
	
	@GetMapping("dupCheck/nickname")
	@ResponseBody
	public int checkNickname(String nickname) {
		return service.checkNickname(nickname);
	}
	
	
}
