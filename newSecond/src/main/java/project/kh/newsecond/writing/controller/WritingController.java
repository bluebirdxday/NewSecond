package project.kh.newsecond.writing.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.notification.model.dto.Notification;
import project.kh.newsecond.notification.model.service.NotificationService;
import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.writing.model.dto.Writing;
import project.kh.newsecond.writing.model.dto.WritingImage;
import project.kh.newsecond.writing.model.service.WritingService;

@Controller
@RequestMapping("/writing")
@SessionAttributes({"loginUser"})
public class WritingController {
	
	@Autowired
	private WritingService service;
	
	@Autowired
	private NotificationService notiService;

	// 단순 화면 출력
	@GetMapping("/write")
	public String writing() {
		
		// 로그인한 사람만 글쓰기 처리: 로그인한 놈만 글쓰기 이전 페이지에서 처리하면 굳이 기능 없어도 됨
		
		return "writing/writingPage";
		// (/WEB-INF/views/)writing/writingPage(.jsp)
	}
	
	// 글쓰기 버튼 제출 클릭시
	@PostMapping("/submit")
	public String writingInsert(
			Writing writing,
			WritingImage writingImage,
			@RequestParam(value="image", required=false) List<MultipartFile> images, // 이미지 객체 생성
			@SessionAttribute("loginUser") User loginUser,
			RedirectAttributes ra,
			HttpSession session
			) throws IllegalStateException, IOException {
		
		// 0. innerText로 불러온 category2를 categoryNo에 세팅
		if(writing.getCategory2().equals("신발"))			{writing.setCategoryNo(1);  };
		if(writing.getCategory2().equals("가방"))			{writing.setCategoryNo(2);  };
		if(writing.getCategory2().equals("시계/주얼리"))		{writing.setCategoryNo(3);  };
		if(writing.getCategory2().equals("패션 액세서리"))		{writing.setCategoryNo(4);  };
		if(writing.getCategory2().equals("디지털/가전"))		{writing.setCategoryNo(5);  };
		if(writing.getCategory2().equals("스포츠/레저"))		{writing.setCategoryNo(6);  };
		if(writing.getCategory2().equals("차량/오토바이"))		{writing.setCategoryNo(7);  };
		if(writing.getCategory2().equals("스타굿즈"))			{writing.setCategoryNo(8);  };
		if(writing.getCategory2().equals("키덜트"))			{writing.setCategoryNo(9);  };
		if(writing.getCategory2().equals("예술/희귀/수집품"))	{writing.setCategoryNo(10); };
		if(writing.getCategory2().equals("음반/악기"))		{writing.setCategoryNo(11); };
		if(writing.getCategory2().equals("도서/티켓/문구"))	{writing.setCategoryNo(12); };
		if(writing.getCategory2().equals("뷰티/미용"))		{writing.setCategoryNo(13); };
		if(writing.getCategory2().equals("가구/인테리어"))		{writing.setCategoryNo(14); };
		if(writing.getCategory2().equals("생활/주방용품"))		{writing.setCategoryNo(15); };
		if(writing.getCategory2().equals("공구/산업용품"))		{writing.setCategoryNo(16); };
		if(writing.getCategory2().equals("식품"))			{writing.setCategoryNo(17); };
		if(writing.getCategory2().equals("유아동/출산"))		{writing.setCategoryNo(18); };
		if(writing.getCategory2().equals("반려동물용품"))		{writing.setCategoryNo(19); };
		if(writing.getCategory2().equals("기타"))			{writing.setCategoryNo(20); };
		if(writing.getCategory2().equals("나눔"))			{writing.setCategoryNo(21); };
		if(writing.getCategory2().equals("구인"))			{writing.setCategoryNo(22); };
		if(writing.getCategory2().equals("남성의류"))			{writing.setCategoryNo(23); };
		if(writing.getCategory2().equals("여성의류"))			{writing.setCategoryNo(24); };
		
		// 1. writing에 userNo 세팅
		writing.setUserNo(loginUser.getUserNo());
		// -> writing에 userNo, categoryNo + @ 완료
		
		// 2. writing 객체에 잘 담겼는지 확인
		
		
		// 3. webPath, filePath 생성:
								// webPath: 상대경로
								// filePath: 절대경로
		String webPath = "/resources/src/user/"; // -> 웹에서 불러오는 문서는 webapp이 최상위폴더(/)
		String filePath = session.getServletContext().getRealPath(webPath);
		// -> writing, images, webPath, filePath 객체 완성
		
		// 4. service 호출
		// -> 원래는 단순 result에 대입했지만 goodsNo를 return시켜야 해서 map으로 두 개를 담아서 처리함
		Map<String, Object> resultService = service.writingInsert(writing, images, webPath, filePath);
		
		// 5. 결과 리턴
		String path = "redirect:";
		/* "redirect:/goods/{goodsNo}" */
		
		// 6. map 꺼내기
		int result = (int) resultService.get("result");
		int goodsNo = (int) resultService.get("goodsNo");
		
		// 7. result, goodsNo 담기
		
		if(result > 0) {
			session.setAttribute("uploadComplete", "ok");
			path += "/goods/" + goodsNo; // 성공시 write 화면 리턴
			
			
		} else {
			path += "write"; // 실패시 write 화면 리턴
		}
		
		return path;
		// return redirect:/goods/234 -> 앞에 /를 붙이지 않으면 해당 requestMapping의 기본 주소부터 시작, /를 붙이면 해당 url 주소부터 시작
		// return redirect:writing/write -> redirect와 return은 다름에 유의
	}
}










