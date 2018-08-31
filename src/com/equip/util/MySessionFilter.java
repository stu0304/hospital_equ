package com.equip.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MySessionFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest httpRequest = (HttpServletRequest) request;
	        HttpServletResponse httpResponse = (HttpServletResponse) response;
	        HttpSession session = httpRequest.getSession();
	        String redirectURL= httpRequest.getContextPath();
	        String url = httpRequest.getRequestURI();
	    	if(url.indexOf("mylogin.do")!=-1||url.indexOf("gotoRegister.do")!=-1||url.indexOf("addSysUser.do")!=-1)
	    	{
	    		 chain.doFilter(request, response);// 不可少，否则请求会出错
	    	}else{
	    		   Object obj = session.getAttribute("myuser");
	   	        if (obj== null||"".equals(obj.toString())) {
	   	        	httpResponse.sendRedirect(redirectURL);
	   	            } else {
	   	                chain.doFilter(request, response);// 不可少，否则请求会出错
	   	            	}
	    	}
	        } 

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
