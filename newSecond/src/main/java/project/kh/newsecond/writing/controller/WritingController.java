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

	// �۾��� ������ ����
	@GetMapping("/write")
	public String writing() {
		
		// 1. �α����ؾ����� ������ �� �ֵ��� �ϰ�
		// 2. �α����� ���� �ʾ��� ���� �ٸ� �������� ���ư��� ��� �߰�?
		
		return "writing/writingPage";
		// (/WEB-INF/views/)writing/writingPage(.jsp)
	}
	
	// �Խñ� ����: ����� �Խñ� �������� name �±׷� �ҷ��� 7���� form�� �����
	@PostMapping("/submit")
	public String writingInsert(
			@ModelAttribute Writing writing,
			@ModelAttribute WritingImage writingImage,
			@RequestParam(value="image", required=false) List<MultipartFile> images, // �̹��� ���� ���
			@SessionAttribute("loginUser") User loginUser,
			RedirectAttributes ra,
			HttpSession session,
			Model model
			) throws IllegalStateException, IOException {
		// 0. ī�װ� ��ȣ ����: jsp���� innerText�� �������� ������ ī�װ� ��ȣ�� �����ؾ� ��
		if(writing.getCategory2().equals("�Ź�"))			{writing.setCategoryNo(1); };
		if(writing.getCategory2().equals("����"))			{writing.setCategoryNo(2); };
		if(writing.getCategory2().equals("�ð�/�־�"))		{writing.setCategoryNo(3); };
		if(writing.getCategory2().equals("�м� �׼�����"))		{writing.setCategoryNo(4); };
		if(writing.getCategory2().equals("������/����"))		{writing.setCategoryNo(5); };
		if(writing.getCategory2().equals("������/����"))		{writing.setCategoryNo(6); };
		if(writing.getCategory2().equals("����/�������"))		{writing.setCategoryNo(7); };
		if(writing.getCategory2().equals("��Ÿ����"))			{writing.setCategoryNo(8); };
		if(writing.getCategory2().equals("Ű��Ʈ"))			{writing.setCategoryNo(9); };
		if(writing.getCategory2().equals("����/���/����ǰ"))	{writing.setCategoryNo(10); };
		if(writing.getCategory2().equals("����/�Ǳ�"))		{writing.setCategoryNo(11); };
		if(writing.getCategory2().equals("����/Ƽ��/����"))	{writing.setCategoryNo(12); };
		if(writing.getCategory2().equals("��Ƽ/�̿�"))		{writing.setCategoryNo(13); };
		if(writing.getCategory2().equals("����/���׸���"))		{writing.setCategoryNo(14); };
		if(writing.getCategory2().equals("��Ȱ/�ֹ��ǰ"))		{writing.setCategoryNo(15); };
		if(writing.getCategory2().equals("����/�����ǰ"))		{writing.setCategoryNo(16); };
		if(writing.getCategory2().equals("��ǰ"))			{writing.setCategoryNo(17); };
		if(writing.getCategory2().equals("���Ƶ�/���"))		{writing.setCategoryNo(18); };
		if(writing.getCategory2().equals("�ݷ�������ǰ"))		{writing.setCategoryNo(19); };
		if(writing.getCategory2().equals("��Ÿ"))			{writing.setCategoryNo(20); };
		if(writing.getCategory2().equals("����"))			{writing.setCategoryNo(21); };
		if(writing.getCategory2().equals("����"))			{writing.setCategoryNo(22); };
		if(writing.getCategory2().equals("�����Ƿ�"))			{writing.setCategoryNo(23); };
		if(writing.getCategory2().equals("�����Ƿ�"))			{writing.setCategoryNo(24); };
		
		// 1. �α����� ȸ�� ��ȣ�� ���� writing�� ����
		writing.setUserNo(loginUser.getUserNo());
		// -> writing�� userNo, categoryNo + @ ��� ���
		
		// 2. ���������� ������ ������ writing�� ���� (�ڵ�)
		/*
			System.out.println(writing.getTitle());
			System.out.println(writing.getDetailText());
			System.out.println(writing.getPrice());
			System.out.println(writing.getQuantity());
			System.out.println(writing.getCondition());
			System.out.println(writing.getCategory2());
		*/
		
		// 3. ���ε�� �̹����� ������ ����
		String webPath = "/resources/src/user/${userNo}"; // ������ ������ ��� ��⳪?
		String filePath = session.getServletContext().getRealPath(webPath);
		// -> writing, images, webPath, filePath ��ü �ϼ�
		
		// 4-1. ���� ����: ���� �� ��� return
		int result = service.writingInsert(writing, images, webPath, filePath);
	
		
		// 5. �Խñ� ���� ���� ��
		String message = null;
		String path = "redirect:";
		
		if(result > 0) {
			message = "�Խñ��� ��ϵǾ����ϴ�.";
			path += "writing/write"; // ������ �Խñ� �ۼ� �������� �����̷�Ʈ
		} else {
			message = "�Խñ� ��Ͽ� �����߽��ϴ�.";
			path += "chatting/chat"; // ���н� ä�� �������� �����̷�Ʈ
		}
		
		return path;
		// return redirect:writing/write -> �����̷�Ʈ�� �׳� return�� �ٸ�!
	}
}










