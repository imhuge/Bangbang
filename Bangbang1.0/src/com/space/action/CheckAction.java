package com.space.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.space.po.User;
import com.space.service.UserService;

public class CheckAction extends ActionSupport {
	private UserService userService;
	private String username;
	
	public String execute() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		if(userService.isExited(username)){
			response.getWriter().write("error");
			return null;
		}
		else {
			response.getWriter().write("success");
			return null;
		}
		
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}
