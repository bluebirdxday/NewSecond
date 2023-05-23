package project.kh.newsecond.qna.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.qna.model.dto.Qna;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**문의사항 접수
	 * @param qna
	 * @return
	 */
	public int qnaInsert(Qna qna) {
		
		int result = sqlSession.insert("qnaMapper.qnaInsert", qna);
		
		if(result>0) result = qna.getQnaNo();
 		
		return result;
	}
}
