package project.kh.newsecond.shop.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dto.Shop;

@Repository
public class ShopDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 내 상점 정보 조회
	public Shop selectShopInfo(int userNo) {
		return sqlSession.selectOne("shopMapper.selectShopInfo", userNo);
	}
	
	// 게시글 리스트 조회
	public List<GoodsBoard> selectGoodsBoardList(int userNo) {
		return sqlSession.selectList("goodsBoardMapper.selectGoodsBoardList", userNo);
	}

	// 상점 오픈일 조회
	public int selectShopOpenDay(int userNo) {
		return sqlSession.selectOne("shopMapper.selectShopOpenDay", userNo);
	}

}
