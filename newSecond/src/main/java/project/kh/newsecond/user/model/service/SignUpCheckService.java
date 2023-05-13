package project.kh.newsecond.user.model.service;

public interface SignUpCheckService {

	int checkEmail(String email);

	int checkNickname(String nickname);
	
}
