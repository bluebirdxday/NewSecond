package project.kh.newsecond.notification.websocket;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import project.kh.newsecond.notification.model.dto.Notification;
import project.kh.newsecond.notification.model.service.NotificationService;
import project.kh.newsecond.user.model.dto.User;

// 실시간 알림 토스트 처리를 위한 웹소켓
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
			String payload = message.getPayload();	
			
			ObjectMapper objectMapper = new ObjectMapper();
			
		    JsonNode jsonNode = objectMapper.readTree(payload);
		    
	        if (jsonNode.isArray()) {
	        	// 배열로 간주
	            List<Notification> notifications = objectMapper.readValue(payload, new TypeReference<List<Notification>>() {});
	            processNotifications(notifications);
	        } else {
	        	// 단일 객체로 간주
	            Notification notification = objectMapper.readValue(payload, Notification.class);
	            processNotification(notification);
	        }
		    
		}
		
		
		private void processNotifications(List<Notification> notifications) throws Exception {
	        for (Notification notification : notifications) {
	            processNotification(notification);
	        }
	    }
		
	    private void processNotification(Notification notification) throws Exception {
	    	
	    	int existCheck = service.selectExistNotification(notification);
	    	
	    	System.out.println(existCheck);
	    	System.out.println(notification);
	    	
	    	
	    	int result = service.insertNotification(notification, existCheck);
	    	

	        if (result > 0) {
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	            notification.setSendDate(sdf.format(new Date()));

	            Notification shop = service.selectShopInfo(notification.getSenderNo());

	            notification.setShopTitle(shop.getShopTitle());
	            notification.setShopProfile(shop.getShopProfile());

	            for (WebSocketSession session : sessions) {
	                int loginUserNo = ((User) session.getAttributes().get("loginUser")).getUserNo();

	                //로그인 세션 정보를 가져와서 targetNo와 일치하는 회원에게 전송
	                if (loginUserNo == notification.getTargetNo()) {
	                    // 비동기적으로 메시지 전송
	                    session.sendMessage(new TextMessage(new Gson().toJson(notification)));
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


