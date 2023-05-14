package project.kh.newsecond.user.model.service;

import project.kh.newsecond.user.model.dto.User;

public interface UserService {
	
	
	User login(User inputUser);
	
	
	/** insert userInfo(signUp)
	 * @param inputUser
	 * @return result
	 */
	int signUp(User inputUser);

}
