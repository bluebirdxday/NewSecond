package project.kh.newsecond.wish.model.service;

import java.util.List;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.wish.model.dto.Wish;

public interface WishService {

	
	/**관심상품 목록 글 조회
	 * @param wishUserNo
	 * @return
	 */
	List<GoodsBoard> wishList(int wishUserNo);


	
	
}
