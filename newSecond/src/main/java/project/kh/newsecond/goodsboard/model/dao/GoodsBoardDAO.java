package project.kh.newsecond.goodsboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;

@Repository
public class GoodsBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	// 지영 
	/** 상품 게시글 수 count
	 * @param searchName
	 * @return searchGoodsCount
	 */
	public int searchGoodsCount(String searchName) {
		
		return sqlSession.selectOne("goodsBoardMapper.searchGoodsCount", searchName);
	}

	/** 검색 상품 목록 조회 
	 * @param searchName
	 * @return searchGoodsList
	 */
	public List<GoodsBoard> selectSearchGoodsList(String searchName) {
		return sqlSession.selectList("goodsBoardMapper.selectSearchGoodsList", searchName);
	}


	/** 더보기
	 * @param startCallNum
	 * @param untilNum
	 * @param searchName
	 * @return moreGoodsList
	 */
	public List<GoodsBoard> moreGoods(Map<String, Object> numAndSearchName) {
		
		return sqlSession.selectList("goodsBoardMapper.moreGoods", numAndSearchName);
	}

	
	/** 상품 게시글 상세 조회
	 * @param goodsTitle
	 * @return goodsBoard
	 */
	public GoodsBoard goodsDetail(int goodsNo) {
		return sqlSession.selectOne("goodsBoardMapper.goodsDetail", goodsNo);
	}


	
	/* 메인 페이지 - 지환 */
	/**	최근 업데이트된 상품 5가지
	 * @param rowBounds 
	 * @return List
	 */
	public List<GoodsBoard> selectRecentGoodsList5() {
		
		RowBounds rowBounds = new RowBounds(0, 5);
		return sqlSession.selectList("goodsBoardMapper.selectRecentGoodsList", null ,rowBounds);
	}

	/** 조회수가 높은 상품 10가지
	 * @return
	 */
	public List<GoodsBoard> selectMostViewedList10() {
		
		RowBounds rowBounds = new RowBounds(0, 10);
		return sqlSession.selectList("goodsBoardMapper.selectMostViewedList", null ,rowBounds);
	}
	
	/** 로그인한 유저가 최근에 본 상품 5가지
	 * @return 
	 */
	/*
	 * public List<GoodsBoard> selectrecentViewedList5() { return
	 * sqlSession.selectList("goodsBoardMapper.selectrecentViewedList5"); }
	 */

	
}
