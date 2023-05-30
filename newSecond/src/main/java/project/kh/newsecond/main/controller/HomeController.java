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

		// 최근 업데이트된 게시글 상품 10가지에 대한 리스트
		List<GoodsBoard> recentGoodsList10 = service.selectRecentGoodsList10();
		model.addAttribute("recentGoodsList10", recentGoodsList10);

		
		// 조회수 높은 인기 상품 10가지에 대한 리스트
		List<GoodsBoard> mostViewedList10 = service.selectMostViewedList10();
		model.addAttribute("mostViewedList10", mostViewedList10);

		
		// 카테고리 리스트
		List<Category> CaterogyList = service.selectCategoryList();
		
		// 카테고리 리스트를 세션에 저장 -> 다른 페이지 에서도 카테고리 리스트를 받을 수 있게 범위를 설정함.
		// 하지만 home을 경유하지 않고 사이트에 접속한다면 카테고리 리스트가 없을 수 있다.
		// -> 세션에 카테고리 리스트가 null이면 home에 리다이렉트되도록 설정함.
		session.setAttribute("categoryList", CaterogyList);
		

		return "common/home";
	}

}
