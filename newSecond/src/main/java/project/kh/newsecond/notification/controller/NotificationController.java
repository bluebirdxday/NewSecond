package project.kh.newsecond.notification.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.notification.model.dto.Notification;
import project.kh.newsecond.notification.model.dto.NotificationKeyword;
import project.kh.newsecond.notification.model.service.NotificationService;
import project.kh.newsecond.review.model.dto.Review;
import project.kh.newsecond.user.model.dto.User;


@Controller
@RequestMapping("/notification")
@SessionAttributes({"loginUser"})
public class NotificationController {

	@Autowired
	private NotificationService service;
	
	// 알림 페이지로 이동
	@GetMapping("/notification")
	public String notification(@SessionAttribute(value="loginUser", required=false) User loginUser, Model model) {
		
		
		if(loginUser==null)
			return "redirect:/";
		
		
		int loginUserNo = loginUser.getUserNo();
		
		int keywordCount = service.selectKeywordCount(loginUserNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", loginUserNo);
		map.put("keyword", 0);
		
		List<Notification> notificationList = service.selectNotificationList(map);
		
		model.addAttribute("keywordCount", keywordCount);
		model.addAttribute("notificationList", notificationList);
		
		
		if(!notificationList.isEmpty())
			service.updateReadOrNot(map);
		
		
		return "notification/notification";
	}
	
	
	// 알림페이지->키워드 편집 페이지로 이동
	@GetMapping("/editKeyword")
	public String editKeyword(@SessionAttribute(value="loginUser", required=false) User loginUser, Model model) {
		
		List<NotificationKeyword> keywordList = service.selectKeywords(loginUser.getUserNo());
		model.addAttribute("keywordList", keywordList);
		model.addAttribute(loginUser);
		
		return "notification/editKeyword";
	}
	
	// 키워드 추가
	@PostMapping("/editKeyword/insert")
	public String insertKeyword(@SessionAttribute(value="loginUser", required=false) User loginUser, 
				@RequestParam(name="keyword", required=false) String keyword, RedirectAttributes ra) {
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("userNo", loginUser.getUserNo());
		
		int result = service.insertKeyword(map);
		
		String alertType = null;
		String message = null;
		
		if(result>0) {
			alertType = "success";
			message = "키워드가 추가되었습니다";
		}else {
			alertType = "fail";
			message = "키워드 추가 실패";
		}
		
		ra.addFlashAttribute("alertType", alertType);
		ra.addFlashAttribute("message", message);
		
		return "redirect:/notification/editKeyword";
	}
	
	
	// 키워드 삭제
	@PostMapping("/editKeyword/delete")
	@ResponseBody
	public int deleteReview(@RequestBody NotificationKeyword keyword, RedirectAttributes ra) {
	    return service.deleteKeyword(keyword);
	}
	
	
	// 키워드 알림을 위한 리스트 조회
	@GetMapping("/selectKeywordNotiList")
	@ResponseBody
	public List<Notification> selectKeywordNotiList(@RequestParam("goodsNo") int goodsNo){
		return service.selectKeywordNotiList(goodsNo);
	}
	
	
	// 새글 작성 알림
	@GetMapping("/selectNewPostNotification")
	@ResponseBody
	public List<Notification> selectNewPostNotification(@RequestParam("userNo") int userNo, @RequestParam("goodsNo") int goodsNo){
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("goodsNo", goodsNo);
		
		return service.selectNewPostNotification(map);
	}
	
	
	// 후기 작성 알림
	@GetMapping("/addReviewNotification")
	@ResponseBody
	public Notification addReviewNotification(@RequestParam("userNo") int userNo, @RequestParam("goodsNo") int goodsNo) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("goodsNo", goodsNo);
		
		return service.addReviewNotification(map);
	}
	
	// 키워드 알림 읽음 업데이트
	@PostMapping("/updateKeywordReadOrNot")
	@ResponseBody
	public int updateKeywordReadOrNot(@SessionAttribute(value="loginUser", required=false) User loginUser) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNo", loginUser.getUserNo());
		map.put("keyword", 1);
		
		return service.updateReadOrNot(map);
	}
	
	
}
