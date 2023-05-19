package project.kh.newsecond.shop.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dto.Follow;
import project.kh.newsecond.shop.model.dto.Shop;
import project.kh.newsecond.user.model.dto.User;

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

	
	// 팔로우 리스트 조회
	public List<Follow> selectFollowList(Map<String, Integer> map) {
		return sqlSession.selectList("followMapper.selectFollowList", map);
	}

	// 팔로워 리스트 조회
	public List<Follow> selectFollowerList(Map<String, Integer> map) {
		return sqlSession.selectList("followMapper.selectFollowerList", map);
	}


	// 팔로 유무 조회(로그인 유저->상점주인)
	public int checkFollow(Map<String, Integer> map) {
		return sqlSession.selectOne("followMapper.checkFollow", map);
	}


	// 상점 팔로우
	public int follow(Follow follow) {
		return sqlSession.insert("followMapper.follow", follow);
	}

	// 상점 언팔로우
	public int unFollow(Follow unfollow) {
		return sqlSession.delete("followMapper.unFollow", unfollow);
	}


	// 상점 편집
	public int updateShopInfo(Shop shop) {
		return sqlSession.update("shopMapper.updateShopInfo", shop);
	}

}
