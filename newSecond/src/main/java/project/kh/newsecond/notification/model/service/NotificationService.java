package project.kh.newsecond.notification.model.service;

import java.util.List;
import java.util.Map;

import project.kh.newsecond.notification.model.dto.Notification;
import project.kh.newsecond.notification.model.dto.NotificationKeyword;
import project.kh.newsecond.shop.model.dto.Shop;


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
	 * @return result
	 */
	int insertNotification(Notification noti);


	
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
}
