package project.kh.newsecond.wish.model.service;

import java.util.List;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.wish.model.dto.Wish;

public interface WishService {

	
	List<Wish> wishList(int userNo);


	
	
}
