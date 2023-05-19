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
	 
	 @Override
	public List<GoodsBoard> moreGoods(Map<String, Object> numAndSearchName) {
		return dao.moreGoods(numAndSearchName);
	}

}
