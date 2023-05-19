package project.kh.newsecond.writing.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import project.kh.newsecond.writing.model.dto.Writing;


public interface WritingService {

	int writingInsert(Writing writing, List<MultipartFile> images, String webPath, String filePath) throws IllegalStateException, IOException ;
}
