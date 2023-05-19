package project.kh.newsecond.priceView.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.kh.newsecond.priceView.model.service.PriceViewResultService;
import project.kh.newsecond.priceView.model.service.PriceViewService;
import project.kh.newsecond.writing.model.service.WritingService;

@Controller
@RequestMapping("/priceView")
public class PriceViewResultController {
	
	@Autowired
	private PriceViewResultService service;

	// 단순 페이지 연결
	@GetMapping("/priceResultSee")
	public String priceViewResult() {
		
		return "priceView/priceViewResultPage";
		// (/WEB-INF/views/)priceView/priceViewResultPage(.jsp)
	}
	
	// iphone 으로 검색하면 localhost/priceView/priceSee/search?keyword=iphone 으로 연결
	@GetMapping("/priceSee/search")
	public String priceViewSearch(
			@RequestParam("keyword") String keyword,
			Model model
			) {
		
		int result = service.goodsPriceSelect(keyword);
		
//	    model.addAttribute("result", result);
		
		return "priceView/priceViewResultPage";
	}
}
