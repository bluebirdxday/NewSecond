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
	 * 1.GOODS_BOARD INSERT
	 * @param writing
	 * @return result
	 */
	public int writingInsert(Writing writing) {
		return sqlSession.insert("writingMapper.writingInsert", writing);
		// 성공시 1, 실패시 0 리턴
	};

	/**
	 * 2. GOODS_NO RETURN
	 * @param writing
	 * @return goodsNo
	 */
	public int sqlSelect(Writing writing) {
		return sqlSession.selectOne("writingMapper.sqlSelect", writing);
	};
	
	/**
	 * 3. FILES INSERT
	 * @param images
	 * @param finalImages 
	 * @return result
	 */
	public int writingImageInsert(List<WritingImage> FinalImages) {
		return sqlSession.insert("writingMapper.writingImageInsert", FinalImages);
	}

	
	
	/** 키워드 알림 추가 (희진)
	 * @param goodsNo
	 * @return result
	 */
	public int insertKeywordNotification(int goodsNo) {
		return sqlSession.insert("NotificationMapper.insertKeywordNotification", goodsNo);
	}

}
