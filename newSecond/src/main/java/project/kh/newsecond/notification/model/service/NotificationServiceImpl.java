package project.kh.newsecond.notification.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
	// 팔로우 알림
	@Override
	public int insertNotification(Notification noti) {
		return dao.insertNotification(noti);
	}

}
