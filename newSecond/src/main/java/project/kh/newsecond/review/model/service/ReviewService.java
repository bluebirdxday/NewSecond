package project.kh.newsecond.review.model.service;

import java.util.HashMap;
import java.util.List;

import project.kh.newsecond.review.model.dto.Review;


public interface ReviewService {

	/** 작성된 리뷰 리스트 조회
	 * @param userNo
	 * @return reviewList
	 */
	List<Review> selectWrittenReviewList(int userNo);

	
	/** 아직 작성되지 않은 리뷰 가능 리스트 조회
	 * @param userNo
	 * @return reviewList
	 */
	List<HashMap<String, Object>> selectCanWriteReviewList(int userNo);


	/** 후기 등록
	 * @param review
	 * @return result
	 */
	int insertReview(Review review);


	/** 후기 삭제
	 * @param reviewNo
	 * @return result
	 */
	int deleteReview(int reviewNo);


	/** 특정 후기 조회
	 * @param reviewNo
	 * @return review
	 */
	Review selectReview(int reviewNo);


	/** 후기 수정
	 * @param review
	 * @return  result
	 */
	int updateReview(Review review);


	
	/** 후기 조회 goodsNo로
	 * @param goodsNo
	 * @return review
	 */
	Review selectReivewByGoodsNo(int goodsNo);


}
