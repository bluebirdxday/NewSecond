package project.kh.newsecond.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import project.kh.newsecond.admin.model.dto.Admin;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.notice.model.dto.Notice;
import project.kh.newsecond.qna.model.dto.Qna;

public interface AdminService {

	/**관리자 공지사항 게시글 리스트 조회
	 * @return
	 */
	List<Notice> selectNoticeList();

	/**관리자 회원 리스트 조회
	 * @return
	 */
	List<HashMap<String, Object>> selectUserList();

	/**관리자 QNA 리스트 조회
	 * @return
	 */
	List<Admin> selectQnaList();

	/**관리자 게시글 리스트 조회
	 * @return
	 */
	List<HashMap<String, Object>> selectGoodsBoardList();

	Notice selectNoticeOne(int noticeNo);

	/**문의사항 게시글 읽기 조회
	 * @param qnaNo
	 * @return
	 */
	Qna selectqnaOne(int qnaNo);

	/**공지사항 게시글 삽입
	 * @param notice
	 * @return noticeNo
	 */
	int noticeInsert(Notice notice);

	
	
}
