package project.kh.newsecond.shop.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dao.ShopDAO;
import project.kh.newsecond.shop.model.dto.Following;
import project.kh.newsecond.shop.model.dto.Shop;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDAO dao;

	

	// 내 상점 정보 조회
	@Override
	public Shop selectShopInfo(int userNo) {
		return dao.selectShopInfo(userNo);
	}
	
	// 게시글 리스트 조회
	@Override
	public List<GoodsBoard> selectGoodsBoardList(int userNo) {
		return dao.selectGoodsBoardList(userNo);
	}

	// 상점 오픈일 조회
	@Override
	public int selectShopOpenDay(int userNo) {
		return dao.selectShopOpenDay(userNo);
	}

	// 팔로잉 리스트 조회
	@Override
	public List<Following> selectFollowingList(int userNo) {
		return dao.selectFollowingList(userNo);
	}


}
