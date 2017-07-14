package com.space.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.space.po.Critique;
import com.space.po.Message;
import com.space.service.CritiqueService;
import com.space.service.MessageService;
import com.space.service.UserService;

public class AddCritique extends ActionSupport{
	private CritiqueService critiqueService;
	private MessageService messageService;
	private UserService userService;
	private String content;
	private String image;
	private int id;
	public String execute() throws Exception{
		System.out.println("评论id是："+id);
		System.out.println("评论内容是:"+content);
		//HttpServletResponse response = ServletActionContext.getResponse();
		Map session = ActionContext.getContext().getSession();
		String username = (String) session.get("username");
		
		Critique critique = new Critique();
		critique.setContent(content);
		critique.setImage(image);
		critique.setAId(id);
		if(username == null || "".equals(username)) {
			return null;
		} else {
			int userId = userService.getUserId(username);
			critique.setUserId(userId);;
			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			critique.setDate(df.format(date));
			critiqueService.addCritique(critique);
			//设置帮帮的回复数加1
			System.out.println("帮帮id是："+id);
			Message message = new Message();
			message = messageService.showMessage(id);
			int cri= message.getCritique();
			message.setCritique(++cri);
			messageService.addMessage(message);
			//response.getWriter().write(username);
			return this.SUCCESS;
		}
	}
	
	public CritiqueService getCritiqueService() {
		return critiqueService;
	}
	public void setCritiqueService(CritiqueService critiqueService) {
		this.critiqueService = critiqueService;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
