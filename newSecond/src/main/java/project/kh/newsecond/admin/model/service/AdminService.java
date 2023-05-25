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
	 * @param  
	 * @return
	 */
	Map<String, Object> selectNoticeList(int cp);

	/**관리자 회원 리스트 조회
	 * @return
	 */
	Map<String, Object> selectUserList(int cp);

	/**관리자 QNA 리스트 조회 //페이지네이션
	 * @return
	 */
	Map<String, Object> selectQnaList(int cp);

	/**관리자 게시글 리스트 조회
	 * @return
	 */
	Map<String, Object> selectGoodsBoardList(int cp);

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

	/**공지사항 게시글 수정
	 * @param notice
	 * @return
	 */
	int noticeUpdate(Notice notice);

	/**공지사항 게시글 삭제
	 * @param notice
	 * @return
	 */
	int noticeDelete(Notice notice);


	/** 공지사항 게시글 선택 삭제
	 * @param boardNo
	 * @return
	 */
	int noticeListDelete(int noticeNo);



	/**공지사항 선택 삭제
	 * @param noticeNo
	 * @return
	 */
	int deleteNoticeList(int noticeNo);
	
	  /**회원탈퇴 기능
	 * @param noticeNo
	 * @return
	 */
	int userSignOut(int userNo);

	/**공지사항 조회수 
	 * @param noticeNo
	 * @return
	 */
	int updateReadCount(int noticeNo);

	/** 문의사항 선택삭제하기
	 * @param qna
	 * @return
	 */
	int qnaDelete(Qna qna);

	/**회원 블락
	 * @param userNo
	 * @return
	 */
	int userBlock(int userNo);
	
	/**회원 블락 해제
	 * @param userNo
	 * @return
	 */
	int userBlockH(int userNo);


	/**게시글 블라인드
	 * @param goodsNo
	 * @return
	 */
	int boardBlind(int goodsNo);

	/**게시글 삭제
	 * @param goodsNo
	 * @return
	 */
	int boardDelete(int goodsNo);

	/**문의사항 raido 거래신고
	 * @param qnaCategory
	 * @return
	 */
	List<Qna> radioTrade(String qnaCategory);

	/**관리자 회원 검색 기능
	 * @param searchKeyword
	 * @return
	 */
	Map<String, Object> userSelectList(String searchKeyword);

	


	
	 
	
	
}