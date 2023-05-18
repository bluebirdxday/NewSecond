package project.kh.newsecond.writing.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.writing.model.dto.Writing;
import project.kh.newsecond.writing.model.dto.WritingImage;

@Repository
public class WritingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * �Խñ� ����
	 * @param writing
	 * @return goodsNo
	 */
	public int writingInsert(Writing writing) {
		int result = sqlSession.insert("writingMapper.writingInsert", writing);
		
		if(result > 0) result = writing.getGoodsNo(); // ���� ����
		
		return result; // ���� ���� �� goodsNo, ���� �� 0 ��ȯ
	};
	
	/**
	 * �Խñ� �̹��� ����
	 * @param uploadList
	 * @return result
	 */
	public int writingImageInsert(List<WritingImage> uploadList) {
		return sqlSession.insert("writingMapper.writingImageInsert", uploadList);
	};
}
