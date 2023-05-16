package project.kh.newsecond.priceView.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.priceView.model.dao.PriceViewDAO;

@Service
public class PriceViewImpl implements PriceView {

	@Autowired
	private PriceViewDAO dao;
}
