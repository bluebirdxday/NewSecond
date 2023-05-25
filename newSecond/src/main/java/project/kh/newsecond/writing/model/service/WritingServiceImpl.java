package project.kh.newsecond.writing.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import project.kh.newsecond.common.utility.Util;
import project.kh.newsecond.writing.model.dao.WritingDAO;
import project.kh.newsecond.writing.model.dto.Writing;
import project.kh.newsecond.writing.model.dto.WritingImage;

@Service
public class WritingServiceImpl implements WritingService {
	
	@Autowired
	private WritingDAO dao;

	// 게시글 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Map<String, Object> writingInsert(Writing writing, List<MultipartFile> images, String webPath, String filePath) throws IllegalStateException, IOException {
		
		// 0. XSS 처리
		writing.setTitle(Util.XXSHandling(writing.getTitle()));
		writing.setDetailText(Util.XXSHandling(writing.getDetailText()));
		
		// 1-1. GOODS_BOARD 테이블에 insert 시도
		int result = dao.writingInsert(writing);
		
		// 1-2. FILE 테이블에 넣을 goodsNo select 시도
		int goodsNo = dao.sqlSelect(writing);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 1-3. 파일 순서 1번 자리 강제배정을 위한 5자리 배열 생성
		int[] orderList = new int[5];
		
		// 2. FILE 테이블에 insert 시도
		if(result > 0) { // GOODS_BOARD 테이블에 insert 성공
			
			List<WritingImage> FinalImages = new ArrayList<WritingImage>();
			
			for(int i=0; i<images.size(); i++) {
				
				if(images.get(i).getSize() > 0) { // i+1개의 업로드된 파일이 있다는 소리
					
					WritingImage Finalimgs = new WritingImage();
					
					int order = i + 1; // 파일 순서는 1번부터
					
					// 파일 순서 1번 자리 강제 배정(상준) ***************************************************************
					orderList[i] = order;
					if(orderList[0] != 1) { // order 1이 씹혔다면 order 1 강제 배정
						order = 1;
						// i--; // 만약 1, 2, 3이 강제되어야 한다면 이 코드를 생각 후 사용하기(하지만 1, 3, 4도 되니 일단은 보류)
					}
					// 파일 순서 1번 자리 강제 배정(상준) ***************************************************************
					
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
					
					String afterRename = FinalImages.get(i).getFileName();
					// 글 올리기 전에 폴더가 없다면 폴더 미리 만드는 코드 추가
					String userFolderPath = filePath + writing.getUserNo() + "/";
					File userFolder = new File(userFolderPath);

					if (!userFolder.exists()) {
					    userFolder.mkdirs(); // 필요한 모든 상위 디렉토리를 생성합니다.
					}

					images.get(index).transferTo(new File(userFolderPath + afterRename));
					
					
					// 파일로 변환
//					images.get(index).transferTo(new File(filePath + writing.getUserNo() + "/" + afterRename));
				
				}
				
				
			} else {
				// 예외 강제 발생
			} 
			
			
			
			map.put("result", result);
			map.put("goodsNo", goodsNo);
			
		}
		return map;
	}
}	
		
		
		
