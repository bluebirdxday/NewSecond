package project.kh.newsecond.goodsboard.model.service;

import java.util.List;

import project.kh.newsecond.goodsboard.model.dto.Files;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;

public interface MyGoodsService {

	int myGoodsModify(GoodsBoard goodsBoard, List<Files> filesList); // 게시글 수정
	int myGoodsImageModify(List<Files> FinalImages); // 게시글 이미지 수정

	int myGoodsDelete(GoodsBoard goodsBoard); // 게시글 삭제
	

}
