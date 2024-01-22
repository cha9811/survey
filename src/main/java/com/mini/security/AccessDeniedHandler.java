package com.mini.security;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;

@Component
//접근 불가 에러시 해당 페이지 출력됨
public class AccessDeniedHandler implements org.springframework.security.web.access.AccessDeniedHandler{
    
	private static final Logger logger = LoggerFactory.getLogger(AccessDeniedHandler.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		System.out.println("Access Denied Handler");
		System.out.println(request.getContextPath());
		System.out.println(accessDeniedException.getMessage());
		logger.error("Access Denied Handler");
		response.sendRedirect(request.getContextPath() + "/accessError");
	}
}
