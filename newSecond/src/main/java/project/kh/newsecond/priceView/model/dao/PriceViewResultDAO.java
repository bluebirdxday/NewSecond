package project.kh.newsecond.priceView.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PriceViewResultDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int goodsPriceSelect(String keyword) {
		
		return sqlSession.selectOne("writingMapper.goodsPriceSelect", keyword);
	}
}
