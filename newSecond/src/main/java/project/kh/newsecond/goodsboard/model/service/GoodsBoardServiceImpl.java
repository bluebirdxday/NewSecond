package project.kh.newsecond.goodsboard.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.goodsboard.model.dao.GoodsBoardDAO;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;

@Service
public class GoodsBoardServiceImpl implements GoodsBoardService{
	
	@Autowired
	private GoodsBoardDAO dao;
	
	
	// 지영
	// 상품 게시글 목록 조회(검색)
	 @Override
	public Map<String, Object> selectSearchGoodsList(String searchName) {
		 
		 // 검색 조건 일치하는 삭제x 특정 상품게시글 count
		 int searchGoodsCount = dao.searchGoodsCount(searchName);
		 
		 // 검색 상품 목록 조회 
		 List<GoodsBoard> searchGoodsList = dao.selectSearchGoodsList(searchName);
		 
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
	public List<GoodsBoard> selectRecentGoodsList5() {
		return dao.selectRecentGoodsList5();
	}
	
	// 로그인 유저 기준 최근 본 상품 5가지
	/* @Override */
	/*public List<GoodsBoard> selectrecentViewedList5() {
		// TODO Auto-generated method stub
		return dao.selectrecentViewedList5();
	}*/
	
	// 조회수 높은 인기 상품 목록 10가지
	/*@Override*/
	/*public List<GoodsBoard> selectMostViewedList10() {
		// TODO Auto-generated method stub
		return dao.selectMostViewedList10();
	}*/
	 
	 
	 
	 
	 
	 

}
