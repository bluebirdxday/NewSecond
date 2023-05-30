package project.kh.newsecond.goodsboard.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import project.kh.newsecond.goodsboard.model.dto.Category;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.goodsboard.model.service.GoodsBoardService;
import project.kh.newsecond.shop.model.dto.Shop;
import project.kh.newsecond.user.model.dto.User;

@Controller
@RequestMapping("/goods")
@SessionAttributes({ "loginUser" })
public class GoodsBoardController {

	@Autowired
	private GoodsBoardService service;

	// 지영
	// 상품 게시글 목록 조회(검색)
	@GetMapping("/search/goodsList")
	public String selectSearchGoodsList(@RequestParam(value="query", required=false)String searchName, 
			Model model) {
		String query = searchName.replaceAll("<[^>]*>", "");
		Map<String, Object> map = service.selectSearchGoodsList(query);
		
		// 조회 결과
		model.addAttribute("map", map);
		model.addAttribute("query", query);

		return "goods/searchGoodsList";
	}
	
	
	// 상품 게시글 목록 최신순/낮은가격순/높은가격순/인기순(조회수순)
	@ResponseBody
	@GetMapping(value="/search/sortGoodsList", produces = "application/json; charset=UTF-8")
	public List<GoodsBoard> selectSortedList(@RequestParam(value="listSort", required=false)String listSort,
			@RequestParam(value="query", required=false)String query){
		
		System.out.println(query);
		Map<String, String> map = new HashMap<>();
		map.put("listSort", listSort);
		map.put("query", query);
		
		System.out.println(service.selectSortedList(map));
		
		return service.selectSortedList(map);
	}
	
	
	
	// 상품 게시글 추가 조회 (더보기)
	@PostMapping("/searchMore")
	@ResponseBody
	public List<GoodsBoard> searchMoreGoodsList(@RequestBody Map<String, Object> numAndSearchName) {

		return service.moreGoods(numAndSearchName);
	}
	
	
	// 상품 게시글 상세 조회
	@GetMapping("/{goodsNo}")
	public String goodsDetail(@PathVariable("goodsNo") int goodsNo, Model model,
			@SessionAttribute(value = "loginUser", required = false) User loginUser, HttpServletRequest req, // 조회수
			HttpServletResponse resp) throws ParseException {

		GoodsBoard goodsBoard = service.goodsDetail(goodsNo);

		String path = null;

		// 기존 찜 조회
		Map<String, Object> map = new HashMap<>();
		map.put("goodsNo", goodsNo);

		if (goodsBoard != null) {
			if (loginUser != null) {
				map.put("userNo", loginUser.getUserNo());
				int result = service.goodsLikeChecked(map);
				if (result > 0)
					model.addAttribute("likeChecked", "like");
			}
			// 조회수
			if (loginUser == null || loginUser.getUserNo() != goodsBoard.getUserNo()) {
				Cookie c = null;
				Cookie[] cookies = req.getCookies();
				if (cookies != null) {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("readGoodsNo")) {
							c = cookie;
							break;
						}
					}
				}
				int result = 0;
				if (c == null) {
					c = new Cookie("readGoodsNo", "|" + goodsNo + "|");
					result = service.updateViewCount(goodsNo);
				} else {
					if (c.getValue().indexOf("|" + goodsNo + "|") == -1) {
						c.setValue(c.getValue() + "|" + goodsNo + "|");
						result = service.updateViewCount(goodsNo);
					}
				}
				if (result > 0) { // 조회 수 증가 성공하면 쿠키 적용 경로, 수명 지
					goodsBoard.setViewCount(goodsBoard.getViewCount() + 1);
					c.setPath("/"); // /이하 경로 요청 시 쿠키 서버로 전달
					Calendar cal = Calendar.getInstance();
					cal.add(cal.DATE, 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date a = new Date();
					Date temp = new Date(cal.getTimeInMillis());
					Date b = sdf.parse(sdf.format(temp));
					long diff = (b.getTime() - a.getTime()) / 1000;
					c.setMaxAge((int) diff);
					resp.addCookie(c);
				}
			}
		}
		model.addAttribute("goodsBoard", goodsBoard);
		model.addAttribute("loginUser", loginUser);
		// 상점 정보
		Shop shop = service.shopInfo(goodsNo);
		model.addAttribute("shop", shop);

		return "/goods/goodsDetail";
	}

	// 찜(좋아요) 증가
	@PostMapping("/like")
	@ResponseBody
	public int like(@RequestBody Map<String, Integer> likeMap) {
		System.out.println(likeMap);
		return service.like(likeMap);
	}

	// 게시글 상세 조회에서 판매자 상정 바로가기
	@GetMapping("/goodsDetail/moveShop")
	public String moveShop() {
		return "/shop/shop";
	}

	/* 지환 - 카테고리 조회 */

	// 상품 게시글 카테고리 별조회
	@GetMapping("/category/{categoryNo:[0-9]+}")
	public String selectCategoryGoodsList(@PathVariable(value = "categoryNo", required = false) int categoryNo,
			@SessionAttribute(value = "categoryList", required = false) List<Category> category, Model model) {

		String categoryName = null;

		// categoryName
		if (categoryNo == 100) { // 최근 업데이트된 상품

			categoryName = "최근 업데이트된 상품";

		} else if (categoryNo == 200) { // 조회수 높은 인기 상품

			categoryName = "조회수 높은 인기 상품";

		// 카테고리 게시판은 카테고리 숫자,코드(PathVariable)를 통해서 접근이 가능하다.
		// 그런데 카테고리 테이블에 없는 숫자가 나올경우 DB에 존재하지 않는다 -> 이름을 얻을 수 없다.
		// 잘못된 접근(URL을 통한 의도하지 않은 접근)이므로 에러 페이지로 포워드 시킨다.
		} else if (category.get(categoryNo - 1).getCategoryName() == null) { 

			return "common/error";

		} else { 
			categoryName = category.get(categoryNo - 1).getCategoryName();
		}

		List<GoodsBoard> categoryGoodsList = null;

		// list
		if (categoryNo == 100) { // 최근 업데이트된 상품

			categoryGoodsList = service.selectRecentGoodsListAll();

		} else if (categoryNo == 200) { // 조회수 높은 인기 상품

			categoryGoodsList = service.selectMostViewedListAll();

		} else {

			categoryGoodsList = service.selectCategoryGoodsList(categoryNo);

		}

		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("categoryGoodsList", categoryGoodsList);

		return "goods/selectCategoryGoodsList";
	}

	// 카테고리 상품 게시글 추가 조회 (더보기)
	@PostMapping("/categoryMore")
	@ResponseBody
	public List<GoodsBoard> searchCategoryGoodsList(@RequestBody Map<String, Object> numAndCategoryCode) {

		List<GoodsBoard> moreList = null;
		
		if ((int)numAndCategoryCode.get("categoryCode") == 100) { // 최근 업데이트된 상품
			
			moreList = service.moreRecentGoodsListAll(numAndCategoryCode);

		} else if ((int)numAndCategoryCode.get("categoryCode") == 200) { // 조회수 높은 인기 상품

			moreList = service.moreMostViewedListAll(numAndCategoryCode);
			
		} else {

			moreList = service.moreCategoryGoods(numAndCategoryCode);
			
		}

		// moreList의 경우 지영님의 검색 리스트를 참고해서 만든게 커서 지영님의 코드를 참조 해야한다.

		return moreList;
	}

}
