package project.kh.newsecond.review.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

import project.kh.newsecond.review.model.dto.Review;
import project.kh.newsecond.review.model.service.ReviewService;
import project.kh.newsecond.shop.model.dto.Shop;
import project.kh.newsecond.shop.model.service.ShopService;
import project.kh.newsecond.user.model.dto.User;

@Controller
@RequestMapping("/review")
@SessionAttributes({"loginUser"})
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	
	@Autowired
	private ShopService shopService;
	
	
	// 후기 목록 조회
	@GetMapping("/reviewList")
	public String reviewList(@SessionAttribute(value="loginUser", required=false) User loginUser, Model model) {
		
		List<Review> reviewList = service.selectWrittenReviewList(loginUser.getUserNo());
		List<HashMap<String, Object>> canWriteReviewList = service.selectCanWriteReviewList(loginUser.getUserNo());
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("canWriteReviewList", canWriteReviewList);
		
		
		return "review/reviewList";
	}
	
	
	// 후기 작성 페이지로 이동
	@GetMapping("/addReview")
	public String addReview(@SessionAttribute(value="loginUser", required=false) User loginUser,
			Model model, RedirectAttributes ra) {
		
		List<HashMap<String, Object>> reviewList = service.selectCanWriteReviewList(loginUser.getUserNo());
		
		model.addAttribute("reviewList", reviewList);
		
		return "review/addReview";
	}
	
	
	//  후기 작성
	@PostMapping("/addReview/insert")
	public String addReview(Review review, @SessionAttribute(value="loginUser", required=false) User loginUser,
			@RequestParam("goodsNo") int goodsNo ,RedirectAttributes ra) {
		
		int userNo = loginUser.getUserNo();
		Shop shop = shopService.selectShopInfo(userNo);
		
		review.setShopTitle(shop.getShopTitle());
		review.setUserNo(userNo);
		review.setGoodsNo(goodsNo);
		
		int result = service.insertReview(review);
		
		String alertType = null;
		String message = null;
		String path = "redirect:";
		Review addedReview = null;
		
		if(result>0) {
			alertType = "success";
			message = "후기가 등록되었습니다.";
			path += "/review/reviewList";
			addedReview = service.selectReivewByGoodsNo(goodsNo);
		}else {
			alertType = "fail";
			message = "후기 등록에 실패하였습니다. 다시 시도해주세요.";
			path = "insert";
		}
		
		
		ra.addFlashAttribute("reviewGoodsNo", addedReview.getGoodsNo());
		ra.addFlashAttribute("reviewUserNo", addedReview.getUserNo());
		ra.addFlashAttribute("message", message);
		ra.addFlashAttribute("alertType", alertType);
		
		return path;
	}
	
	
	// 후기 삭제
	@PostMapping("/reviewList/delete")
	@ResponseBody
	public int deleteReview(@RequestBody int reviewNo) {
	    return service.deleteReview(reviewNo);
	}
	
	
	// 후기 업데이트 페이지로 이동
	@GetMapping("/reviewList/updateReview/{reviewNo}")
	public String moveUpdateReview(@PathVariable("reviewNo") int reviewNo, Model model){
		
		Review review = service.selectReview(reviewNo);
		
		model.addAttribute("review", review);
		
		return "review/updateReview";
	}
	
	
	// 후기 업데이트 
	@PostMapping("/reviewList/update")
	public String updateReview(Review review, RedirectAttributes ra) {
		
		int result = service.updateReview(review);
		
		String alertType = null;
		String message = null;
		String path = null;
		
		if(result>0) {
			alertType = "success";
			message = "후기가 수정되었습니다.";
			path = "redirect:/review/reviewList";
		}else {
			alertType = "fail";
			message = "후기 수정에 실패하였습니다. 다시 시도해주세요.";
			path = "review/updateReview";
		}
		
		ra.addFlashAttribute("message", message);
		ra.addFlashAttribute("alertType", alertType);
		
		return path;
	}

}
