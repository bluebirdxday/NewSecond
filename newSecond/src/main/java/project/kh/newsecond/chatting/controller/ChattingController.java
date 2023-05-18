package project.kh.newsecond.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chatting")
public class ChattingController {

	@GetMapping("/chat")
	public String chatting() {
		
		return "chatting/chattingPage";
		// (/WEB-INF/views/)chatting/chattingPage(.jsp)
	}
}
