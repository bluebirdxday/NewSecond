package project.kh.newsecond.goodsboard.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import project.kh.newsecond.goodsboard.model.dto.Files;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;

public interface MyGoodsService {

	int myGoodsModify(GoodsBoard goodsBoard, List<MultipartFile> images, String webPath, String filePath) throws IllegalStateException, IOException; // 게시글 수정

	int myGoodsDelete(GoodsBoard goodsBoard); // 게시글 삭제
	

}
