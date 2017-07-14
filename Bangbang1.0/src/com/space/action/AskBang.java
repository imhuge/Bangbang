package com.space.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

public class AskBang extends ActionSupport{
	private MessageService messageService;
	private UserService userService;
	private int currentPage;
	private String title;
	private String content;
	
	public String execute() throws Exception
	{
		Message message = new Message();
		if(title.equals("") || content.equals("")){
			return this.INPUT;
		}else{
			message.setTitle(title);
			message.setContent(content);
			//获取用户说说
			Map session = ActionContext.getContext().getSession();
			String username= (String) session.get("username");
			int userId = userService.getUserId(username);
			message.setUserId(userId);
			//设置日期
			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			message.setDate(df.format(date));
			messageService.addMessage(message);
			HttpServletRequest request = ServletActionContext.getRequest();
			int id = message.getId();
			session.put("id", id);
			//request.setAttribute("userImg", userService.getHeadImg(username));
			return this.SUCCESS;
		}
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
