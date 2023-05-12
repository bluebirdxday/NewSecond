package project.kh.newsecond.shop.model.service;

import java.util.List;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;


public interface ShopService {


	/** 게시글 리스트 조회
	 * @param userNo
	 * @return board
	 */
	List<GoodsBoard> selectGoodsBoardList(int userNo);


}
