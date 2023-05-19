package project.kh.newsecond.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.admin.model.dto.Admin;
import project.kh.newsecond.admin.model.service.AdminService;
import project.kh.newsecond.notice.model.dto.Notice;
import project.kh.newsecond.qna.model.dto.Qna;



@SessionAttributes({"loginMember"})
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	//관리자 공지사항 게시글 조회
	@GetMapping("/admin_notice")
	public String notice(Model model) {
		
		List<Notice> NoticeList = adminService.selectNoticeList();
		
		model.addAttribute("NoticeList",NoticeList);
		
		return "admin/admin_notice";
	}
	
	
	//관리자 공지사항 게시글 읽기
	@GetMapping("/admin_notice_read/{noticeNo}")
	public String notice_read(Model model
			, @PathVariable("noticeNo") int noticeNo) {
		
		Notice notice = adminService.selectNoticeOne(noticeNo);
		
		model.addAttribute("Notice",notice);
		return "admin/admin_notice_read";
	}
	
	
	//관리자 공지사항 게시글 쓰기
	@GetMapping("/admin_notice_write")
	public String notice_write() {

	return "admin/admin_notice_write";
}

	
	
	//관리자 공지사항 게시글 쓰기
	@PostMapping("/admin_notice_write/insert")
	public String notice_write_insert(
			Notice notice,
			RedirectAttributes ra){
		
		int noticeNo = adminService.noticeInsert(notice);
		
		//삽입 성공 시
		String message = null;
		String path = "redirect:";
		if(noticeNo > 0) { //성공시
			
			message = "게시글이 등록 되었습니다.";
			path += "/admin/admin_notice_read" + "/" + noticeNo;
			
		}else {
			message = "게시글이 등록 실패 되었습니다.";
			path += "insert";
		}

		
		ra.addFlashAttribute("message",message);
		return path;
		
	}
		//관리자 공지사항 게시글 수정 화면 전환
		
		@GetMapping("/admin_notice_update/{noticeNo:[0-9]+}")
		public String noticeUpdate(
			@PathVariable("noticeNo") int noticeNo
			,Model model) {
			
			Notice notice = adminService.selectNoticeOne(noticeNo);
			
			
			model.addAttribute("Notice",notice);
		return "admin/admin_notice_update";
		
	}
		
		/**관리자 공지사항 게시글 수정
		 * @return
		 */
		@PostMapping("/admin_notice_update/{noticeNo:[0-9]+}")
		public String noticeUpdate(
				Notice notice
				,RedirectAttributes ra,
				@PathVariable("noticeNo") int noticeNo ){
			
			
			  noticeNo = adminService.noticeUpdate(notice);
			 
			
			//삽입 성공 시
			String message = null;
			String path = "redirect:";
			if(noticeNo > 0) { //성공시
				
				message = "게시글이 등록 되었습니다.";
				path += "/admin/admin_notice_read" + "/" + noticeNo;
				
			}else {
				message = "게시글이 등록 실패 되었습니다.";
				path += "admin_notice_update";
			}

			
			ra.addFlashAttribute("message",message);
			return path;
			
		}
		
		
		
		/**관리자 공지사항 게시글 삭제
		 * @return
		 */
		@GetMapping("/admin_notice/{noticeNo}/delete")
		public String noticeDelete(
				Notice notice
				,Model model
				,RedirectAttributes ra
				,@PathVariable("noticeNo") int noticeNo ){
			
				noticeNo = adminService.noticeDelete(notice);
			 
				
				//삽입 성공 시
				String message = null;
				String path = "redirect:";
				if(noticeNo > 0) { //성공시
					
					message = "게시글이 등록 되었습니다.";
					path += "/admin/admin_notice";
					
				}else {
					message = "게시글이 등록 실패 되었습니다.";
					path += "{noticeNo}";
				}

				
				ra.addFlashAttribute("message",message);
				return path;
				
			}
		
		
		@PostMapping("/adimin_notice/deleteNoticeList")
		@ResponseBody
		public String deleteNoticeList(@RequestBody Notice notice ) {
			
			
			return null; 
		}
		
		
	
	
	//관리자 회원 관리 조회
	@GetMapping("/admin_user")
	public String admin_user(Model model) {
		
		List<HashMap<String, Object>> UserList = adminService.selectUserList();
		
		model.addAttribute("UserList",UserList);
		
		return "admin/admin_user";
		
		
		
	}


	
	
	//관리자 게시글 리스트 조회
	@GetMapping("/admin_board")
	public String board(Model model) {
		
		List<HashMap<String, Object>> GoodsBoardList = adminService.selectGoodsBoardList();
		
		model.addAttribute("GoodsBoardList",GoodsBoardList);
		
		return "admin/admin_board";
	}
	//관리자 게시글 읽기 조회
	@GetMapping("/admin_board_read")
	public String board_read() {
		return "admin/admin_board_read";
	}
	
	
	
	//관리자 문의사항 게시글 조회
	@GetMapping("/admin_qna")
	public String qna(Model model) {
		
		List<Admin> QnaList = adminService.selectQnaList();
		
		model.addAttribute("QnaList",QnaList);
		return "admin/admin_qna";
	}

	
	
	//관리자 문의사항 게시글 읽기
	@GetMapping("/admin_qna_read/{qnaNo}")
	public String qna_read(Model model
			, @PathVariable("qnaNo") int qnaNo) {
		
		Qna qna = adminService.selectqnaOne(qnaNo);
		
		model.addAttribute("Qna",qna); 
		return "admin/admin_qna_read";
	}
	
	
	
	
	
	

}



