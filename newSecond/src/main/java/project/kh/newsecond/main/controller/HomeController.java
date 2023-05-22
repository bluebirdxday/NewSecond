package project.kh.newsecond.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.goodsboard.model.service.GoodsBoardService;
import project.kh.newsecond.user.model.dto.User;

@Controller
public class HomeController {
	
	@Autowired
	private GoodsBoardService service;
	
	@RequestMapping("/")
	public String homeForward(User loginUser, Model model) {
		
		List<GoodsBoard> recentGoodsList = service.selectRecentGoodsList5();
		model.addAttribute(recentGoodsList);
		/*
		 * List<GoodsBoard> mostViewedList = service.selectMostViewedList10();
		 * model.addAttribute(mostViewedList);
		 */
		/*
		 * if(loginUser != null) { List<GoodsBoard> recentViewedList =
		 * service.selectrecentViewedList5(); model.addAttribute(recentViewedList); }
		 */
		
		return "common/home";
	}
	
	
	
}
