package project.kh.newsecond.notice.model.service;

import java.util.List;
import java.util.Map;

import project.kh.newsecond.notice.model.dto.Notice;


public interface NoticeService {

	List<Notice> selectNoticeList();

	List<Notice> selectNoticeOneList(int noticeNo);







}
