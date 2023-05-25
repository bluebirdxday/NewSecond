package project.kh.newsecond.goodsboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.goodsboard.model.dto.Files;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.goodsboard.model.service.MyGoodsService;

@Controller
@RequestMapping("/myGoods")
public class myGoodsController {
	
	@Autowired
	private MyGoodsService service;
	
	// 게시글 수정 페이지 단순 리턴
	@PostMapping("/modify")
	public String myGoodsMod(
			GoodsBoard goodsBoard,
			Model model
			) {
		
		model.addAttribute(goodsBoard);
				
		return "writing/modifyPage";
		// (/WEB-INF/views/)writing/modifyPage(.jsp)
	}
	
	// 게시글 수정
	@PostMapping("/modifySubmit")
	public String myGoodsModify(
			HttpSession session,
			GoodsBoard goodsBoard,
			List<Files> filesList,
			@RequestParam(value="image", required=false) List<MultipartFile> images, // 이미지 객체 생성
			Model model
			) throws IllegalStateException, IOException {
		
		// 0. innerText로 불러온 category2를 categoryNo에 세팅
		if(goodsBoard.getCategory2().equals("신발"))			{goodsBoard.setCategoryNo(1);  };
		if(goodsBoard.getCategory2().equals("가방"))			{goodsBoard.setCategoryNo(2);  };
		if(goodsBoard.getCategory2().equals("시계/주얼리"))		{goodsBoard.setCategoryNo(3);  };
		if(goodsBoard.getCategory2().equals("패션 액세서리"))		{goodsBoard.setCategoryNo(4);  };
		if(goodsBoard.getCategory2().equals("디지털/가전"))		{goodsBoard.setCategoryNo(5);  };
		if(goodsBoard.getCategory2().equals("스포츠/레저"))		{goodsBoard.setCategoryNo(6);  };
		if(goodsBoard.getCategory2().equals("차량/오토바이"))		{goodsBoard.setCategoryNo(7);  };
		if(goodsBoard.getCategory2().equals("스타굿즈"))			{goodsBoard.setCategoryNo(8);  };
		if(goodsBoard.getCategory2().equals("키덜트"))			{goodsBoard.setCategoryNo(9);  };
		if(goodsBoard.getCategory2().equals("예술/희귀/수집품"))	{goodsBoard.setCategoryNo(10); };
		if(goodsBoard.getCategory2().equals("음반/악기"))		{goodsBoard.setCategoryNo(11); };
		if(goodsBoard.getCategory2().equals("도서/티켓/문구"))	{goodsBoard.setCategoryNo(12); };
		if(goodsBoard.getCategory2().equals("뷰티/미용"))		{goodsBoard.setCategoryNo(13); };
		if(goodsBoard.getCategory2().equals("가구/인테리어"))		{goodsBoard.setCategoryNo(14); };
		if(goodsBoard.getCategory2().equals("생활/주방용품"))		{goodsBoard.setCategoryNo(15); };
		if(goodsBoard.getCategory2().equals("공구/산업용품"))		{goodsBoard.setCategoryNo(16); };
		if(goodsBoard.getCategory2().equals("식품"))			{goodsBoard.setCategoryNo(17); };
		if(goodsBoard.getCategory2().equals("유아동/출산"))		{goodsBoard.setCategoryNo(18); };
		if(goodsBoard.getCategory2().equals("반려동물용품"))		{goodsBoard.setCategoryNo(19); };
		if(goodsBoard.getCategory2().equals("기타"))			{goodsBoard.setCategoryNo(20); };
		if(goodsBoard.getCategory2().equals("나눔"))			{goodsBoard.setCategoryNo(21); };
		if(goodsBoard.getCategory2().equals("구인"))			{goodsBoard.setCategoryNo(22); };
		if(goodsBoard.getCategory2().equals("남성의류"))			{goodsBoard.setCategoryNo(23); };
		if(goodsBoard.getCategory2().equals("여성의류"))			{goodsBoard.setCategoryNo(24); };
	
		// 1. goodsBoard 객체에 잘 담겼는지 확인
		
		// 2. webPath, filePath 생성
		String webPath = "/resources/src/user/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		// 3. service에 전달해서 result 받기 *************
		int result = service.myGoodsModify(goodsBoard, images, webPath, filePath);
		
		String path = "redirect:";
		
		// -> 왜 3행 밑 goodsNo에서 빨간 줄이 뜨지? 일단은 변수 선언하자..
		int goodsNo = goodsBoard.getGoodsNo();
		
		if(result > 0) {
			path += "/goods/" + goodsNo; // 성공시 등록 화면 리턴
		} else {
			path += "modify"; // 실패시 수정 화면 리턴
		}
		
		return path;
		// return redirect:myGoods/modify -> redirect와 return은 다름에 유의
	}
	
	
	
	
	
	
	
	// 게시글 삭제
	@GetMapping("/delete")
	public String myGoodsDelete(
			GoodsBoard goodsBoard,
			RedirectAttributes ra,
			HttpSession session,
			Model model
			) {
		
		int result = service.myGoodsDelete(goodsBoard);
		
		String path = "redirect:";
		
		if(result > 0) { // 성공시 http://localhost/shop/{userNo}
			path += "/shop/" + goodsBoard.getUserNo();
		} else { // 실패시 http://localhost/goods/{goodsNo}
			path += "/goods/" + goodsBoard.getGoodsNo();
		}
		
		return path;
	}

}
