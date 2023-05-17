package project.kh.newsecond.notification.model.service;

import java.util.List;
import java.util.Map;

import project.kh.newsecond.notification.model.dto.NotificationKeyword;


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
}
