package project.kh.newsecond.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public String selectEncPassword(int userNo) {
		System.out.println(userNo + ": 3");
		return null;
	}
	
	
}
