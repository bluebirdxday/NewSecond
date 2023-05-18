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
		
		// 0. XSS ���� ó��
		writing.setTitle(Util.XXSHandling(writing.getTitle()));
		writing.setDetailText(Util.XXSHandling(writing.getDetailText()));
		
		// 1. WRITING ���̺� INSERT�ϱ�
		int result = dao.writingInsert(writing);
		
		// 2. �Խñ� ���� ���� �� ���ε�� �̹����� �ִٸ� files ���̺� �����ϴ� DAO ȣ��
		if(result > 0) { // �̹��� ���� �Խñ� ���� ����
			
			// �̹��� ���� �õ�
			int result2 = dao.writingImageInsert(images);
			
			if(result2 == images.size()) { // ���ε� �̹����� 3���̰� ��� 3�� ��� ���� �����ߴٸ�
				
				
				// �� ���̺� ��� ���� ���� == ���� ����
				
			}
			
		} else { // �Խñ� ���� ����
//			throw new Exception(); // ���� ���� �߻� -> ���߿� ���� �߻� Ŭ������ ����
		}
		
		return result;
	}
}	
		
		
		