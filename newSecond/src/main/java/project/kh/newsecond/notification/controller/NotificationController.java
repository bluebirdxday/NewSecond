package project.kh.newsecond.notification.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.user.model.service.UserService;

@Controller
@RequestMapping("/notification")
@SessionAttributes({"loginUser"})
public class NotificationController {

	@Autowired
	private UserService service;
	
	
	@GetMapping("/notification")
	public String notification() {
		return "notification/notification";
	}
	
	
	@GetMapping("/editKeyword")
	public String editKeyword() {
		return "notification/editKeyword";
	}
}
