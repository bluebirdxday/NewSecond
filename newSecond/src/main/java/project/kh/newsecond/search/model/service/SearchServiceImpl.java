package project.kh.newsecond.search.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.search.model.dao.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDAO dao;

}
