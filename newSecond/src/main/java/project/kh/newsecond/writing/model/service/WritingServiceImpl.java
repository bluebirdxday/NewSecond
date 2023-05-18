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

@Service
public class WritingServiceImpl implements WritingService {
	
	@Autowired
	private WritingDAO dao;

	// 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int writingInsert(Writing writing, List<MultipartFile> images, String webPath, String filePath) {
		
		// 0. XSS 방지 처리
		// board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
		// board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		
		// 1. WRITING 테이블 INSERT하기 (제목, 내용, 작성자, 게시판코드)
		int goodsNo = dao.writingInsert(writing);
		
		// 2. 게시글 삽입 성공 시 업로드된 이미지가 있다면 files 테이블에 삽입하는 DAO 호출
		if(goodsNo > 0) { // 게시글 삽입 성공
			
			// List<MultipartFile> images
			// -> 업로드된 파일이 담긴 객체 MultipartFile이 5개 존재
			// -> 단 업로드된 파일이 없어도 MultipartFile 객체는 존재

			List<WritingImage> uploadList = new ArrayList<WritingImage>();
			// images에 담긴 파일 중 실제 업로드된 파일만 분류하는 작업
			for(int i=0; i<images.size(); i++) {
				
				if(images.get(i).getSize() > 0) { // i번째 요소에 업로드한 파일이 있다면
					
					WritingImage img = new WritingImage();
					
					// img에 파일 정보를 담아서 uploadList에 추가
					img.setFilePath(webPath); // 웹 접근 경로
					img.setGoodsNo(goodsNo); // 게시글 번호
					img.setFileOrder(i); // 이미지 순서
					
					String fileName = images.get(i).getOriginalFilename(); // 파일 원본명
					
					img.setImageOriginal(fileName); // 원본명
					
					img.setFileReName( Util.fileRename(fileName) ); // 변경명
					
					uploadList.add(img);
				}
			} // 분류 for문 종료
			
			// 분류 작업 후 uploadList가 비어있지 않는 경우 == 업로드한 파일이 있음
			if(!uploadList.isEmpty()) {
				
				// file 테이블에 INSERT 하는 DAO 호출
				int result = dao.writingImageInsert(uploadList);
				// result == 삽입된 행의 개수 == uploadList.size()
				
				// 삽입된 행의 개수와 uploadList의 개수가 같다면 == 전체 insert 성공
				if(result == uploadList.size()) {
					
					// 서버에 파일을 저장(transferTo())
					
					// images: 실제 파일이 담긴 객체 리스트(업로드 안된 인덱스는 빈칸)
					// uploadList: 업로드된 파일의 정보(원본명, 변경명, 순서, 경로, 게시글 번호)					
					// 순서 == images 업로드된 인덱스
					
					for(int i=0; i<uploadList.size(); i++) {
						
						int index = uploadList.get(i).getFileOrder();
						
						// 파일로 변환
						String rename = uploadList.get(i).getFileRename();
						images.get(index).transferTo(new Image(filePath + rename));
					}
					
				} else { // 일부 또는 전체 insert 실패 -> 사실상 전체 실패
					// ** 웹 서비스 수행 중 1개라도 실패하면 전체 실패로 취급 **
					// -> rollback 필요
					
					// @Transactional(rollbackFor = Exception.class) -> 예외가 발생해야지만 롤백
					
					// [결론]
					// ** insert가 일부라도 실패하면 강제로 예외를 발생시켜 롤백시키기 **
					// -> 사용자 정의 예외 생성 필요
					throw new FileUploadException(); // 예외 강제 발생
				}
			}
		}
		
		return goodsNo;
	}
}
