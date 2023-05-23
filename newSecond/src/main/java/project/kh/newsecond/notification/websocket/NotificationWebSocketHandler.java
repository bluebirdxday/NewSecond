package project.kh.newsecond.notification.websocket;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import project.kh.newsecond.notification.model.dto.Notification;
import project.kh.newsecond.notification.model.service.NotificationService;
import project.kh.newsecond.shop.model.dto.Shop;
import project.kh.newsecond.user.model.dto.User;

public class NotificationWebSocketHandler extends TextWebSocketHandler{
    
		
	    @Autowired
	    private NotificationService service;
	    
	    private Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	    
	    
	     private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<>());
		

		// - 클라이언트와 연결이 완료되고, 통신할 준비가 되면 실행
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {

			 System.out.println("Socket연결");
			 sessions.add(session);
		}



		// - 클라이언트로부터 텍스트 메세지를 받았을때 실행
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			
			// 자바스크립트에서 넘어온 msg
			String msg = message.getPayload();	
			
			ObjectMapper objectMapper = new ObjectMapper();
			
			Notification noti = objectMapper.readValue(msg, Notification.class);
			
			
			int result = service.insertNotification(noti);

	        if(result > 0 ) {
	        	

	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	            noti.setSendDate(sdf.format(new Date()));
	            
	            Notification shop = service.selectShopInfo(noti.getSenderNo());
	            
	            noti.setShopTitle(shop.getShopTitle());
	            noti.setShopProfile(shop.getShopProfile());
	            
	            
	            for(WebSocketSession s : sessions) {
	                
	                // 로그인된 회원 정보 중 회원 번호 얻어오기
	                int loginUserNo = ((User)s.getAttributes().get("loginUser")).getUserNo();
	                
	                
	                // 로그인 상태인 회원 중 targetNo가 일치하는 회원에게 알림 전달
	                if(loginUserNo == noti.getTargetNo()) {
	                    s.sendMessage(new TextMessage(new Gson().toJson(noti)));
	                }
	            }
	            
	        }
		
		}
		

		// - 클라이언트와 연결이 종료되면 실행
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			logger.info("Socket 종료");
			sessions.remove(session);
			
		}
    
}


