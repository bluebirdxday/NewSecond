package project.kh.newsecond.notice.Controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.notice.model.dto.Notice;
import project.kh.newsecond.notice.model.service.NoticeService;
import project.kh.newsecond.user.model.dto.User;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
		@GetMapping("/notice")
		public String notice(Model model) {
			
			List<Notice> NoticeList = noticeService.selectNoticeList();
			
			model.addAttribute("NoticeList",NoticeList);
			
			
			return "notice/notice";
		}

			
			@GetMapping("notice_read/{noticeNo}")
			public String notice_read(Model model
					, @PathVariable("noticeNo") int noticeNo) {
				
				List<Notice> NoticeList = noticeService.selectNoticeOneList(noticeNo);
				
				model.addAttribute("NoticeList",NoticeList);
				
				return "notice/notice_read";
		}
			
			

}
