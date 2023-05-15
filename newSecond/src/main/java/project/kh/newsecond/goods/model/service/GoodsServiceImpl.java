package project.kh.newsecond.goods.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.goods.model.dao.GoodsDAO;

@Service
public class GoodsServiceImpl {
	
	@Autowired
	private GoodsDAO dao;

}
