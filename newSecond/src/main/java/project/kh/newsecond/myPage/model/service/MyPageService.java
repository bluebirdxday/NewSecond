package project.kh.newsecond.myPage.model.service;

import project.kh.newsecond.user.model.dto.User;

public interface MyPageService {
	
	
	/** 유저 닉네임 중복 체크
	 * @param userNickname
	 * @return result
	 */
	int checkNickname(String userNickname);
	
	/** 유저 닉네임 변경
	 * @param userNo
	 * @param userNickname
	 * @return result
	 */
	int changeNickname(int userNo, String userNickname);
	
	/** 유저 전화번호 변경
	 * @param userNo
	 * @param userTel
	 * @return result
	 */
	int changeTel(int userNo, String userTel);
	
	/** 유저 주소 변경
	 * @param loginUser
	 * @return result
	 */
	int changeAddress(User loginUser);
	
	/** 유저 비밀번호 변경 서비스
	 * @param userPassword
	 * @param newUserPassword
	 * @param userNo
	 * @return result
	 */
	int changePassword(String userPassword, String newUserPassword, int userNo);

	
	/** 유저 탈퇴 서비스
	 * @param userNo
	 * @param userPassword
	 * @return result
	 */
	int secession(int userNo, String userPassword);




	







}
