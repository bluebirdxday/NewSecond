package project.kh.newsecond.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.admin.model.dao.AdminDAO;
import project.kh.newsecond.admin.model.dto.Admin;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.notice.model.dto.Notice;
import project.kh.newsecond.qna.model.dto.Qna;
import project.kh.newsecond.common.utility.*;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDao;
	
	/**
	 *관리자 공지사항 게시글 리스트
	 */
	@Override
	public List<Notice> selectNoticeList() {

		return adminDao.selectNoticeList();
	}

	/**
	 *관리자 회원 리스트 조회
	 */
	@Override
	public List<HashMap<String, Object>> selectUserList() {
	
		return adminDao.selectUserList();
	}

	
	/**
	 *관리자 문의사항 리스트 조회
	 */
	@Override
	public List<Admin> selectQnaList() {
	
		return adminDao.selectQnaList();
	}

	/**
	 *관리자 게시글 리스트 조회
	 */
	@Override
	public List<HashMap<String, Object>> selectGoodsBoardList() {
	
		return adminDao.selectGoodsBoardList();
	}

	/**
	 *관리자 공지사항 게시글 읽기 조회
	 */
	@Override
	public Notice selectNoticeOne(int noticeNo) {
		
		return adminDao.selectNoticeOne(noticeNo);
	}

	/**
	 *문의사항 게시글 조회
	 */
	@Override
	public Qna selectqnaOne(int qnaNo) {
		
		return adminDao.selectqnaOne(qnaNo);
	}

	/**
	 *공지사항 게시글 삽입
	 */
	@Transactional(rollbackFor =  Exception.class)
	@Override
	public int noticeInsert(Notice notice) {
		
		
		 notice.setNoticeContent(Util.XXSHandling(notice.getNoticeContent()));
		 notice.setNoticeTitle(Util.XXSHandling(notice.getNoticeTitle()));
	
		int result = adminDao.noticeInsert(notice);
		
		return result;
	}

	/**
	 *공지사항 게시글 수정
	 */
	@Override
	public int noticeUpdate(Notice notice) {

		int result = adminDao.noticeUpdate(notice);
		
		return result;
	}

	/**
	 *공지사항 게시글 삭제
	 */
	@Override
	public int noticeDelete(Notice notice) {
	
		int result = adminDao.noticeDelete(notice);
		
		return result;
	}

	@Override
	public int noticeListDelete(int noticeNo) {
		
		int result = adminDao.noticeListDelete(noticeNo);
		
		return result;
	}



	
	  /**
	 *회원탈퇴 기능
	 */
	@Override public int userSignOut(Map<String, Object> paramMap) {
	  
	  return adminDao.userSignOut(paramMap); 
	  }

	@Override
	public int deleteNoticeList(int noticeNoInt) {

		return adminDao.deleteNoticeList(noticeNoInt);
	}

	/**
	 *공지사항 조회수 증가
	 */
	@Override
	public int updateReadCount(int noticeNo) {
	
		return adminDao.updateReadCount(noticeNo);
	}
}

	
	 



