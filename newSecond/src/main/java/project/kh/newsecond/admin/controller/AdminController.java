package project.kh.newsecond.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("/admin_user")
	public String admin() {
		return "admin/admin_user";
	}

	
	@GetMapping("/admin_notice")
	public String notice() {
		return "admin/admin_notice";
	}

	@GetMapping("/admin_board")
	public String board() {
		return "admin/admin_board";
	}
	
	@GetMapping("/admin_qna")
	public String qna() {
		return "admin/admin_qna";
	}

	
	@GetMapping("/admin_qna_read")
	public String qna_read() {
		return "admin/admin_qna_read";
	}

	
}
