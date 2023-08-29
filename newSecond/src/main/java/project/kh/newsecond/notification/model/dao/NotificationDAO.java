package project.kh.newsecond.notification.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.notification.model.dto.Notification;
import project.kh.newsecond.notification.model.dto.NotificationKeyword;
import project.kh.newsecond.review.model.dto.Review;
import project.kh.newsecond.shop.model.dto.Shop;

@Repository
public class NotificationDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 키워드 리스트 조회
	public List<NotificationKeyword> selectKeywords(int userNo) {
		return sqlSession.selectList("NotificationMapper.selectKeywords", userNo);
	}

	// 키워드 추가
	@Transactional(rollbackFor=Exception.class)
	public int insertKeyword(Map<String, Object> map) {
		return sqlSession.insert("NotificationMapper.insertKeyword", map);
	}

	
	// 키워드 삭제
	public int deleteKeyword(NotificationKeyword keyword) {
		return sqlSession.delete("NotificationMapper.deleteKeyword", keyword);
	}

	// 팔로우 알림
	public int insertNotification(Notification noti) {
		return sqlSession.insert("NotificationMapper.insertNotification", noti);
	}

	// 등록 키워드 개수 조회
	public int selectKeywordCount(int userNo) {
		return sqlSession.selectOne("NotificationMapper.selectKeywordCount", userNo);
	}

	
	// 상점 정보 조회
	public Notification selectShopInfo(int senderNo) {
		return sqlSession.selectOne("NotificationMapper.selectShopInfo", senderNo);
	}

	// 알림 리스트 조회
	public List<Notification> selectNotificationList(Map<String, Object> map) {
		return sqlSession.selectList("NotificationMapper.selectNotificationList", map);
	}

	// 키워드 알림을 위한 리스트 조회
	public List<Notification> selectKeywordNotiList(int goodsNo) {
		return sqlSession.selectList("NotificationMapper.selectKeywordNotiList", goodsNo);
	}

	// 팔로우한 상점 새글 알림
	public List<Notification> selectNewPostNotification(Map<String, Object> map) {
		return sqlSession.selectList("NotificationMapper.selectNewPostNotification", map);
	}

	// 후기 작성 알림
	public Notification addReviewNotification(Map<String, Object> map) {
		return sqlSession.selectOne("NotificationMapper.addReviewNotification", map);
	}

	// 알림 읽음 업데이트
	public int updateReadOrNot(Map<String, Object> map) {
		return sqlSession.update("NotificationMapper.updateReadOrNot", map);
	}

	// 알림 중복 체크
	public int selectExistNotification(Notification notification) {
		return sqlSession.selectOne("NotificationMapper.selectExistNotification" , notification);
	}

	// 알림 중복 시 이전 알림 삭제
	public int deleteNotification(Notification noti) {
		return sqlSession.delete("NotificationMapper.deleteNotification", noti);
	}

	// 글 삭제 시 관련 알림 삭제
	public int deleteGoodsNotification(int goodsNo) {
		return sqlSession.delete("NotificationMapper.deleteGoodsNotification", goodsNo);
	}

	// 알림 개수 조회
	public int selectNotificationCount(int userNo) {
		return sqlSession.selectOne("NotificationMapper.selectNotificationCount", userNo);
	}

}
