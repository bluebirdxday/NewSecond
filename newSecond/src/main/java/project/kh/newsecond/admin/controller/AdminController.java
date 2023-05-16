package project.kh.newsecond.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;



@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/admin")
public class AdminController {
	


	@GetMapping("/admin_notice")
	public String notice() {
		return "admin/admin_notice";
	}
	
	@GetMapping("/admin_notice_read")
	public String notice_read() {
		return "admin/admin_notice_read";
	}
	
	@GetMapping("/admin_notice_write")
	public String notice_write() {
		return "admin/admin_notice_write";
	}
	
	@GetMapping("/admin_user")
	public String admin_user() {
		return "admin/admin_user";
	}


	@GetMapping("/admin_board")
	public String board() {
		return "admin/admin_board";
	}
	@GetMapping("/admin_board_read")
	public String board_read() {
		return "admin/admin_board_read";
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
