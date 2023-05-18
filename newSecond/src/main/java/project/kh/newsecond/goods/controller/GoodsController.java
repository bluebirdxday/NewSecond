package project.kh.newsecond.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import project.kh.newsecond.goods.model.service.GoodsService;
import project.kh.newsecond.user.model.dto.User;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	// 게시글 상세 조회
	@GetMapping("/{goodsTitle}")
	public String goodsDetail(
			@PathVariable("goodsTitle") int goodsTitle,
			Model model,
			@SessionAttribute(value="loginUser", required=false) User loginUser) {
		
		
		
//		GoodsBoard goodsBoard = service.selectGoodsBoard(map);
		return "/goods/goodsDetail";
	}
	
	@GetMapping("/goodsDetail/moveShop")
	public String moveShop() {
		return "/shop/shop";
	}
	

}
