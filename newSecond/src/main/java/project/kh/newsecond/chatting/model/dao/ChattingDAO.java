package project.kh.newsecond.chatting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChattingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
