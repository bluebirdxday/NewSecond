package project.kh.newsecond.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dto.Follow;
import project.kh.newsecond.shop.model.dto.Shop;
import project.kh.newsecond.shop.model.service.ShopService;
import project.kh.newsecond.user.model.dto.User;

@Controller
@RequestMapping("/shop")
@SessionAttributes({"loginUser"})
public class ShopController {
	
	@Autowired
	private ShopService service;

	// 회원 상점 조회
	@GetMapping("/{userNo}")
	public String shop(@PathVariable("userNo") int userNo, Model model,
			@SessionAttribute(value="loginUser", required=false) User loginUser){
		
		
		Shop shop = service.selectShopInfo(userNo);
		int loginUserNo = loginUser.getUserNo();
		int openDays = service.selectShopOpenDay(userNo);
		
		List<GoodsBoard> boardList = service.selectGoodsBoardList(userNo);
	
		Map<String, Integer> map = new HashMap<>();
		map.put("activeUserNo", loginUserNo);
		map.put("passiveUserNo", userNo);
		
		List<Follow> followList = service.selectFollowList(map); 
		List<Follow> followerList = service.selectFollowerList(map);

		// loginUser -> userNo 팔로 유무 조회
		int checkFollow = service.checkFollow(map);
		
		
		model.addAttribute("shop", shop);
		model.addAttribute("goodsBoardList", boardList);
		model.addAttribute("openDays", openDays);
		model.addAttribute("followList", followList);
		model.addAttribute("followerList", followerList);
		model.addAttribute("loginUserNo", loginUserNo);
		model.addAttribute("checkFollow", checkFollow);
	
		
		return "shop/shop";
	}
	
	
	// 상점 팔로우
	@PostMapping("/follow")
	@ResponseBody
	public int follow(@RequestBody Follow follow) {		
		return service.follow(follow);
	}
	
	
	// 상점 언팔로우
	@PostMapping("/unFollow")
	@ResponseBody
	public int unFollow(@RequestBody Follow unfollow) {
		return service.unFollow(unfollow);
	}
	
	
	// 상점 편집
//	@PostMapping("/updateShopInfo")
//	public String updateShopInfo(@RequestParam("shopProfile") MultipartFile shopProfile, String shopInfo, String shopTitle,
//			@SessionAttribute("loginUser") User loginUser, RedirectAttributes ra, HttpSession session) {
//		
//		
//		String webPath = "/resources/src/profile/" + loginUser.getUserNo();
//		String filePath = session.getServletContext().getRealPath(webPath);
//		
//		int result = service.updateShopInfo(shopProfile, shopInfo, shopTitle, webPath, filePath, loginUser);
//		
//		String message = null;
//		String alertType = null;
//		
//		if(result>0) {
//			alertType = "success";
//			message = "수정 완료";
//		}else {
//			alertType = "fail";
//			message = "수정 실패";
//		}
//		
//		ra.addAttribute("message", message);
//		ra.addAttribute("alertType", alertType);
//		
//		
//		return "redirect:/shop/shop";
//	}
	
	
}
