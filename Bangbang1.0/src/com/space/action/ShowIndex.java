package com.space.action;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.space.service.MessageService;
import com.space.service.UserService;

public class ShowIndex extends ActionSupport{
	private MessageService messageService;
	private UserService userService;
	private int currentPage;
	
	public String execute() throws Exception
	{
		//显示热门帮帮
		Map session = ActionContext.getContext().getSession();
		String username= (String) session.get("username");
		System.out.println(username);
		List<Message> hot = new ArrayList<>();
		List<Account> bangTop = new ArrayList<>();
		//获取用户最新的说说
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());
		page.setEveryPage(5);
		Result result = new Result();
		result = messageService.showMessageByPage(page);
		page = result.getPage();
		List<Message> new5 = new ArrayList<>();
		new5 = result.getList();
		
		hot = messageService.showHotMessage();
		bangTop = messageService.showBangTop();
		HttpServletRequest request = ServletActionContext.getRequest();
		if(username != null){
			int userId = userService.getUserId(username);
			int bang = messageService.getBangByUser(userId);
			request.setAttribute("bang",bang);
			request.setAttribute("userId", userService.getUserId(username));
			//request.setAttribute("userImg", userService.getHeadImg(username));
		}
		Map<Integer,String> userList = new HashMap<>();
		userList = userService.getUserNameMap();
		
		request.setAttribute("hot",hot);
		request.setAttribute("bangTop",bangTop);
		request.setAttribute("new5",new5);
		request.setAttribute("userList", userList);
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

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
}
