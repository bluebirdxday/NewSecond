package project.kh.newsecond.goodsboard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.goodsboard.model.service.GoodsBoardService;
import project.kh.newsecond.user.model.dto.User;

@Controller
@RequestMapping("/goods")
public class GoodsBoardController {
	
	@Autowired
	private GoodsBoardService service;
	
	// 지영
	// 상품 게시글 목록 조회(검색)
	@GetMapping("/search/goodsList")
	public String selectSearchGoodsList(@RequestParam(value="query", required=false)String searchName, Model model) {
	
		Map<String, Object> map = service.selectSearchGoodsList(searchName);
		
		// 조회 결과
		model.addAttribute("map", map);
		
		return "goods/searchGoodsList";
	}
	
	// 상품 게시글 추가 조회 (더보기)
	@PostMapping(value="/searchMore", produces="application/json; charset=UTF-8")
	public List<GoodsBoard> searchMoreGoodsList(String searchName){
		
		
		
		
		return null;
	}
	
	// 지영
	// 상품 게시글 상세 조회
	@GetMapping("/{goodsTitle}")
	public String goodsDetail(
			@PathVariable("goodsTitle") int goodsTitle,
			Model model,
			@SessionAttribute(value="loginUser", required=false) User loginUser) {
		
//		GoodsBoard goodsBoard = service.selectGoodsBoard(map);
		return "/goods/goodsDetail";
	}
	
	// 지영
	// 게시글 상세 조회에서 판매자 상정 바로가기
	@GetMapping("/goodsDetail/moveShop")
	public String moveShop() {
		return "/shop/shop";
	}
	
	
	

}
