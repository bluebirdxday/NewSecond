package project.kh.newsecond.goodsboard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@PostMapping("/searchMore")
	@ResponseBody
	public List<GoodsBoard> searchMoreGoodsList(@RequestBody Map<String, Object> numAndSearchName){
//		int startCallNum = (int)(numAndSearchName.get("startCallNum"));
//		int untilNum = (int)(numAndSearchName.get("untilNum"));
//		String searchName = (String)(numAndSearchName.get("searchName"));
//		 
		return service.moreGoods(numAndSearchName);
	}
	
	// 상품 게시글 상세 조회
	@GetMapping("/{goodsNo}")
	public String goodsDetail(
			@PathVariable("goodsNo") int goodsNo,
			Model model
//			@SessionAttribute(value="loginUser", required=false) User loginUser
			) {
		
		GoodsBoard goodsBoard = service.goodsDetail(goodsNo);
		System.out.println(goodsBoard);
		
		model.addAttribute("goodsBoard", goodsBoard);
		
		return "/goods/goodsDetail";
	}
	
	// 상품 이미지 리스트 조회
	
	
	
	// 조회수 증가
	
	
	// 찜(좋아요) 증가 
	
	
	// 게시글 상세 조회에서 판매자 상정 바로가기
	@GetMapping("/goodsDetail/moveShop")
	public String moveShop() {
		return "/shop/shop";
	}
	
	
	

}
