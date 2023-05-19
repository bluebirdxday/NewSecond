package project.kh.newsecond.goodsboard.model.dao;

import java.util.List;
import java.util.Map;

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

	// 지영
	/** 검색 상품 목록 조회 
	 * @param searchName
	 * @return searchGoodsList
	 */
	public List<GoodsBoard> selectSearchGoodsList(String searchName) {
		return sqlSession.selectList("goodsBoardMapper.selectSearchGoodsList", searchName);
	}


	/** 더보
	 * @param startCallNum
	 * @param untilNum
	 * @param searchName
	 * @return
	 */
	public List<GoodsBoard> moreGoods(Map<String, Object> numAndSearchName) {
		
		return sqlSession.selectList("goodsBoardMapper.moreGoods", numAndSearchName);
	}


}
