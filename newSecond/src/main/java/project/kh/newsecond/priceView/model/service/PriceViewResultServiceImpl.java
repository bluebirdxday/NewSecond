package project.kh.newsecond.priceView.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.priceView.model.dao.PriceViewResultDAO;
import project.kh.newsecond.priceView.model.dto.PriceViewKeyword;

@Service
public class PriceViewResultServiceImpl implements PriceViewResultService {

	@Autowired
	private PriceViewResultDAO dao;

	// 1달 내
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int goodsPriceSelect(PriceViewKeyword keywords) {
		
		int result = dao.goodsPriceSelect(keywords);
		
		return result;
	}

	// 1달~2달 내
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int goodsPriceSelect2(PriceViewKeyword keywords) {
		
		int result2 = dao.goodsPriceSelect2(keywords);
		
		return result2;
	}

	// 2달~3달 내
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int goodsPriceSelect3(PriceViewKeyword keywords) {
		
		int result3 = dao.goodsPriceSelect3(keywords);
		
		return result3;
	}

	// 키워드로 최근 15개 조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<GoodsBoard> selectSearchKeyword(GoodsBoard goodsBoard) {
		
		List<GoodsBoard> searchList = dao.selectSearchKeyword(goodsBoard);
		
		return searchList;
	}
	
	
}
