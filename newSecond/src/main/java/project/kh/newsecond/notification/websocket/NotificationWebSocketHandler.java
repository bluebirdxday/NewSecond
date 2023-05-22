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
import project.kh.newsecond.user.model.dto.User;

public class NotificationWebSocketHandler extends TextWebSocketHandler{
    
		
	    @Autowired
	    private NotificationService service;
	    
	    private Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	    
	    
	     private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<>());

	    // 로그인 중인 유저
	    // Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	    
		

		// - 클라이언트와 연결이 완료되고, 통신할 준비가 되면 실행
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {

			 System.out.println("Socket연결");
			 sessions.add(session);
			
//			String senderNo = getUserNo(session); // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
//			
//			if(senderNo!=null) {
//				logger.info(senderNo + "연결됨");
//				users.put(senderNo, session);		// 로그인 중인 개별 유저 저장
//				
//			}
		}



		// - 클라이언트로부터 텍스트 메세지를 받았을때 실행
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			
			// 자바스크립트에서 넘어온 msg
			String msg = message.getPayload();	
			System.out.println("msg : " + msg);
			
			
			ObjectMapper objectMapper = new ObjectMapper();
			
			Notification noti = objectMapper.readValue( message.getPayload(), Notification.class);
			
			System.out.println(noti);
		
			
			int result = service.insertNotification(noti);

			
	        if(result > 0 ) {
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	            noti.setSendDate(sdf.format(new Date()));
	            
	            
	            for(WebSocketSession s : sessions) {
	                
	                // 로그인된 회원 정보 중 회원 번호 얻어오기
	                int loginUserNo = ((User)s.getAttributes().get("loginUser")).getUserNo();
	                
	                System.out.println("로그인회원 : " + loginUserNo);
	                
	                // 로그인 상태인 회원 중 targetNo가 일치하는 회원에게 메세지 전달
	                if(loginUserNo == noti.getTargetNo() || loginUserNo == noti.getSenderNo()) {
	                    
	                    s.sendMessage(new TextMessage(new Gson().toJson(noti)));
	                }
	            }
	            
	            
	        }
			
//			String senderNo = getUserNo(session);
//			
//			// 특정 유저에게 보내기
//			String msg = message.getPayload();
//			
//			if(msg!=null) {
//				
//				String[] str = msg.split(",");
//				logger.info(str.toString());
//				
//				if(str!=null && str.length==4) {
//					String type = str[0];
//					String target = str[1];
//					String content = str[2];
//					String url = str[3];
//					
//					WebSocketSession targetSession = users.get(target);		// 메세지를 받을 세션 조회
//					
//					if(targetSession!=null) {
//						TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>" );
//						targetSession.sendMessage(tmpMsg);
//					}
//					
//					
//				}
//			}
//			
			
		
		}
		
		

		// - 클라이언트와 연결이 종료되면 실행
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			logger.info("Socket 종료");
			sessions.remove(session);
			
//			String senderNo = getUserNo(session);
//			if(senderNo!=null) {	// 로그인 값이 있는 경우만
//				logger.info(senderNo + " 연결 종료됨");
//				users.remove(senderNo);
//				users.remove(session);
//			}
//			
			
		}
    
		
		// 접속한 유저의 http세션을 조회하여 id를 얻는 함수
//		private String getUserNo(WebSocketSession session) {
//			Map<String, Object> httpSession = session.getAttributes();
//			String m_id = (String) httpSession.get("m_id"); // 세션에 저장된 m_id 기준 조회
//			return m_id==null? null: m_id;
//		}
}


