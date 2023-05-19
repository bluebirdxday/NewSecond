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

	// �Խñ� ����
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int writingInsert(Writing writing, List<MultipartFile> images, String webPath, String filePath) {
		
		// 0. XSS 처리
		writing.setTitle(Util.XXSHandling(writing.getTitle()));
		writing.setDetailText(Util.XXSHandling(writing.getDetailText()));
		
		// 1-1. GOODS_BOARD 테이블에 insert 시도
		int result = dao.writingInsert(writing);
		
		// 1-2. FILE 테이블에 넣을 goodsNo select 시도
		int goodsNo = dao.sqlSelect(writing);
		
		// 2. FILE 테이블에 insert 시도
		if(result > 0) { // GOODS_BOARD 테이블에 insert 성공
			
			List<WritingImage> FinalImages = new ArrayList<WritingImage>();
			
			for(int i=0; i<images.size(); i++) {
				
				if(images.get(i).getSize() > 0) {
					
					WritingImage Finalimgs = new WritingImage();
					String title = writing.getTitle();
					
					// Finalimgs에 매개변수 담기
					Finalimgs.setFilePath(webPath); // 파일 경로 담기
					Finalimgs.setGoodsNo(goodsNo); // 1-2에서 불러온 goodsNo 담기
					Finalimgs.setFileOrder(i); // 파일 순서 담기
					
					String fileName = images.get(i).getOriginalFilename(); // 파일 원본명
					
					Finalimgs.setFileName(fileName); // 원본명 담기
					
					FinalImages.add(Finalimgs); // 최종 컨테이너 FinalImages에 Finalimgs 담기
				}
				
			} // for문 끝
			
			
			// dao 이미지 insert 시도
			int result2 = dao.writingImageInsert(images, FinalImages);
			
			if(result2 == images.size()) { // 이미지 insert 성공
				
				// ??
				
			}
			
			
		} else { // 실패시
//			throw new Exception(); // 추후 에러 페이지 리턴
		}
		return result;
	}
}	
		
		
		
