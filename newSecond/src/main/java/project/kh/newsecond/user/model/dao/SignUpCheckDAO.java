package project.kh.newsecond.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SignUpCheckDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int checkEmail(String email) {
		return sqlSession.selectOne("userMapper.checkEmail",email);
	}

	public int checkNickname(String nickname) {
		return sqlSession.selectOne("userMapper.checkNickname",nickname);
	}
	
	
}
