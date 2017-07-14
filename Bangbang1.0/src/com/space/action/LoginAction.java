package com.space.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.space.po.User;
import com.space.service.UserService;

public class LoginAction extends ActionSupport{
	private String username;
	private String password;
	private UserService userService;
	public String execute() throws Exception{
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		HttpServletRequest request = ServletActionContext.getRequest();
		if(userService.loginUser(user))
		{
			request.setAttribute("url", "showIndex.action");
			request.setAttribute("info", "登录成功");
			Map session = ActionContext.getContext().getSession();
			session.put("username", username);
			session.put("userId", userService.getUserId(username));
			return SUCCESS;
		}
		else
		{
			request.setAttribute("url", "#");
			request.setAttribute("info", "登录失败");
			request.setAttribute("reason", "用户名或密码不对");
			return ERROR;
		}
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
