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
		
		// 1-1. WRITING 테이블 INSERT하기
		int result = dao.writingInsert(writing);
		
		// 1-2. FILE 테이블에 GOODS_NO를 삽입하기 위한 GOODS_NO 가져오기
		int goodsNo = dao.sqlSelect(writing);
		
		// 2. 게시글 삽입 성공 시 업로드된 이미지가 있다면 files 테이블에 삽입하는 DAO 호출
		if(result > 0) { // 이미지 제외 게시글 삽입 성공
			
			List<WritingImage> FinalImages = new ArrayList<WritingImage>();
			
			for(int i=0; i<images.size(); i++) {
				
				if(images.get(i).getSize() > 0) {
					
					WritingImage Finalimgs = new WritingImage();
					String title = writing.getTitle();
					
					// Finalimgs에 파일 정보를 담아서 FinalImages에 추가
					Finalimgs.setFilePath(webPath); // 웹 접근 경로
					Finalimgs.setGoodsNo(goodsNo); // 리턴된 goodsNo
					Finalimgs.setFileOrder(i); // 이미지 순서
					
					String fileName = images.get(i).getOriginalFilename(); // 파일 원본명
					
					Finalimgs.setFileName(fileName); // 원본명
					
					FinalImages.add(Finalimgs);
					// -> DB에 입력되어야 할 정보를 담은 FinalImages 객체 완성
				}
				
			} // 분류 for문 종료
			
			
			// 이미지 삽입 시도
			int result2 = dao.writingImageInsert(images, FinalImages);
			
			if(result2 == images.size()) { // 업로드 이미지가 3장이고 모두 3장 모두 삽입 성공했다면
				
				// 두 테이블 모두 삽입 성공 == 최종 성공
				
			}
			
			
		} else { // 게시글 삭제 실패
//			throw new Exception(); // 예외 강제 발생 -> 나중에 예외 발생 클래스로 연결
		}
		return result;
	}
}	
		
		
		