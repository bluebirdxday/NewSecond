package project.kh.newsecond.notification.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.notification.model.dto.NotificationKeyword;

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

	public int deleteKeyword(NotificationKeyword keyword) {
		return sqlSession.delete("NotificationMapper.deleteKeyword", keyword);
	}

}
