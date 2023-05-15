package project.kh.newsecond.goods.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
