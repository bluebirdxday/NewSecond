package project.kh.newsecond.goodsboard.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.common.utility.Util;
import project.kh.newsecond.goodsboard.model.dao.MyGoodsDAO;
import project.kh.newsecond.goodsboard.model.dto.Files;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;

@Service
public class MyGoodsServiceImpl implements MyGoodsService {
	
	@Autowired
	private MyGoodsDAO dao;
	
	// 게시글 수정
	public int myGoodsModify(GoodsBoard goodsBoard, List<Files> filesList) {
		
		// 0. XSS 처리
		goodsBoard.setGoodsTitle(Util.XXSHandling(goodsBoard.getGoodsTitle()));
		goodsBoard.setGoodsDescr(Util.XXSHandling(goodsBoard.getGoodsDescr()));
		// 1. GOODS_BOARD 테이블 UPDATE 시도
		int result = dao.myGoodsModify(goodsBoard);
		
		// 2. 1번 자리 강제배정
		int[] orderList = new int[5];
		
		if(result > 0) { // 성공
			
			List<Files> FinalImages = new ArrayList<Files>();
			
			// 3. FILES 테이블 UPDATE 시도
			for(int i=0; i<filesList.size(); i++) {
				
				if(!filesList.get(i).equals(null)) {
					
					Files Finalimgs = new Files();
					
					int order = i + 1; // 파일 순서는 1번부터
					
					// 파일 순서 1번 자리 강제 배정(상준) ***************************************************************
					orderList[i] = order;
					if(orderList[0] != 1) { // order 1이 씹혔다면 order 1 강제 배정
						order = 1;
						// i--; // 만약 1, 2, 3이 강제되어야 한다면 이 코드를 생각 후 사용하기(하지만 1, 3, 4도 되니 일단은 보류)
					}
					// 파일 순서 1번 자리 강제 배정(상준) ***************************************************************
				
					// Finalimgs에 매개변수 담기
					Finalimgs.setFileOrder(order); // 파일 순서 담기
					
					String fileName = filesList.get(i).getFileName(); // 파일 원본명
					
					String fileRenameTemp = Util.fileRename(fileName); // rename 작업
					
					Finalimgs.setFileName( fileRenameTemp ); // 파일 원본명 변경
					
					// filePath 설정
					Finalimgs.setFilePath(webPath); // 파일 경로 담기
					
					FinalImages.add(Finalimgs); // 최종 컨테이너 FinalImages에 Finalimgs 담기
				
				}
				
			} // for문 끝
			
			int result2 = dao.myGoodsImageModify(FinalImages);
			
			if(result2 == FinalImages.size()) {
				
				for(int i=0; i<FinalImages.size(); i++) {
					
					int tempIndex = FinalImages.get(i).getFileOrder();
					int index = tempIndex - 1;
					
					// 파일로 변환
					String afterRename = FinalImages.get(i).getFileName();
					filesList.get(index).transferTo(new File(filePath + goodsBoard.getUserNo() + "/" afterRename));
					
				}
				
				
			} else {
				// 예외 강제 발생
			}
			
		
		
		return result;
	}
	
	
	// 게시글 삭제
	public int myGoodsDelete(GoodsBoard goodsBoard) {
		
		int result = dao.myGoodsDelete(goodsBoard);
		
		return result;
	}



}
