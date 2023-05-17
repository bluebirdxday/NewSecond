package project.kh.newsecond.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.admin.model.dao.AdminDAO;
import project.kh.newsecond.admin.model.dto.Admin;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.notice.model.dto.Notice;

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

}
