package project.kh.newsecond.qna.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.notice.model.dto.Notice;
import project.kh.newsecond.qna.model.dto.Qna;
import project.kh.newsecond.qna.model.service.QnaService;


@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
		/**문의사항 화면 전환
		 * @return
		 */
		@GetMapping("/qna")
		public String qna(){
			return "qna/qna";
		}
		
		
		/** 문의사항 제출 (insert)
		 * @param model
		 * @param qna
		 * @param ra
		 * @return
		 */
		@PostMapping("/qna_check")
		public String qna_check(
				Model model, RedirectAttributes ra
				,Qna qna){
			
			String message = null;
			String alertType = null;
			
			int result = qnaService.qnaInsert(qna);
			
			if(result>0) {
				message = "문의사항이 접수되었습니다.";
				alertType = "success";
			}
			else {
				message = "문의사항을 접수할 수 없습니다.";
				alertType = "fail";
			}
		
			model.addAttribute("Qna",qna);
			
			ra.addFlashAttribute("message", message);
			ra.addFlashAttribute("alertType", alertType);
			
			return "qna/qna_check";
		
		}
		
		
		
		
	
	

	
}
