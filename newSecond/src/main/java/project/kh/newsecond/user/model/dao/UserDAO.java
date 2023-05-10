package project.kh.newsecond.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.user.model.dto.User;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	public User login(User inputUser) {
		return sqlSession.selectOne("memberUser.login", inputUser);
	}

}
