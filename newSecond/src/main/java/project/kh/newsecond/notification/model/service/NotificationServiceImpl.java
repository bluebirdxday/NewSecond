package project.kh.newsecond.notification.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.notification.model.dao.NotificationDAO;
import project.kh.newsecond.notification.model.dto.Notification;
import project.kh.newsecond.notification.model.dto.NotificationKeyword;

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

	
	// 알림 삽입
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insertNotification(Notification noti,  int existCheck) {
		
		if(existCheck>0) {
			dao.deleteNotification(noti);
		}
		
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
	public List<Notification> selectNotificationList(Map<String, Object> map) {
		return dao.selectNotificationList(map);
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


	// 알림 중복 체크
	@Override
	public int selectExistNotification(Notification notification) {
		return dao.selectExistNotification(notification);
	}


	// 글 삭제 시 관련 알림 삭제
	@Override
	public int deleteGoodsNotification(int goodsNo) {
		return dao.deleteGoodsNotification(goodsNo);
	}


	// 알림 읽음 업데이트
	@Override
	public int updateReadOrNot(Map<String, Object> map) {
		return dao.updateReadOrNot(map);
	}


	// 알림 개수 조회
	@Override
	public int selectNotificationCount(int userNo) {
		return dao.selectNotificationCount(userNo);
	}

}
