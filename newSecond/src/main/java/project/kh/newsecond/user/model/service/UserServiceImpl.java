package project.kh.newsecond.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.user.model.dao.UserDAO;
import project.kh.newsecond.user.model.dto.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	@Override
	public User login(User inputUser) {

		User loginUser = dao.login(inputUser);

		if (loginUser != null) {

			if (inputUser.getUserPassword().equals(loginUser.getUserPassword())) {

				loginUser.setUserPassword(null);

			} else {
				loginUser = null;
			}

		}

		return loginUser;
	}

}
