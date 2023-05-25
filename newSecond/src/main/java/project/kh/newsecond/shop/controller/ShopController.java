package project.kh.newsecond.shop.controller;

import java.io.IOException;
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
			
		int loginUserNo = 0;
		
		if(loginUser!=null) {
			loginUserNo = loginUser.getUserNo();
		}
		
		int openDays = service.selectShopOpenDay(userNo);
		
		
		Map<String, Object> sortMap = new HashMap<>();
		sortMap.put("userNo", userNo);
		sortMap.put("sortType", 0);
		
		
		// 최신순 조회
		List<GoodsBoard> boardList = service.selectGoodsBoardList(sortMap);
	
		
		// userNo 넣고 shopUserNo 넣고 
		Map<String, Integer> map = new HashMap<>();
		map.put("passiveUserNo", userNo);
		
		if(loginUser!=null) {
			map.put("activeUserNo", loginUserNo);
		}else {
			map.put("activeUserNo", 2);
		}

		int checkFollow = service.checkFollow(map);
				
		
		List<Follow> followList = service.selectFollowList(map); 
		List<Follow> followerList = service.selectFollowerList(map);

		
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
	
	
	// 팔로잉/팔로워 리스트 조회
	@GetMapping(value="/selectFollowList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Follow> selectFollowList(@RequestParam("tab") String tab, @RequestParam("shopUserNo") int shopUserNo, @RequestParam("loginUserNo") int loginUserNo){
		

		Map<String, Integer> map = new HashMap<>();
		map.put("activeUserNo", loginUserNo);
		map.put("passiveUserNo", shopUserNo);

		
		if(tab.equals("following")) {
			return service.selectFollowList(map); 
		}
		
		if(tab.equals("follower")) {
			return service.selectFollowerList(map);
		}
		
		return null;
	}
	
	
	// 상점 편집
	@PostMapping("/updateShopInfo")
	public String updateShopInfo(@RequestParam(value="shopNewProfile", required=false) MultipartFile shopNewProfile, Shop shop,
			RedirectAttributes ra, HttpSession session) throws IllegalStateException, IOException {
		
		
		if(shopNewProfile.getSize()==0) {
			shop.setShopProfile(service.selectShopInfo(shop.getUserNo()).getShopProfile());
		}
		
		int userNo = shop.getUserNo();
		String webPath = "/resources/src/img/profile/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int result = service.updateShopInfo(shop, shopNewProfile,  webPath, filePath);
		
		String message = null;
		String alertType = null;
		
		if(result>0) {
			alertType = "success";
			message = "수정 완료";
		}else {
			alertType = "fail";
			message = "수정 실패";
		}
		
		ra.addFlashAttribute("message", message);
		ra.addFlashAttribute("alertType", alertType);
		
		
		return "redirect:/shop/" + userNo;
	}
	
	
	// 상품 게시글 리스트 조회 (인기순/낮은 가격순/ 높은 가격순)
	@PostMapping("/sortGoodsList")
	@ResponseBody
	public List<GoodsBoard> sortGoodsList(@RequestBody GoodsBoard goodsBoard) {
		
		return service.selectSortGoodsList(goodsBoard);
	}
	
}
