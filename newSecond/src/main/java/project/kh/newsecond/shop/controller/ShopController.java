package project.kh.newsecond.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.service.ShopService;
import project.kh.newsecond.user.model.dto.User;

@Controller
@RequestMapping("/shop")
@SessionAttributes({"loginUser"})
public class ShopController {
	
	@Autowired
	private ShopService service;

	// 로그인한 회원의 상점 조회
	@GetMapping("/myShop")
	public String shop(@SessionAttribute(value="loginUser", required=false) User loginUser,
			Model model){
		
		int userNo = loginUser.getUserNo();
		
		List<GoodsBoard> board = service.selectGoodsBoardList(userNo);

		if(board!=null) {
			model.addAttribute("goodsBoardList", board);
		}
		
		model.addAttribute("loginUser", loginUser);
		
		return "shop/myShop";
	}
	
	
	
	
}
