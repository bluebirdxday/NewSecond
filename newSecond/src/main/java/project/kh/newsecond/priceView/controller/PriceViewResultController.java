package project.kh.newsecond.priceView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/priceView")
public class PriceViewResultController {

	@GetMapping("/priceResultSee")
	public String priceViewResult() {
		
		return "priceView/priceViewResultPage";
		// (/WEB-INF/views/)priceView/priceViewResultPage(.jsp)
	}
	
	// iphone 검색 시 localhost/priceView/priceSee/search?keyword=iphone 으로 이동
	@GetMapping("/priceSee/search")
	public String priceViewSearch(@RequestParam("keyword") String keyword) {
		
		return "priceView/priceViewResultPage";
	}
}
