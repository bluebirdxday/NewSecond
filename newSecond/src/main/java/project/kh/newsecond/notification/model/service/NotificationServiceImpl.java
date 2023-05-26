package project.kh.newsecond.notification.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.notification.model.dao.NotificationDAO;
import project.kh.newsecond.notification.model.dto.Notification;
import project.kh.newsecond.notification.model.dto.NotificationKeyword;
import project.kh.newsecond.review.model.dto.Review;
import project.kh.newsecond.shop.model.dto.Shop;

@Service
public class NotificationServiceImpl implements NotificationService{

	@Autowired
	private NotificationDAO dao;
	
	// 키워드 리스트 조회
	@Override
	public List<NotificationKeyword> selectKeywords(int userNo) {
		return dao.selectKeywords(userNo);
	}


	// 키워드 추가
	@Override
	public int insertKeyword(Map<String, Object> map) {
		return dao.insertKeyword(map);
	}

	
	// 키워드 삭제
	@Override
	public int deleteKeyword(NotificationKeyword keyword) {
		return dao.deleteKeyword(keyword);
	}

	
	// 팔로우 알림
	@Override
	public int insertNotification(Notification noti) {
		return dao.insertNotification(noti);
	}


	// 등록 키워드 개수 조회
	@Override
	public int selectKeywordCount(int userNo) {
		return dao.selectKeywordCount(userNo);
	}


	// 상점 정보 조회
	@Override
	public Notification selectShopInfo(int senderNo) {
		return dao.selectShopInfo(senderNo);
	}


	// 알림 리스트 조회
	@Override
	public List<Notification> selectNotificationList(int userNo) {
		return dao.selectNotificationList(userNo);
	}


	// 키워드 알림을 위한 리스트 조회
	@Override
	public List<Notification> selectKeywordNotiList(int goodsNo) {
		return dao.selectKeywordNotiList(goodsNo);
	}


	// 팔로우한 상점 새글 알림
	@Override
	public List<Notification> selectNewPostNotification(Map<String, Object> map) {
		return dao.selectNewPostNotification(map);
	}


	// 후기 작성 알림
	@Override
	public Notification addReviewNotification(Map<String, Object> map) {
		return dao.addReviewNotification(map);
	}

}
