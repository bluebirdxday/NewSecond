package project.kh.newsecond.priceView.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.priceView.model.dao.PriceViewResultDAO;

@Service
public class PriceViewResultServiceImpl implements PriceViewResultService {

	@Autowired
	private PriceViewResultDAO dao;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int goodsPriceSelect(String keyword) {
		
		int result = dao.goodsPriceSelect(keyword);
		
		return result;
	}
}
