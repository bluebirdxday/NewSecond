package project.kh.newsecond.myPage.model.service;


public interface MyPageService {
	
	
	/** 유저 탈퇴 서비스
	 * @param userNo
	 * @param userPassword
	 * @return result
	 */
	int secession(int userNo, String userPassword);


	
	
}
