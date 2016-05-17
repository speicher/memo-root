package org.memo.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.ext.XLogger;
import org.slf4j.ext.XLoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/**
 * Danica个人社区
 * @author Danica
 * Date 2016.5.2
 * Session检查
 */
public class SessionCheckInterceptor implements HandlerInterceptor  {
	protected static final XLogger logger = XLoggerFactory.getXLogger(SessionCheckInterceptor.class);
	
	private String sessionKey;
	
	private String logoutUrl;

    public String getSessionKey() {
		return sessionKey;
	}

	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}

	public void setLogoutUrl(String logoutUrl) {
		this.logoutUrl = logoutUrl;
	}
	 /** 
     * preHandle方法是进行处理器拦截用的，顾名思义，该方法将在Controller处理之前进行调用，SpringMVC中的Interceptor拦截器是链式的， 
     * 可以同时存在多个Interceptor，然后SpringMVC会根据声明的前后顺序一个接一个的执行，而且所有的Interceptor中的preHandle方法都会 
     * 在Controller方法调用之前调用。SpringMVC的这种Interceptor链式结构也是可以进行中断的，这种中断方式是令preHandle的返回值为false，
     * 当preHandle的返回值为false的时候整个请求就结束了。 
     */  
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String ajaxFlag = request.getHeader("x-requested-with");
		HttpSession session = request.getSession();
		Object tempObj = null;
		if (null != session) {
			tempObj = session.getAttribute(sessionKey);
		}
		if (null != tempObj) {
			return true;
		}

		//如果是ajax请求头会有，x-requested-with
		if ("XMLHttpRequest".equalsIgnoreCase(ajaxFlag)) {
			response.setHeader("sessionTimeOutFlag", "true");//设置标志状态
			response.getOutputStream().println("<html>");
			response.getOutputStream().println("<script>");
			response.getOutputStream().println("window.open ('" +logoutUrl+ "','_top')");
			response.getOutputStream().println("</script>");
			response.getOutputStream().println("</html>");
		} else {
			response.getOutputStream().println("<html>");  
			response.getOutputStream().println("<script>");  
			response.getOutputStream().println("window.open ('" +logoutUrl+ "','_top')");
			response.getOutputStream().println("</script>");  
			response.getOutputStream().println("</html>");
			//response.sendRedirect(path);
		}
		return false;
	}
	
	/** 
     * 这个方法只会在当前这个Interceptor的preHandle方法返回值为true的时候才会执行。 
     * postHandle是进行处理器拦截用的，它的执行时间是在Controller的方法调用之后执行，
     * 但是它会在DispatcherServlet进行视图的渲染之前执行，也就是说在这个方法中你可以对ModelAndView进行操作。
     * 这个方法的链式结构跟正常访问的方向是相反的，即，先声明的Interceptor拦截器该方法反而会后调用。 
     */  
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	/** 
     * 该方法也是需要当前对应的Interceptor的preHandle方法的返回值为true时才会执行。
     * 该方法将在整个请求完成之后，即DispatcherServlet渲染了视图执行， 
     * 这个方法的主要作用是用于清理资源的。 
     */  
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
