package project.kh.newsecond.priceView.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.priceView.model.dao.PriceViewResultDAO;

@Service
public class PriceViewResultImpl implements PriceViewResult {

	@Autowired
	private PriceViewResultDAO dao;
}
