package project.kh.newsecond.shop.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import project.kh.newsecond.common.utility.Util;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dao.ShopDAO;
import project.kh.newsecond.shop.model.dto.Follow;
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
	public List<GoodsBoard> selectGoodsBoardList(Map<String, Object> sortMap) {
		return dao.selectGoodsBoardList(sortMap);
	}

	// 상점 오픈일 조회
	@Override
	public int selectShopOpenDay(int userNo) {
		return dao.selectShopOpenDay(userNo);
	}

	
	// 팔로우 리스트 조회
	@Override
	public List<Follow> selectFollowList(Map<String, Integer> map) {
		return dao.selectFollowList(map);
	}

	// 팔로워 리스트 조회
	@Override
	public List<Follow> selectFollowerList(Map<String, Integer> map) {
		return dao.selectFollowerList(map);
	}

	// 팔로 유무 조회(로그인 유저->상점주인)
	@Override
	public int checkFollow(Map<String, Integer> map) {
		return dao.checkFollow(map);
	}


	
	// 상점 팔로우
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int follow(Follow follow) {
		return dao.follow(follow);
	}

	
	// 상점 언팔로우
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int unFollow(Follow unfollow) {
		return dao.unFollow(unfollow);
	}

	
	// 상점 편집
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateShopInfo(Shop shop, MultipartFile shopNewProfile, String webPath, String filePath) throws IllegalStateException, IOException{
		
		
		shop.setShopTitle(Util.XXSHandling(shop.getShopTitle()));
		shop.setShopInfo(Util.XXSHandling(shop.getShopInfo()));
		
		String oldShopProfile = shop.getShopProfile();
		String rename = null;
		
		if(shopNewProfile.getSize()>0) {
			rename = Util.fileRename(shopNewProfile.getOriginalFilename());
			
			shop.setShopProfile(webPath + rename);
			System.out.println("상점 편집 :" + shop.getShopProfile());
			
		}else {
			shop.setShopProfile(null);
		}
		
		
		int result = dao.updateShopInfo(shop);
		
		if(result>0) {
			
			if(rename!=null) {
				shopNewProfile.transferTo(new File(filePath + rename));
			}
			
		}else {
			shop.setShopProfile(oldShopProfile);
		}
		
		return result;
	}

	
	// 상품 게시글 리스트 조회 (인기순/낮은 가격순/ 높은 가격순)
	@Override
	public List<GoodsBoard> selectSortGoodsList(GoodsBoard goodsBoard) {
		return dao.selectSortGoodsList(goodsBoard);
	}




}
