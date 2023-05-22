package project.kh.newsecond.priceView.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.priceView.model.dao.PriceViewResultDAO;
import project.kh.newsecond.priceView.model.dto.PriceViewKeyword;

@Service
public class PriceViewResultServiceImpl implements PriceViewResultService {

	@Autowired
	private PriceViewResultDAO dao;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int goodsPriceSelect(PriceViewKeyword keywords) {
		
		int result = dao.goodsPriceSelect(keywords);
		
		return result;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int goodsPriceSelect2(PriceViewKeyword keywords) {
		
		int result2 = dao.goodsPriceSelect2(keywords);
		
		return result2;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int goodsPriceSelect3(PriceViewKeyword keywords) {
		
		int result3 = dao.goodsPriceSelect3(keywords);
		
		return result3;
	}
	
	
	
}
