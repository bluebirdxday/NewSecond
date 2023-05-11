package project.kh.newsecond.shop.model.service;

import java.util.List;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dto.Shop;


public interface ShopService {

	/** 내상점 정보 조회
	 * @param userNo
	 * @return shop
	 */
	Shop selectShopInfo(int userNo);

	/** 게시글 리스트 조회
	 * @param userNo
	 * @return board
	 */
	List<GoodsBoard> selectGoodsBoardList(int userNo);


}
