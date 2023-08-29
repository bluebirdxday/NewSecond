package project.kh.newsecond.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import project.kh.newsecond.notification.model.service.NotificationService;
import project.kh.newsecond.user.model.dto.User;

// Interceptor : Dispatcher Servlet -> Controller(or View) 요청이나
//						Controller(or View) -> Dispatcher Servlet 응답을 가로채는 객체

// Client <-> Filter <-> Dispatcher Servlet <-> Interceptior <-> Controller
// 스프링에서만 제공
public class NotificationInterceptor implements HandlerInterceptor{

	@Autowired
	private NotificationService service;
	
	/*
	 * preHandle (전처리) : Dispatcher Servlet -> Controller 사이
	 * postHandle (후처리) : Controller -> Dispatcher Servlet 사이
	 * afterCompletion (뷰 완성 후) : View Resolver -> Dispatcher Servlet 사이
	 * */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		// 세션에서 로그인 정보 읽기
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        
        int count = 0;
        
        // 읽지 않은 알림 개수 조회
        if (loginUser != null) {
        	count = service.selectNotificationCount(loginUser.getUserNo());
			request.setAttribute("hasUnreadNotifications", count);
			
		}else {
			request.setAttribute("hasUnreadNotifications", 0);
		}
			
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

	
}
