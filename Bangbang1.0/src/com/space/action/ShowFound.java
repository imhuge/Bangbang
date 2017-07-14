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

public class ShowFound extends ActionSupport{
	private MessageService messageService;
	private UserService userService;
	private int currentPage;
	
	public String execute() throws Exception
	{
		Map session = ActionContext.getContext().getSession();
		String username= (String) session.get("username");
		Page page = new Page();
		page.setCurrentPage(currentPage);
		page.setEveryPage(5);
		//获取全部的说说
		Result result = messageService.showMessageByPage(page);
		page = result.getPage();
		List<Message> all = result.getList();
		//获取排行榜
		List<Account> bangTop = new ArrayList<>();
		bangTop = messageService.showBangTop();
		
		List critiqueCounts = new ArrayList();
		for(Message message : all) {
			critiqueCounts.add(messageService.getCritiqueCount(message.getId()));
		}
		Map<Integer,String> userList = new HashMap<>();
		userList = userService.getUserNameMap();
		HttpServletRequest request = ServletActionContext.getRequest();
		if(username != null){
			request.setAttribute("userId", userService.getUserId(username));
			//request.setAttribute("userImg", userService.getHeadImg(username));
		}
		request.setAttribute("all",all);
		request.setAttribute("page", page);
		request.setAttribute("critiqueCounts", critiqueCounts);
		request.setAttribute("bangTop",bangTop);
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

