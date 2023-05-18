package project.kh.newsecond.writing.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import project.kh.newsecond.writing.model.dto.Writing;
import project.kh.newsecond.writing.model.dto.WritingImage;

@Repository
public class WritingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1. �Խñ� ����
	 * @param writing
	 * @return result
	 */
	public int writingInsert(Writing writing) {
		return sqlSession.insert("writingMapper.writingInsert", writing);
		// ���� ���� �� ���, ���� �� 0 ��ȯ
	};

	/**
	 * 2. GOODS_NO ��������
	 * @param writing
	 * @return goodsNo
	 */
	public int sqlSelect(Writing writing) {
		return sqlSession.selectOne("writingMapper.sqlSelect", writing);
	};
	
	/**
	 * 3. �Խñ� �̹��� ����
	 * @param images
	 * @param finalImages 
	 * @return result
	 */
	public int writingImageInsert(List<MultipartFile> images, List<WritingImage> finalImages) {
		return sqlSession.insert("writingMapper.writingImageInsert", images);
		// ���� ���� �� ���, ���� �� 0 ��ȯ
	}

}
