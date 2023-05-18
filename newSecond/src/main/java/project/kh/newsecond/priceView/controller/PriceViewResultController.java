package project.kh.newsecond.priceView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/priceView")
public class PriceViewResultController {

	@GetMapping("/priceResultSee")
	public String priceViewResult() {
		
		return "priceView/priceViewResultPage";
		// (/WEB-INF/views/)priceView/priceViewResultPage(.jsp)
	}
}
