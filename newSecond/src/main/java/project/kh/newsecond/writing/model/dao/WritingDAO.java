package project.kh.newsecond.writing.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.writing.model.dto.Writing;

@Repository
public class WritingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 게시글 삽입
	 * @param writing
	 * @return goodsNo
	 */
	public int boardInsert(Writing writing) {
		int result = sqlSession.insert("writingMapper.writingInsert", writing);
		
		if(result > 0) result = writing.getGoodsNo(); // 삽입 성공
		
		return result; // 삽입 성공 시 goodsNo, 실패 시 0 반환
	}
}
