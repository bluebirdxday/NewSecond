package project.kh.newsecond.writing.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WritingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
