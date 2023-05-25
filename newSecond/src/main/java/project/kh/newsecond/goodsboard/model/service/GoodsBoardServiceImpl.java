package project.kh.newsecond.goodsboard.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.goodsboard.model.dao.GoodsBoardDAO;
import project.kh.newsecond.goodsboard.model.dto.Category;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dto.Shop;
import project.kh.newsecond.user.model.dto.User;

@Service
public class GoodsBoardServiceImpl implements GoodsBoardService{
	
	@Autowired
	private GoodsBoardDAO dao;
	
	
	// 지영
	// 상품 게시글 목록 조회(검색)
	 @Override
	public Map<String, Object> selectSearchGoodsList(Map<String, Object> paramMap) {
		 
		 // 검색 조건 일치하는 삭제x 특정 상품게시글 count
		 int searchGoodsCount = dao.searchGoodsCount(paramMap);
		 
		 // 검색 상품 목록 조회 
		 List<GoodsBoard> searchGoodsList = dao.selectSearchGoodsList(paramMap);
		 
		 Map<String, Object> map = new HashMap<>();
		 
		 map.put("searchGoodsCount", searchGoodsCount);
		 map.put("searchGoodsList", searchGoodsList);
		 
		return map;
	}
	 
	 // 상품 더보기
	 @Override
	public List<GoodsBoard> moreGoods(Map<String, Object> numAndSearchName) {
		return dao.moreGoods(numAndSearchName);
	}
	 
	 
	 // 상품 게시글 상세 조회
	 @Override
	public GoodsBoard goodsDetail(int goodsNo) {
		return dao.goodsDetail(goodsNo);
	}

	 
	/* 메인페이지 - 지환 */
	 
	// 최근 업데이트된 게시글 목록 5가지
	@Override
	public List<GoodsBoard> selectRecentGoodsList10() {
		
		
		List<GoodsBoard> RecentGoodsList10 = dao.selectRecentGoodsList10();
		
		return RecentGoodsList10;
	}
	
	
	// 조회수 높은 인기 상품 목록 10가지
	@Override
	public List<GoodsBoard> selectMostViewedList10() {
		
		List<GoodsBoard> selectMostViewedList10 = dao.selectMostViewedList10();
		
		return selectMostViewedList10;
	}
	
	// 카테고리 리스트
	@Override
	public List<Category> selectCategoryList() {
		
		List<Category> selectCategoryList = dao.selectCategoryList();
		
		return selectCategoryList;
	}
	
	// 카테고리에 해당되는 상품 리스트
	@Override
	public List<GoodsBoard> selectCategoryGoodsList(int categoryNo) {
		
		List<GoodsBoard> CategoryGoodsList = dao.selectCategoryGoodsList(categoryNo);
		
		return CategoryGoodsList;
	}
	
	// 카테고리 상품 리스트 더 보기
	@Override
	public List<GoodsBoard> moreCategoryGoods(Map<String, Object> numAndCategoryCode) {
		return dao.moreCategoryGoods(numAndCategoryCode);
	}
	
	

	// 기존 찜 여부 확인
	@Override
	public int goodsLikeChecked(Map<String, Object> map) {
		return dao.goodsLikeChecked(map);
	}
	
	

	

	// 찜 처리 
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int like(Map<String, Integer> likeMap) {
		int result = 0;
		if(likeMap.get("check")==0) {
			result = dao.insertLike(likeMap);
		}else {
			result = dao.deleteLike(likeMap);
		}
		
		if(result==0) return -1;
		
		int count = dao.countLike(likeMap.get("goodsNo"));
		return count;
	}
	
	// 상품 상세 - 상점 정보
	@Override
	public Shop shopInfo(int goodsNo) {
		return dao.shopInfo(goodsNo);
	}
	
	// 조회수 증가 
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateViewCount(int goodsNo) {
		return dao.updateViewCount(goodsNo);
	}

	
	 
	 
	 
	 
	 

}
