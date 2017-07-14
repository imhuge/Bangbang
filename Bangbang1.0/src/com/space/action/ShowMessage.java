package com.space.action;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.space.fenye.Page;
import com.space.fenye.Result;
import com.space.po.Answer;
import com.space.po.Critique;
import com.space.po.Message;
import com.space.service.AnswerService;
import com.space.service.CritiqueService;
import com.space.service.MessageService;
import com.space.service.UserService;

public class ShowMessage extends ActionSupport{
	private MessageService messageService;
	private CritiqueService critiqueService;
	private AnswerService answerService;
	private UserService userService;
	private int currentPage;
	private int userId;
	private int id;
	public String execute() throws Exception
	{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		Map session = ActionContext.getContext().getSession();
		String username = (String) session.get("username");
		Message message = messageService.showMessage(id);
		String IP = request.getRemoteAddr();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh-mm");
		String stime = fmt.format(new Date());
		message.setDate(stime);
		messageService.addMessage(message);
		
		Page page = new Page();
		page.setCurrentPage(this.getCurrentPage());
		page.setEveryPage(10);
		Result result = critiqueService.showCritiqueByPage(id, page);
		page = result.getPage();
		List<Critique> allCri = result.getList();
		//根据评论id获取该评论的回复
		Page ansPage = new Page();
		ansPage.setCurrentPage(1);
		ansPage.setEveryPage(2);
		Map<Integer,List<Answer>> ansMap = new HashMap<>();
		Map<Integer,Page> ansPageMap = new HashMap<>();
		for(Critique cri : allCri){
			Result ansResult = answerService.showAnswerByPage(cri.getId(),ansPage);
			List<Answer> ans = ansResult.getList();
			ansPage = ansResult.getPage();
			if(ans != null){
				ansMap.put(cri.getId(), ans);
				ansPageMap.put(cri.getId(), ansPage);
			}
		}
		//获取回复的用户名
		//显示帮帮回复榜
		List<Message> answerTop = messageService.showBangAnswer();
		//获取提问者
		Map<Integer,String> userList = new HashMap<>();
		userList = userService.getUserNameMap();
		//获取是否点赞和拉进小黑屋
		Map<Integer,Integer> zanList = new HashMap<>();
		Map<Integer,Integer> opList = new HashMap<>();
		if(username != null){
			//request.setAttribute("userImg", userService.getHeadImg(username));
			for(Critique cri : allCri){
				zanList.put(cri.getId(), critiqueService.getZanClick(cri.getId(),(Integer)session.get("userId")));
				opList.put(cri.getId(), critiqueService.getOpposeClick(cri.getId(),(Integer)session.get("userId")));
			}	
		}
		request.setAttribute("zanList", zanList);
		request.setAttribute("opList", opList);
		request.setAttribute("allCri", allCri);
		request.setAttribute("page", page);
		request.setAttribute("ansPageMap", ansPageMap);
		request.setAttribute("message",message);
		request.setAttribute("length", allCri.size());
		request.setAttribute("ansTop", answerTop);
		request.setAttribute("userList", userList);
		request.setAttribute("ansMap", ansMap);
		return this.SUCCESS;
	}
	public MessageService getMessageService() {
		return messageService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public CritiqueService getCritiqueService() {
		return critiqueService;
	}
	public void setCritiqueService(CritiqueService critiqueService) {
		this.critiqueService = critiqueService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public AnswerService getAnswerService() {
		return answerService;
	}
	public void setAnswerService(AnswerService answerService) {
		this.answerService = answerService;
	}
	
}
