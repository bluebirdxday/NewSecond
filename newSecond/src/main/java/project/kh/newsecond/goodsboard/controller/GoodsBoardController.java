package project.kh.newsecond.goodsboard.controller;

import java.util.HashMap;
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
import project.kh.newsecond.shop.model.dto.Shop;
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

		return service.moreGoods(numAndSearchName);
	}
	
	// 상품 게시글 상세 조회
	@GetMapping("/{goodsNo}")
	public String goodsDetail(
			@PathVariable("goodsNo") int goodsNo,
			Model model,
			@SessionAttribute(value="loginUser", required=false) User loginUser
			) {
		
		GoodsBoard goodsBoard = service.goodsDetail(goodsNo);
		
		String path = null;
		
		// 기존 찜 조회
		Map<String, Object> map = new HashMap<>();
		map.put("goodsNo", goodsNo);
		
		if(goodsBoard != null) {
			if(loginUser != null) {
				map.put("userNo", loginUser.getUserNo());
				int result = service.goodsLikeChecked(map);
				if(result>0) model.addAttribute("likeChecked","like");
			}
		}
		
		model.addAttribute("goodsBoard", goodsBoard);
		model.addAttribute("loginUser", loginUser);
		
		// 상점 정보
		// 전달 : 프로필, 유저넘버, 상점이름, 상점 설명 
		Shop shop = service.shopInfo(goodsNo);
		model.addAttribute("shop",shop);
		
		return "/goods/goodsDetail";
	}
	
	// 찜(좋아요) 증가 
	@PostMapping("/like")
	@ResponseBody
	public int like(@RequestBody Map<String, Integer> likeMap) {
		System.out.println(likeMap);
		return service.like(likeMap);
	}
	
	
	// 조회수 증가
	
	
	
	// 게시글 상세 조회에서 판매자 상정 바로가기
	@GetMapping("/goodsDetail/moveShop")
	public String moveShop() {
		return "/shop/shop";
	}
	
	
	

}
