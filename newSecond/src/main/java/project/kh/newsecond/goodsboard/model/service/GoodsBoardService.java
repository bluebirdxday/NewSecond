package project.kh.newsecond.goodsboard.model.service;

import java.util.List;
import java.util.Map;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.user.model.dto.User;

public interface GoodsBoardService {
	
	
	// 지영
	// 상품 게시글 목록 조회(검색)
	Map<String, Object> selectSearchGoodsList(String searchName);

	// 상품 더보기 
	List<GoodsBoard> moreGoods(Map<String, Object> numAndSearchName);

	// 상품 게시글 상세 조회
	GoodsBoard goodsDetail(int goodsNo);

	// 기존 찜 여부 확인
	int goodsLikeChecked(Map<String, Object> map);

}
