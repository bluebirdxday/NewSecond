package project.kh.newsecond.notification.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notification")
public class NotificationController {

	@GetMapping("/notification")
	public String notification() {
		return "notification/notification";
	}
}
