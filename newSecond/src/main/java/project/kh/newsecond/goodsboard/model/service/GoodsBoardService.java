package project.kh.newsecond.goodsboard.model.service;

import java.util.List;
import java.util.Map;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;

public interface GoodsBoardService {
	
	
	// 지영
	// 상품 게시글 목록 조회(검색)
	Map<String, Object> selectSearchGoodsList(String searchName);

	// 상품 더보기 
	List<GoodsBoard> moreGoods(Map<String, Object> numAndSearchName);

	// 상품 게시글 상세 조회
	GoodsBoard goodsDetail(int goodsNo);
	
	
	/* 메인페이지 - 지환 */
	
	// 최근 업데이트된 게시글 상품 5가지
	List<GoodsBoard> selectRecentGoodsList5();

	// 조회수 높은 인기 상품 목록 10가지
	List<GoodsBoard> selectMostViewedList10();
	
	// 로그인 유저 기준 최근 본 상품 5가지
	/* List<GoodsBoard> selectrecentViewedList5(); */
	
	
	
	

}
