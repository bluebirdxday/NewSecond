package project.kh.newsecond.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@GetMapping("/goodsList")
	public String searchGoodsList() {
		return "goods/searchGoodsList";
	}

}
