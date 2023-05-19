package project.kh.newsecond.qna.model.service;

import project.kh.newsecond.qna.model.dto.Qna;

public interface QnaService {

	/**문의하기 접수
	 * @param qna
	 * @return
	 */
	int qnaInsert(Qna qna);

}
