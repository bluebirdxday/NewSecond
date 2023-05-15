package project.kh.newsecond.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import project.kh.newsecond.goods.model.service.GoodsService;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService service;
	
	@GetMapping("/goodsList/goodsDetail")
	public String goodsDetail() {
		return "/goods/goodsDetail";
	}
	
	@GetMapping("/goodsDetail/moveShop")
	public String moveShop() {
		return "/shop/myShop";
	}

}
