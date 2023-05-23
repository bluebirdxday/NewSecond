package project.kh.newsecond.wish.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.wish.model.dto.Wish;

@Repository
public class WishDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Wish> wishSelectList(User user) {

		return sqlSession.selectList("wishMapper.wishSelectList",user);
	}
	
}


