package project.kh.newsecond.wish.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.goodsboard.model.service.GoodsBoardService;
import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.wish.model.dto.Wish;
import project.kh.newsecond.wish.model.service.WishService;


@Controller
@SessionAttributes({"loginUser"})
public class WishController {

	@Autowired
	private WishService wishService;
	
	@Autowired
	private GoodsBoardService goodsBodardservice;
	
	@GetMapping("/wish")
	public String wish(
			@SessionAttribute(value="loginUser", required=false) User loginUser,
			Wish wish, Model model){
		
			int wishUserNo = loginUser.getUserNo();
			List<GoodsBoard> wishList = wishService.wishList(wishUserNo);
			model.addAttribute("wishList", wishList);
		
		
		return "wish/wish";
	
}




		
	

	
}
