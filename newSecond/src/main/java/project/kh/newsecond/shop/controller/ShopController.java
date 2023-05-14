package project.kh.newsecond.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dto.Following;
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
	public String shop(@SessionAttribute(value="loginUser", required=false) User loginUser,
			@PathVariable("userNo") int userNo,
			Model model){
		
		
		Shop shop = service.selectShopInfo(userNo);
		List<GoodsBoard> boardList = service.selectGoodsBoardList(userNo);
		List<Following> followingList = service.selectFollowingList(userNo);

		int openDays = service.selectShopOpenDay(userNo);
		
		
		model.addAttribute("followingList", followingList);
		model.addAttribute("shop", shop);
		model.addAttribute("goodsBoardList", boardList);
		model.addAttribute("openDays", openDays);
		model.addAttribute("loginUser", loginUser);
		
		return "shop/shop";
	}
	
	
	
	
}
