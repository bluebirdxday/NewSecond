package project.kh.newsecond.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@GetMapping("/myShop")
	public String shop(){
		return "shop/myShop";
	}
}
