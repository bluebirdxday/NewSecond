package project.kh.newsecond.review.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.review.model.dto.Review;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 리뷰 리스트 조회
	public List<Review> selectWrittenReviewList(int userNo) {
		return sqlSession.selectList("shopMapper.selectWrittenReviewList", userNo);
	}

	// 작성 가능한 리뷰 리스트 조회
	public List<HashMap<String, Object>> selectCanWriteReviewList(int userNo) {
		return sqlSession.selectList("shopMapper.selectCanWriteReviewList", userNo);
	}

	// 리뷰 등록
	public int insertReview(Review review) {
		return sqlSession.insert("shopMapper.insertReview", review);
	}

	// 리뷰 삭제
	public int deleteReview(int reviewNo) {
		return sqlSession.update("shopMapper.deleteReview", reviewNo);
	}

	// 특정 후기 조회
	public Review selectReview(int reviewNo) {
		return sqlSession.selectOne("shopMapper.selectReview", reviewNo);
	}
	
	
}
