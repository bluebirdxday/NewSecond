package project.kh.newsecond.shop.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;

@Repository
public class ShopDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시글 리스트 조회
	public List<GoodsBoard> selectGoodsBoardList(int userNo) {
		return sqlSession.selectList("goodsBoardMapper.selectGoodsBoardList", userNo);
	}

}
