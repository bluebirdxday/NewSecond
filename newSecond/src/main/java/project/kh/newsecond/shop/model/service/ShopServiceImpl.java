package project.kh.newsecond.shop.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dao.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDAO dao;

	// 게시글 리스트 조회
	@Override
	public List<GoodsBoard> selectGoodsBoardList(int userNo) {
		return dao.selectGoodsBoardList(userNo);
	}


}
