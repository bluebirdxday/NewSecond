package project.kh.newsecond.wish.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.wish.model.dao.WishDAO;
import project.kh.newsecond.wish.model.dto.Wish;
@Service
public class WishServiceImpl implements WishService {

	@Autowired 
	private WishDAO wishDao;

	/**
	 *관심상품 목록 글 조회
	 */
	@Override
	public List<GoodsBoard> wishList(int wishUserNo) {
		
		return wishDao.wishList(wishUserNo);
	}

	

}
