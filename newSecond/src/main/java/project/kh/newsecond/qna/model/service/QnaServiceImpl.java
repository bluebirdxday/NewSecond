package project.kh.newsecond.qna.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.common.utility.Util;
import project.kh.newsecond.qna.model.dao.QnaDAO;
import project.kh.newsecond.qna.model.dto.Qna;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaDAO qnaDao;

	/**
	 *문의하기 접수
	 */
	@Transactional(rollbackFor =  Exception.class)
	@Override
	public int qnaInsert(Qna qna) {
		
		/*
		 * qna.setQnaContent(Util.XXSHandling(qna.getQnaContent()));
		 * qna.setQnaTitle(Util.XXSHandling(qna.getQnaTitle()));
		 */
	
		int result = qnaDao.qnaInsert(qna);
		
		return result;
	}

}
