package com.space.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.space.po.Answer;
import com.space.po.Critique;
import com.space.po.Message;
import com.space.service.AnswerService;
import com.space.service.CritiqueService;
import com.space.service.MessageService;
import com.space.service.UserService;

public class AddAnswer extends ActionSupport{
	private CritiqueService critiqueService;
	private AnswerService answerService;
	private String content;
	private int id;
	public String execute() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		if(id == 0){
			response.getWriter().write("error");
			return null;
		}else{
			Map session = ActionContext.getContext().getSession();
			String username = (String) session.get("username");
			Answer answer = new Answer();
			answer.setContent(content);
			answer.setAId(id);
			if(username == null || "".equals(username)) {
				response.getWriter().write("error");
				return null;
			} else {
				int userId = (Integer) session.get("userId");
				answer.setUserId(userId);;
				Date date = new Date();
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
				answer.setDate(df.format(date));
				System.out.println("评论id是："+id);
				answerService.addAnswer(answer);
				//设置评论的回复数加1
				Critique critique = new Critique();
				critique = critiqueService.getCritiqueById(id);
				int ans= critique.getAnswer();
				critique.setAnswer(++ans);
				critiqueService.updateCritique(critique);
				
				response.getWriter().write("success");
				return null;
			}
		}
	}
	public AnswerService getAnswerService() {
		return answerService;
	}

	public void setAnswerService(AnswerService answerService) {
		this.answerService = answerService;
	}

	public CritiqueService getCritiqueService() {
		return critiqueService;
	}
	public void setCritiqueService(CritiqueService critiqueService) {
		this.critiqueService = critiqueService;
	}	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
