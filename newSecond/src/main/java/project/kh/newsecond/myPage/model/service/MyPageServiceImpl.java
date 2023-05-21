package project.kh.newsecond.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.myPage.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO dao;
	
	@Autowired 
	private BCryptPasswordEncoder bcrypt;
	
	
	
	// 비밀번호 변경 서비스
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int changePassword(String userPw, String newUserPw, int userNo) {
		
		String encPw = dao.selectEncPw(userNo);
		
		// 2) bcrypt.matches(평문, 암호문) -> 같으면 true -> 이 때 비번 수정
		if(bcrypt.matches(userPw, encPw)) {
		
			// 2. 비밀번호 변경(UPDATE DAO 호출) -> 결과 반환  
			return dao.changePw(bcrypt.encode(newUserPw), userNo);
		}
			
			// 3) 비밀번호가 일치하지 않으면 0 반환
		
		return 0;
	}


	// 유저 탈퇴 서비스
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int secession(int userNo, String userPassword) {
		
		String encPw = dao.selectEncPw(userNo);
		
		if(bcrypt.matches(userPassword, encPw)) {
			// MEMBER_DEL_FL -> 'Y'로 바꾸고 1반환
			return dao.secession(userNo);
		}
		// 3. 비밀번호가 일치하지 않으면 -> 0 반환		
		
		return 0;
		
	}
	
	
	
}
