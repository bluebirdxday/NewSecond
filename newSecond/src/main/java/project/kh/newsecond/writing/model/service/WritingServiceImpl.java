package project.kh.newsecond.writing.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileUploadException;
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

	// 게시글 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int writingInsert(Writing writing, List<MultipartFile> images, String webPath, String filePath) throws IllegalStateException, IOException {
		
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
				
				if(images.get(i).getSize() > 0) { // i+1개의 업로드된 파일이 있다는 소리
					
					WritingImage Finalimgs = new WritingImage();
					
					int order = i + 1; // 파일 순서는 1번부터
					
					// Finalimgs에 매개변수 담기
					Finalimgs.setGoodsNo(goodsNo); // 1-2에서 불러온 goodsNo 담기
					Finalimgs.setFileOrder(order); // 파일 순서 담기
					
					
					String fileName = images.get(i).getOriginalFilename(); // 파일 원본명
					
					String fileRenameTemp = Util.fileRename(fileName); // rename 작업
					
					Finalimgs.setFileName( fileRenameTemp ); // 파일 원본명 변경
					
					// filePath 설정
					Finalimgs.setFilePath(webPath); // 파일 경로 담기
					
					FinalImages.add(Finalimgs); // 최종 컨테이너 FinalImages에 Finalimgs 담기
					
				}
				
			} // for문 끝
			
			// dao 이미지 insert 시도
			int result2 = dao.writingImageInsert(FinalImages);
			
			if(result2 == FinalImages.size()) { // 이미지 insert 성공하면 서버에 업로드 시도
				
				for(int i=0; i<FinalImages.size(); i++) {
					
					int tempIndex = FinalImages.get(i).getFileOrder();
					int index = tempIndex - 1;
					
					// 파일로 변환
					String afterRename = FinalImages.get(i).getFileName();
					images.get(index).transferTo(new File(filePath + writing.getUserNo() + "/" + afterRename));
				}
				
			} else {
				// 예외 강제 발생
			} 
		}
		return result;
	}
}	
		
		
		
