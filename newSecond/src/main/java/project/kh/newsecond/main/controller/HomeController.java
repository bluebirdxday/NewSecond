package project.kh.newsecond.main.controller;

import java.util.HashMap;
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

		// 최근 업데이트된 게시글 상품 5가지에 대한 리스트
		List<GoodsBoard> recentGoodsList5 = service.selectRecentGoodsList5();
		model.addAttribute("recentGoodsList5", recentGoodsList5);

		
		// 조회수 높은 인기 상품 10가지에 대한 리스트
		List<GoodsBoard> mostViewedList10 = service.selectMostViewedList10();
		model.addAttribute("mostViewedList10", mostViewedList10);
		 
		
		/*
		 * if(loginUser != null) { List<GoodsBoard> recentViewedList =
		 * service.selectrecentViewedList5(); model.addAttribute(recentViewedList); }
		 */

		return "common/home";
	}

}
