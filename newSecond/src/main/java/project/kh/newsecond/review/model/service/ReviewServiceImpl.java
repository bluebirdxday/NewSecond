package project.kh.newsecond.review.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.common.utility.Util;
import project.kh.newsecond.review.model.dao.ReviewDAO;
import project.kh.newsecond.review.model.dto.Review;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO dao;

	
	// 리뷰 리스트 조회
	@Override
	public List<Review> selectWrittenReviewList(int userNo) {
		return dao.selectWrittenReviewList(userNo);
	}


	// 작성 가능한 리뷰 리스트 조회
	@Override
	public List<HashMap<String, Object>> selectCanWriteReviewList(int userNo) {
		return dao.selectCanWriteReviewList(userNo);
	}

	// 후기 등록
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int insertReview(Review review) {
		
		review.setReviewMessage(Util.XXSHandling(review.getReviewMessage()));

		return dao.insertReview(review);
	}

	// 후기 삭제
	@Override
	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}

	// 특정 후기 조회
	@Override
	public Review selectReview(int reviewNo) {
		return dao.selectReview(reviewNo);
	}


	// 후기 수정
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateReview(Review review) {

		review.setReviewMessage(Util.XXSHandling(review.getReviewMessage()));
		
		return dao.updateReview(review);
	}


	// 알림을 위한 후기 조회
	@Override
	public Review selectReivewByGoodsNo(int goodsNo) {
		return dao.selectReivewByGoodsNo(goodsNo);
	}
}
