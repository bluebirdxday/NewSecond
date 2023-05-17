package project.kh.newsecond.priceView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/priceView")
public class PriceViewResultController {

	@GetMapping("/priceViewResult")
	public String priceViewResult() {
		
		return "priceView/priceViewResult";
	}
}