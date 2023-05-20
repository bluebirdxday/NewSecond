package project.kh.newsecond.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import project.kh.newsecond.myPage.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO dao;
	
	@Autowired 
	private BCryptPasswordEncoder bcrypt;
	
	// 유저 탈퇴 서비스
	@Override
	public int secession(int userNo, String userPassword) {
		
		System.out.println(userNo + " : 2 ");
		System.out.println(userPassword + " : 2 ");
		
		dao.selectEncPassword(userNo);
		
		return 0;
	}
	
	
	
}
