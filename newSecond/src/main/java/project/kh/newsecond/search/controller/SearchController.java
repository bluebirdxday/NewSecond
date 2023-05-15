package project.kh.newsecond.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import project.kh.newsecond.search.model.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	@GetMapping("/goodsList")
	public String searchGoodsList() {
		return "goods/searchGoodsList";
	}

}
