package project.kh.newsecond.goodsboard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.goodsboard.model.dto.Files;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;

@Repository
public class MyGoodsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시글 삭제
	public int myGoodsDelete(GoodsBoard goodsBoard) {
		return sqlSession.update("goodsBoardMapper.myGoodsDelete", goodsBoard);
	}

	// 게시글 수정
	public int myGoodsModify(GoodsBoard goodsBoard) {
		return sqlSession.update("goodsBoardMapper.myGoodsModify", goodsBoard);
	}
	
	// 게시글 수정 후 이미지 삽입 시도
	public int myGoodsImageModify(List<Files> FinalImages) {
		return sqlSession.update("goodsBoardMapper.myGoodsImageModify", FinalImages);
	}

	
}
