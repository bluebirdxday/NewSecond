package project.kh.newsecond.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.User;

import project.kh.newsecond.admin.model.dto.Admin;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.notice.model.dto.Notice;

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

}
