package project.kh.newsecond.priceView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/priceView")
public class PriceViewController {

	// /priceView/priceSee url로 들어오면 priceView/priceViewPage.jsp를 리턴함
	@GetMapping("/priceSee")
	public String priceView() {
		
		return "priceView/priceViewPage";
		// (/WEB-INF/views/)priceView/priceViewPage(.jsp)
	}
}
