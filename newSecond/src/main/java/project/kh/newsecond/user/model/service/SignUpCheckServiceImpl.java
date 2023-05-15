package project.kh.newsecond.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.user.model.dao.SignUpCheckDAO;

@Service
public class SignUpCheckServiceImpl implements SignUpCheckService{

	@Autowired
	private SignUpCheckDAO dao;

	@Override
	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}

	@Override
	public int checkNickname(String nickname) {
		return dao.checkNickname(nickname);
	}
	
	
}
