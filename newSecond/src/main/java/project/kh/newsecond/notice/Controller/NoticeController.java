package project.kh.newsecond.notice.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import project.kh.newsecond.notice.model.dto.Notice;
import project.kh.newsecond.notice.model.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
		/** 공지사항 글 조회
		 * @param model
		 * @return
		 */
		@GetMapping("/notice")
		public String notice(Model model) {
			
			List<Notice> noticeList = noticeService.selectNoticeList();
			
			model.addAttribute("noticeList",noticeList);
			System.out.println(noticeList);
			
			return "notice/notice";
		}

			
			/**공지사항 게시글 읽기 조회
			 * @param model
			 * @param noticeNo
			 * @return
			 */
			@GetMapping("/notice_read/{noticeNo}")
			public String notice_read(Model model
					, @PathVariable("noticeNo") int noticeNo) {
				
				Notice notice = noticeService.selectNoticeOneList(noticeNo);
				
				System.out.println(notice);
				model.addAttribute("Notice",notice);
				
				return "notice/notice_read";
		}
			
			

}
