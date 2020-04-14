package com.mgsoft.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
@Order(1)
public class SessionFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		String url = request.getServletPath();
		System.out.println("url::"+url);
		System.out.println("is session null::"+request.getSession().getAttribute("loggedUser")==null);
		
		response.setHeader("pragma", "no-cache");              
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
        response.setHeader("Expires", "0"); 
		
		if(url.startsWith("/resources") || 
				url.startsWith("/assets") ||
				url.startsWith("/fonts") ||
				url.startsWith("/img") ||
				url.startsWith("/json_files") ||
				url.startsWith("/lib") ||
				url.startsWith("/h2-console")){
			chain.doFilter(req, res);
		}else if(url.startsWith("/app")){
			if(request.getSession().getAttribute("loggedUser")!=null){
				chain.doFilter(req, res);
			}else{
				response.sendRedirect(request.getContextPath()+"/login");
			}
		}else if(url.equals("/")){
			if(request.getSession().getAttribute("loggedUser")!=null){
				response.sendRedirect(request.getContextPath()+"/app/index");
			}else{
				response.sendRedirect(request.getContextPath()+"/login");
			}
		}else if(url.equals("/login") || url.equals("/login/doLogin") || url.equals("/login/logout")){
			chain.doFilter(req, res);
		}
		
		
		
		//temp setting
//		if(url.startsWith("/resources") || url.startsWith("/h2-console") || url.startsWith("/app")){
//			chain.doFilter(req, res);
//		}else if(url.equals("/")){
//			response.sendRedirect(request.getContextPath()+"/app/index");
//		}
	}

	@Override
	public void destroy() {

	}

}
