package project.kh.newsecond.writing.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	// 글쓰기 페이지 접속
	@GetMapping("/write")
	public String writing() {
		
		// 1. 로그인해야지만 접속할 수 있도록 하고
		// 2. 로그인을 하지 않았을 때는 다른 페이지로 돌아가기 기능 추가?
		
		return "writing/writingPage";
		// (/WEB-INF/views/)writing/writingPage(.jsp)
	}
	
	// 게시글 제출: 여기로 게시글 페이지의 name 태그로 불러온 7개의 form이 제출됨
	@PostMapping("/submit")
	public String writingInsert(
			@ModelAttribute Writing writing,
			@ModelAttribute WritingImage writingImage,
			@RequestParam(value="image", required=false) List<MultipartFile> images, // 이미지 파일 담김
			@SessionAttribute("loginUser") User loginUser,
			RedirectAttributes ra,
			HttpSession session,
			Model model
			) throws IllegalStateException, IOException {
		// 0. 카테고리 번호 세팅: jsp에서 innerText를 가져오기 떄문에 카테고리 번호를 세팅해야 함
		if(writing.getCategory2().equals("신발"))			{writing.setCategoryNo(1); };
		if(writing.getCategory2().equals("가방"))			{writing.setCategoryNo(2); };
		if(writing.getCategory2().equals("시계/주얼리"))		{writing.setCategoryNo(3); };
		if(writing.getCategory2().equals("패션 액세서리"))		{writing.setCategoryNo(4); };
		if(writing.getCategory2().equals("디지털/가전"))		{writing.setCategoryNo(5); };
		if(writing.getCategory2().equals("스포츠/레저"))		{writing.setCategoryNo(6); };
		if(writing.getCategory2().equals("차량/오토바이"))		{writing.setCategoryNo(7); };
		if(writing.getCategory2().equals("스타굿즈"))			{writing.setCategoryNo(8); };
		if(writing.getCategory2().equals("키덜트"))			{writing.setCategoryNo(9); };
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
		
		// 1. 로그인한 회원 번호를 얻어와 writing에 세팅
		writing.setUserNo(loginUser.getUserNo());
		// -> writing에 userNo, categoryNo + @ 모두 담김
		
		// 2. 페이지에서 가져온 정보룰 writing에 세팅 (자동)
		/*
			System.out.println(writing.getTitle());
			System.out.println(writing.getDetailText());
			System.out.println(writing.getPrice());
			System.out.println(writing.getQuantity());
			System.out.println(writing.getCondition());
			System.out.println(writing.getCategory2());
		*/
		
		// 3. 업로드된 이미지를 서버에 저장
		String webPath = "/resources/src/user/${userNo}"; // 기존에 폴더가 없어도 담기나?
		String filePath = session.getServletContext().getRealPath(webPath);
		// -> writing, images, webPath, filePath 객체 완성
		
		// 4-1. 서비스 연결: 성공 시 양수 return
		int result = service.writingInsert(writing, images, webPath, filePath);
	
		
		// 5. 게시글 삽입 성공 시
		String message = null;
		String path = "redirect:";
		
		if(result > 0) {
			message = "게시글이 등록되었습니다.";
			path += "writing/write"; // 성공시 게시글 작성 페이지로 리다이렉트
		} else {
			message = "게시글 등록에 실패했습니다.";
			path += "chatting/chat"; // 실패시 채팅 페이지로 리다이렉트
		}
		
		return path;
		// return redirect:writing/write -> 리다이렉트와 그냥 return은 다름!
	}
}










