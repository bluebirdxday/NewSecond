package project.kh.newsecond.wish.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.wish.model.dao.WishDAO;
import project.kh.newsecond.wish.model.dto.Wish;
@Service
public class WishServiceImpl implements WishService {

	@Autowired 
	private WishDAO wishDao;

	@Override
	public List<Wish> wishSelectList(User user) {
		
		return wishDao.wishSelectList(user);
	}

}
