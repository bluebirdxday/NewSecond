package project.kh.newsecond.priceView.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.priceView.model.dto.PriceViewKeyword;
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
			PriceViewKeyword keywords,
			Model model,
			GoodsBoard goodsBoard
			) {
		
		keywords.setDetailText(keyword);
		keywords.setTitle(keyword);
		
		// null을 담을 수 있는 변수 Integer에 저장하기 위해 int 대신 Integer를 사용
		Integer result = service.goodsPriceSelect(keywords); // 1달 내 
		Integer result2 = service.goodsPriceSelect2(keywords); // 1달~2달 내
		Integer result3 = service.goodsPriceSelect3(keywords); // 2달~3달 내
		
		// 왜 안되는지 이유를 파악할 수 없음
		if (result == null)  result = 1;
		if (result2 == null) result2 = 1;
		if (result3 == null) result3 = 1;
		
		// model에 result를 result라는 이름으로 대입
	    model.addAttribute("result", result);
	    model.addAttribute("result2", result2);
	    model.addAttribute("result3", result3);
	    
//	    ---------------------------------------------------------------------
	    
	    // 최근 올라온 상품을 위한 searchList
	    goodsBoard.setGoodsTitle(keyword); // 타이틀과 내용 모두 sql에서 처리
	    
	    List<GoodsBoard> searchList = service.selectSearchKeyword(goodsBoard);
		
	    // 위에서 담긴 searchList를 searchList라는 변수로 model에 담기
		model.addAttribute("searchList", searchList);
		
		return "priceView/priceViewResultPage"; // 앞에 /가 없는 상대경로로 return
	}
}
