package project.kh.newsecond.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.admin.model.dto.Admin;
import project.kh.newsecond.admin.model.service.AdminService;
import project.kh.newsecond.notice.model.dto.Notice;
import project.kh.newsecond.qna.model.dto.Qna;
import project.kh.newsecond.user.model.dto.User;

@SessionAttributes({ "loginMember" })
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 관리자 공지사항 게시글 목록 조회
	@GetMapping("/admin_notice")
	public String notice(Model model
			, @RequestParam(value="cp", required=false, defaultValue="1") int cp){

		  Map<String, Object> map = adminService.selectNoticeList(cp);
		  
		  model.addAttribute("map", map);
		 

		return "admin/admin_notice";
	}

	// 관리자 공지사항 게시글 읽기
	@GetMapping("/admin_notice_read/{noticeNo}")
	public String notice_read(Model model, @PathVariable("noticeNo") int noticeNo
			,@SessionAttribute(value="logingMember", required=false) User loginMember
			,HttpServletRequest req
			,HttpServletResponse resp) {

		Notice notice = adminService.selectNoticeOne(noticeNo);
		
		//쿠키를 이용한 조회 수 증가 처리
		//1)비회원 또는  로그인한 회원의 글이 아닌 경우
		if(loginMember == null || loginMember.getUserNo() != notice.getUserNo()) {
			
			
		//2) 쿠키 얻어오기
		Cookie c = null;
		//요청에 담겨있는 모든 쿠키 얻어오기
		Cookie[] cookies = req.getCookies(); 
		
		if(cookies !=null ) { //쿠키가 존재할 경우
			
			//쿠키 중 "readBoradNo"라는 쿠키를 찾아서 c에 대입
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("readBoardNo")) {
					c = cookie;
					break;
					
				}
				
			}
			
		}
		
		//3) 기존 쿠키가 없거나 (c ==null)
		//존재는 하나 현재 게시글 번호가 쿠키에 저장되지 않은 경우
		//(오늘 해당 게시글 본 적 없음)
		int result = 0;
		
		if(c == null) {
			//쿠키가 존재 X -> 하나 새로 생성
			c  = new Cookie("readBoardNo", "|" + noticeNo + "|" );
			

			result = adminService.updateReadCount(noticeNo);
		
		}else {
			//현재 게시글 번호가 쿠키에 있는지 확인 // 쿠기가 존재 O
			//Cookie.getValue() : 쿠키에 저장된 모든 값을 읽어옴
			//					-> String으로 반환
			//String.indexOf("문자열") : 찾는 문자열이 String이 몇 번 인덱스에 존재하는지 알려줌
			//단, 없으면 -1 반환
			
			if(c.getValue().indexOf("|" + noticeNo + "|") == -1) {
				//쿠키에 현재 게시글 번호가 없다면 
				
				//기존 값에 게시글 번호 추가해서 다시 세팅
				c.setValue(c.getValue() + "|" + noticeNo + "|" );
				
				result = adminService.updateReadCount(noticeNo);
				
			}
		}
		
			resp.addCookie(c); //응답 객체를 이용해서 클라이언트에게 전달
			
			}
			
		model.addAttribute("Notice", notice);
		return "admin/admin_notice_read";
	}


	// 관리자 공지사항 게시글 쓰기
	@GetMapping("/admin_notice_write")
	public String notice_write() {

		return "admin/admin_notice_write";
	}

	// 관리자 공지사항 게시글 쓰기
	@PostMapping("/admin_notice_write/insert")
	public String notice_write_insert(Notice notice, RedirectAttributes ra) {

		int noticeNo = adminService.noticeInsert(notice);

		// 삽입 성공 시
		String message = null;
		String path = "redirect:";
		if (noticeNo > 0) { // 성공시

			message = "게시글이 등록 되었습니다.";
			path += "/admin/admin_notice_read" + "/" + noticeNo;

		} else {
			message = "게시글이 등록 실패 되었습니다.";
			path += "insert";
		}

		ra.addFlashAttribute("message", message);
		return path;

	}
	// 관리자 공지사항 게시글 수정 화면 전환

	@GetMapping("/admin_notice_update/{noticeNo:[0-9]+}")
	public String noticeUpdate(@PathVariable("noticeNo") int noticeNo, Model model) {

		Notice notice = adminService.selectNoticeOne(noticeNo);

		model.addAttribute("Notice", notice);
		return "admin/admin_notice_update";

	}

	/**
	 * 관리자 공지사항 게시글 수정
	 * 
	 * @return
	 */
	@PostMapping("/admin_notice_update/{noticeNo:[0-9]+}")
	public String noticeUpdate(Notice notice, RedirectAttributes ra, @PathVariable("noticeNo") int noticeNo) {

		noticeNo = adminService.noticeUpdate(notice);

		// 삽입 성공 시
		String message = null;
		String path = "redirect:";
		if (noticeNo > 0) { // 성공시

			message = "게시글이 등록 되었습니다.";
			path += "/admin/admin_notice_read" + "/" + noticeNo;

		} else {
			message = "게시글이 등록 실패 되었습니다.";
			path += "admin_notice_update";
		}

		ra.addFlashAttribute("message", message);
		return path;

	}

	/**
	 * 관리자 공지사항 게시글 삭제
	 * 
	 * @return
	 */
	@GetMapping("/admin_notice/{noticeNo}/delete")
	public String noticeDelete(Notice notice, Model model, RedirectAttributes ra,
			@PathVariable("noticeNo") int noticeNo) {

		noticeNo = adminService.noticeDelete(notice);

		// 삽입 성공 시
		String message = null;
		String path = "redirect:";
		if (noticeNo > 0) { // 성공시

			message = "게시글이 등록 되었습니다.";
			path += "/admin/admin_notice";

		} else {
			message = "게시글이 등록 실패 되었습니다.";
			path += "{noticeNo}";
		}

		ra.addFlashAttribute("message", message);
		return path;

	}
	/** 공지사항 선택 삭제******************<진행중 23.05.22>
	 * @param selectedItems
	 * @return
	 */
	@PostMapping(value = "/adimin_notice/deleteNoticeList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String deleteNoticeList(@RequestBody String[] selectedItems) {
		
	    System.out.println(selectedItems);
	    
	    for (String noticeNo : selectedItems) {
	        int noticeNoInt = Integer.parseInt(noticeNo);
	        int result = adminService.deleteNoticeList(noticeNoInt);
	    }
	  
	    return "admin/admin_notice";
	}
	 

	// 관리자 회원 관리 조회
	@GetMapping("/admin_user")
	public String admin_user(Model model) {

		List<HashMap<String, Object>> UserList = adminService.selectUserList();

		model.addAttribute("UserList", UserList);

		return "admin/admin_user";

	}

	// 관리자 게시글 리스트 조회
	@GetMapping("/admin_board")
	public String board(Model model) {

		List<HashMap<String, Object>> GoodsBoardList = adminService.selectGoodsBoardList();

		model.addAttribute("GoodsBoardList", GoodsBoardList);

		return "admin/admin_board";
	}

	// 관리자 게시글 읽기 조회
	@GetMapping("/admin_board_read")
	public String board_read() {
		
		return "admin/admin_board_read";
	}
	
	

	// 관리자 문의사항 게시글 조회 //페이지네이션
	@GetMapping("/admin_qna")
	public String qna(Model model,Qna qna, @RequestParam(value="cp", required=false, defaultValue="1") int cp){

		  Map<String, Object> map = adminService.selectQnaList(cp);
		  
		  model.addAttribute("map", map);
		 
		return "admin/admin_qna";
	}

	// 관리자 문의사항 게시글 읽기
	@GetMapping("/admin_qna_read/{qnaNo}")
	public String qna_read(Model model, @PathVariable("qnaNo") int qnaNo) {

		Qna qna = adminService.selectqnaOne(qnaNo);
		
		qna.setQnaNo(qnaNo);
		
		
		
		model.addAttribute("Qna", qna);
		return "admin/admin_qna_read";
	}

	@PostMapping("/admin_user/signOut")
	@ResponseBody()
	public int userSignOut(@RequestBody Map<String, Object> paramMap) {

		
		return adminService.userSignOut(paramMap);
	}

	/** 문의사항 삭제
	 * @param qna
	 * @param model
	 * @param ra
	 * @param qnaNo
	 * @return
	 */
	@GetMapping("/admin_qna/{qnaNo}/delete")
	public String qnaDelete(Qna qna, Model model, 
			@PathVariable("qnaNo") int qnaNo) {

		qnaNo = adminService.qnaDelete(qna);
		
		model.addAttribute("Qna", qna);
		
		return "admin/admin_qna";

	}
	
	
}
