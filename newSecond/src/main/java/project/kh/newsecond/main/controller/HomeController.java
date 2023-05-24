package project.kh.newsecond.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import project.kh.newsecond.goodsboard.model.dto.Category;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.goodsboard.model.service.GoodsBoardService;
import project.kh.newsecond.user.model.dto.User;


@Controller
public class HomeController {

	@Autowired
	private GoodsBoardService service;

	@RequestMapping("/")
	public String homeForward(User loginUser, Model model, HttpSession session) {

		// 최근 업데이트된 게시글 상품 5가지에 대한 리스트
		List<GoodsBoard> recentGoodsList5 = service.selectRecentGoodsList5();
		model.addAttribute("recentGoodsList5", recentGoodsList5);

		
		// 조회수 높은 인기 상품 10가지에 대한 리스트
		List<GoodsBoard> mostViewedList10 = service.selectMostViewedList10();
		model.addAttribute("mostViewedList10", mostViewedList10);
		 
		
		// 카테고리 리스트
		List<Category> CaterogyList = service.selectCategoryList();
		
		session.setAttribute("categoryList", CaterogyList);
		
		/*
		 * if(loginUser != null) { List<GoodsBoard> recentViewedList =
		 * service.selectrecentViewedList5(); model.addAttribute(recentViewedList); }
		 */

		return "common/home";
	}

}
