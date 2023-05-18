//package project.kh.newsecond.writing.model.service;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.multipart.MultipartFile;
//
//import project.kh.newsecond.writing.model.dao.WritingDAO;
//import project.kh.newsecond.writing.model.dto.Writing;
//import project.kh.newsecond.writing.model.dto.WritingImage;
//
//@Service
//public class WritingServiceImpl implements WritingService {
//	
//	@Autowired
//	private WritingDAO dao;
//
//	// �Խñ� ����
//	@Transactional(rollbackFor = Exception.class)
//	@Override
//	public int writingInsert(Writing writing, List<MultipartFile> images, String webPath, String filePath) {
//		
//		// 0. XSS ���� ó��
//		// board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
//		// board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
//		
//		// 1. WRITING ���̺� INSERT�ϱ� (����, ����, �ۼ���, �Խ����ڵ�)
//		int goodsNo = dao.writingInsert(writing);
//		
//		// 2. �Խñ� ���� ���� �� ���ε�� �̹����� �ִٸ� files ���̺� �����ϴ� DAO ȣ��
//		if(goodsNo > 0) { // �Խñ� ���� ����
//			
//			// List<MultipartFile> images
//			// -> ���ε�� ������ ��� ��ü MultipartFile�� 5�� ����
//			// -> �� ���ε�� ������ ��� MultipartFile ��ü�� ����
//
//			List<WritingImage> uploadList = new ArrayList<WritingImage>();
//			// images�� ��� ���� �� ���� ���ε�� ���ϸ� �з��ϴ� �۾�
//			for(int i=0; i<images.size(); i++) {
//				
//				if(images.get(i).getSize() > 0) { // i��° ��ҿ� ���ε��� ������ �ִٸ�
//					
//					WritingImage img = new WritingImage();
//					
//					// img�� ���� ������ ��Ƽ� uploadList�� �߰�
//					img.setImagePath(webPath); // �� ���� ���
//					img.setBoardNo(boardNo); // �Խñ� ��ȣ
//					img.setImageOrder(i); // �̹��� ����
//					
//					String fileName = images.get(i).getOriginalFilename(); // ���� ������
//					
//					img.setImageOriginal(fileName); // ������
//					
//					img.setImageReName( Util.fileRename(fileName) ); // �����
//					
//					uploadList.add(img);
//				}
//			} // �з� for�� ����
//			
//			// �з� �۾� �� uploadList�� ������� �ʴ� ��� == ���ε��� ������ ����
//			if(!uploadList.isEmpty()) {
//				
//				// BOARD_IMG ���̺� INSERT �ϴ� DAO ȣ��
//				int result = dao.insertImageList(uploadList);
//				// result == ���Ե� ���� ���� == uploadList.size()
//				
//				// ���Ե� ���� ������ uploadList�� ������ ���ٸ� == ��ü insert ����
//				if(result == uploadList.size()) {
//					
//					// ������ ������ ����(transferTo())
//					
//					// images: ���� ������ ��� ��ü ����Ʈ(���ε� �ȵ� �ε����� ��ĭ)
//					// uploadList: ���ε�� ������ ����(������, �����, ����, ���, �Խñ� ��ȣ)					
//					// ���� == images ���ε�� �ε���
//					
//					for(int i=0; i<uploadList.size(); i++) {
//						
//						int index = uploadList.get(i).getImageOrder();
//						
//						// ���Ϸ� ��ȯ
//						String rename = uploadList.get(i).getImageReName();
//						images.get(index).transferTo(new File(filePath + rename));
//					}
//					
//				} else { // �Ϻ� �Ǵ� ��ü insert ���� -> ��ǻ� ��ü ����
//					// ** �� ���� ���� �� 1���� �����ϸ� ��ü ���з� ��� **
//					// -> rollback �ʿ�
//					
//					// @Transactional(rollbackFor = Exception.class) -> ���ܰ� �߻��ؾ����� �ѹ�
//					
//					// [���]
//					// ** insert�� �Ϻζ� �����ϸ� ������ ���ܸ� �߻����� �ѹ��Ű�� **
//					// -> ����� ���� ���� ���� �ʿ�
//					throw new FileUploadException(); // ���� ���� �߻�
//				}
//			}
//		}
//		
//		return goodsNo;
//	}
//}
