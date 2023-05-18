package project.kh.newsecond.writing.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import project.kh.newsecond.writing.model.dao.WritingDAO;
import project.kh.newsecond.writing.model.dto.Writing;
import project.kh.newsecond.writing.model.dto.WritingImage;
import project.kh.newsecond.common.utility.Util;
import project.kh.newsecond.common.Exception.*;

@Service
public class WritingServiceImpl implements WritingService {
	
	@Autowired
	private WritingDAO dao;

	// 게시글 제출
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int writingInsert(Writing writing, List<MultipartFile> images, String webPath, String filePath) {
		
		// 0. XSS 방지 처리
		writing.setTitle(Util.XXSHandling(writing.getTitle()));
		writing.setDetailText(Util.XXSHandling(writing.getDetailText()));
		
		// 1. WRITING 테이블 INSERT하기
		int result = dao.writingInsert(writing);
		
		// 2. 게시글 삽입 성공 시 업로드된 이미지가 있다면 files 테이블에 삽입하는 DAO 호출
		if(result > 0) { // 이미지 제외 게시글 삽입 성공
			
			// 이미지 삽입 시도
			int result2 = dao.writingImageInsert(images);
			
			if(result2 == images.size()) { // 업로드 이미지가 3장이고 모두 3장 모두 삽입 성공했다면
				
				
				// 두 테이블 모두 삽입 성공 == 최종 성공
				
			}
			
		} else { // 게시글 삭제 실패
//			throw new Exception(); // 예외 강제 발생 -> 나중에 예외 발생 클래스로 연결
		}
		
		return result;
	}
}	
		
		
		