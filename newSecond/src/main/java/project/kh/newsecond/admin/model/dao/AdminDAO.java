package project.kh.newsecond.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.admin.model.dto.Admin;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.notice.model.dto.Notice;

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

}
