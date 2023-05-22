package project.kh.newsecond.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.user.model.dao.UserDAO;
import project.kh.newsecond.user.model.dto.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	@Autowired 
	private BCryptPasswordEncoder bcrypt;
	
	
	// 로그인
	@Override
	public User login(User inputUser) {

		User loginUser = dao.login(inputUser);

		if (loginUser != null) {

			if (bcrypt.matches(inputUser.getUserPassword(),loginUser.getUserPassword())) {

				loginUser.setUserPassword(null);

			} else {
				loginUser = null;
			}

		}

		return loginUser;
	}
	
	
	// 가입
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int signUp(User inputUser) {
		
		
		String encPw = bcrypt.encode(inputUser.getUserPassword());
		
		inputUser.setUserPassword(encPw);
		
		int result = dao.signUp(inputUser);
		
		if(!(result > 0) ) return result;
		
		// 회원의 상점 기본정보 입력
		result = dao.insertShopData(inputUser);
		
		return result;
	}

}








