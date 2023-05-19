package project.kh.newsecond.goodsboard.model.service;

import java.util.Map;

public interface GoodsBoardService {
	
	
	// 지영
	// 상품 게시글 목록 조회(검색)
		Map<String, Object> selectSearchGoodsList(String searchName);

}
