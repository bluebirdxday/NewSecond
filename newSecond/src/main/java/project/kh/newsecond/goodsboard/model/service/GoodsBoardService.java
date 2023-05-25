package project.kh.newsecond.goodsboard.model.service;

import java.util.List;
import java.util.Map;

import project.kh.newsecond.goodsboard.model.dto.Category;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dto.Shop;

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
	List<GoodsBoard> selectRecentGoodsList10();
	
	// 최근 업데이트된 게시글 상품 불러오기
	List<GoodsBoard> selectRecentGoodsListAll();
	
	// 최근 업데이트된 게시글 상품 불러오기 more버튼
	List<GoodsBoard> moreRecentGoodsListAll(Map<String, Object> numAndCategoryCode);

	// 조회수 높은 인기 상품 목록 10가지
	List<GoodsBoard> selectMostViewedList10();
	
	// 조회수 높은 인기 상품 목록 불러오기
	List<GoodsBoard> selectMostViewedListAll();
	
	// 조회수 높은 인기 상품 목록 불러오기 more버튼
	List<GoodsBoard> moreMostViewedListAll(Map<String, Object> numAndCategoryCode);
	
	
	/* 카테고리 조회 - 지환 */
	
	// 카테고리 리스트
	List<Category> selectCategoryList();
	
	// 카테고리에 해당되는 상품 리스트
	List<GoodsBoard> selectCategoryGoodsList(int categoryNo);
	
	// 카테고리 상품 리스트 더 보기
	List<GoodsBoard> moreCategoryGoods(Map<String, Object> numAndCategoryCode);
	

	// 기존 찜 여부 확인
	int goodsLikeChecked(Map<String, Object> map);

	// 찜 처리
	int like(Map<String, Integer> likeMap);

	// 상품 게시글 - 상점 정보
	Shop shopInfo(int goodsNo);

	// 조회수 증가
	int updateViewCount(int goodsNo);
	
	
	
	
	


}
