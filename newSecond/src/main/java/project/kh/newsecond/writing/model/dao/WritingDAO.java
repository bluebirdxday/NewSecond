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
	 * 1. 게시글 삽입
	 * @param writing
	 * @return result
	 */
	public int writingInsert(Writing writing) {
		return sqlSession.insert("writingMapper.writingInsert", writing);
		// 삽입 성공 시 양수, 실패 시 0 반환
	};

	/**
	 * 2. GOODS_NO 가져오기
	 * @param writing
	 * @return goodsNo
	 */
	public int sqlSelect(Writing writing) {
		return sqlSession.selectOne("writingMapper.sqlSelect", writing);
	};
	
	/**
	 * 3. 게시글 이미지 삽입
	 * @param images
	 * @param finalImages 
	 * @return result
	 */
	public int writingImageInsert(List<MultipartFile> images, List<WritingImage> finalImages) {
		return sqlSession.insert("writingMapper.writingImageInsert", images);
		// 삽입 성공 시 양수, 실패 시 0 반환
	}

}
