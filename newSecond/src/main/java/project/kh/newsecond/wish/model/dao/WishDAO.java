package project.kh.newsecond.wish.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.wish.model.dto.Wish;

@Repository
public class WishDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


	/**관심상품 목록 글 조회
	 * @param wishUserNo
	 * @return
	 */
	public List<GoodsBoard> wishList(int wishUserNo) {
		

		return sqlSession.selectList("wishMapper.wishList", wishUserNo);
	}
	
}


