package com.space.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.space.fenye.Page;
import com.space.fenye.Result;
import com.space.po.Account;
import com.space.po.Message;
import com.space.po.User;
import com.space.service.MessageService;
import com.space.service.UserService;

public class ShowUserInfo extends ActionSupport{
	private MessageService messageService;
	private UserService userService;
	private int userId;
	public String execute() throws Exception
	{
		//获取用户说说
		Map session = ActionContext.getContext().getSession();
		List<Message> userAll = new ArrayList<>();
		if(userId == 0){
			userId = (Integer) session.get("userId");
		}
		userAll = messageService.showUserAllMessage(userId);
		//获取用户的帮帮数
		int bang = messageService.getBangByUser(userId);
		User user = userService.getUserById(userId);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("userAll",userAll);
		request.setAttribute("username",user.getUsername());
		request.setAttribute("signature",user.getSignature());
		request.setAttribute("bang",bang);
		//request.setAttribute("userImg", user.getUserheadimg());
		return this.SUCCESS;
	}
	
	public MessageService getMessageService() {
		return messageService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}

