package project.kh.newsecond.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.admin.model.dto.Admin;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.notice.model.dto.Notice;

/**
 * @author bfyu0
 *
 */
@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**관리자 공지사항 게시글 리스트
	 * @return
	 */
	public List<Notice> selectNoticeList() {
	
		return sqlSession.selectList("AdminMapper.selectNoticeList");
	}

	public List<HashMap<String, Object>> selectUserList() {

		return sqlSession.selectList("AdminMapper.selectUserList");
	}

	/**관리자 문의사항 게시글 리스트
	 * @return
	 */
	public List<Admin> selectQnaList() {
		
		return sqlSession.selectList("AdminMapper.selectQnaList");
	}

	/**관리자 게시글 리스트 조회
	 * @return
	 */
	public List<HashMap<String, Object>> selectGoodsBoardList() {
	
		return sqlSession.selectList("AdminMapper.selectGoodsBoardList");
	}

	/**관리자 공지사항 게시글 읽기 조회
	 * @return
	 */
	public Notice selectNoticeOne(int noticeNo) {
		
		return sqlSession.selectOne("AdminMapper.selectNoticeOne",noticeNo);
	}

	/**문의사항 게시글 읽기 조회
	 * @param qnaNo
	 * @return
	 */
	public project.kh.newsecond.qna.model.dto.Qna selectqnaOne(int qnaNo) {
		
		return sqlSession.selectOne("AdminMapper.selectqnaOne",qnaNo);
	}

	/**공지사항 게시글 삽입
	 * @param notice
	 * @return
	 */
	public int noticeInsert(Notice notice) {
		
		int result = sqlSession.insert("AdminMapper.noticeInsert",notice);
		
		if(result>0) result = notice.getNoticeNo();
 		
		return result;
	}

	/**공지사항 게시글 수정
	 * @param notice
	 * @return
	 */
	public int noticeUpdate(Notice notice) {
	
		int result = sqlSession.update("AdminMapper.noticeUpdate",notice);
		
		if(result>0) result = notice.getNoticeNo();
		
		return result;
	}

	/**공지사항 게시글 삭제
	 * @param notice
	 * @return
	 */
	public int noticeDelete(Notice notice) {
		
		int result = sqlSession.delete("AdminMapper.noticeDelete",notice);
		
		if(result>0) result = notice.getNoticeNo();
		
		return result;
	}


	public int noticeDelete(Notice notice, Map<String, Object> paramMap) {
	int result = sqlSession.delete("AdminMapper.noticeDelete",notice);
		
		if(result>0)  result = notice.getNoticeNo();
		
		return result;
	}

	public int noticeListDelete(int noticeNo) {
		
		return sqlSession.update("AdminMapper.noticeListDelete",noticeNo);
	}

	public int deleteNoticeList(int noticeNo) {
		
		return sqlSession.update("AdminMapper.deleteNoticeList",noticeNo);
	}

}
