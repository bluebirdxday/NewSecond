package project.kh.newsecond.wish.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.wish.model.dto.Wish;
import project.kh.newsecond.wish.model.service.WishService;

@Controller
@RequestMapping("/wish")
@SessionAttributes({"loginUser"})
public class WishController {

	@Autowired
	private WishService wishService;
	
	@GetMapping("/wish")
	public String wish(
			@SessionAttribute(value="loginUser", required=false) User loginUser,
			Wish wish,User user){
		
		 	List<Wish> wishList = wishService.wishSelectList(user);
		
		 	System.out.println(wishList);
		
		return "wish/wish";
	
}




		
	

	
}
