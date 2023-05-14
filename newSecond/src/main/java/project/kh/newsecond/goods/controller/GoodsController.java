package project.kh.newsecond.goods.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GoodsController {
	
	@GetMapping("/goodsList/goodsDetail")
	public String goodsDetail() {
		return "/goods/goodsDetail";
	}
	
	@GetMapping("/goodsDetail/moveShop")
	public String moveShop() {
		return "/shop/myShop";
	}

}
