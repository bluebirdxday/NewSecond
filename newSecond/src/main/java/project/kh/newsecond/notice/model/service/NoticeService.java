package project.kh.newsecond.notice.model.service;

import java.util.List;
import java.util.Map;

import project.kh.newsecond.notice.model.dto.Notice;


public interface NoticeService {

	/** 공지사항 글 조회
	 * @return
	 */
	List<Notice> selectNoticeList();

	/***공지사항 게시글 읽기 조회
	 * @param noticeNo
	 * @return
	 */
	Notice selectNoticeOneList(int noticeNo);







}
