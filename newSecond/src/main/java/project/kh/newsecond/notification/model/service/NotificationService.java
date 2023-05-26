package project.kh.newsecond.notification.model.service;

import java.util.List;
import java.util.Map;

import project.kh.newsecond.notification.model.dto.Notification;
import project.kh.newsecond.notification.model.dto.NotificationKeyword;
import project.kh.newsecond.review.model.dto.Review;
import project.kh.newsecond.shop.model.dto.Shop;


/**
 * @author user
 *
 */
public interface NotificationService {


	/** 특정 유저 키워드 검색
	 * @param userNo
	 * @return keywordList
	 */
	List<NotificationKeyword> selectKeywords(int userNo);


	/** 키워드 추가
	 * @param map
	 * @return result
	 */
	int insertKeyword(Map<String, Object> map);


	
	/** 키워드 삭제
	 * @param keyword
	 * @return result
	 */
	int deleteKeyword(NotificationKeyword keyword);


	/** 팔로우 알림
	 * @param noti
	 * @param existCheck 
	 * @return result
	 */
	int insertNotification(Notification noti, int existCheck);


	
	/** 키워드 개수 조회
	 * @param userNo
	 * @return keywordCount
	 */
	int selectKeywordCount(int userNo);


	/** 상점 정보 조회
	 * @param senderNo
	 * @return shop
	 */
	Notification selectShopInfo(int senderNo);


	/** 알림 리스트 조회
	 * @param loginUserNo
	 * @return notificationList
	 */
	List<Notification> selectNotificationList(int loginUserNo);


	/** 키워드 알림을 위한 리스트 조회
	 * @param goodsNo
	 * @return keywordNotiList
	 */
	List<Notification> selectKeywordNotiList(int goodsNo);


	/** 팔로우한 상점 새글 알림
	 * @param map
	 * @return newPostNotiList
	 */
	List<Notification> selectNewPostNotification(Map<String, Object> map);


	/** 후기 알림
	 * @param map
	 * @return review
	 */
	Notification addReviewNotification(Map<String, Object> map);


	/** 알림 읽음 업데이트
	 * @param userNo
	 * @return result
	 */
	int updateReadOrNot(int userNo);


	
	/** 알림 중복 체크
	 * @param notification
	 * @return existResult
	 */
	int selectExistNotification(Notification notification);
}
