package project.kh.newsecond.chatting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.chatting.model.dao.ChattingDAO;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private ChattingDAO dao;
}
