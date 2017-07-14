package com.space.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.space.fenye.Page;
import com.space.fenye.Result;
import com.space.po.Answer;
import com.space.service.AnswerService;
import com.space.service.UserService;

public class GetAnswerAction extends ActionSupport{
	private AnswerService answerService;
	private UserService userService;
	private int currentPage;
	private int id;
	public String execute() throws Exception
	{	
		HttpServletResponse response = ServletActionContext.getResponse();
		Map session = ActionContext.getContext().getSession();
		System.out.println("评论id是:"+id);
		if(id == 0){
			response.getWriter().write("{\"error\":error}");
			return null;
		}else{
			//HttpServletRequest request = ServletActionContext.getRequest();
			//根据评论id获取该评论的回复
			Page ansPage = new Page();
			ansPage.setCurrentPage(currentPage);
			ansPage.setEveryPage(2);
			Map<Integer,List<Answer>> ansMap = new HashMap<>();
			Map<Integer,Page> ansPageMap = new HashMap<>();
			Result ansResult = answerService.showAnswerByPage(id,ansPage);
			List<Answer> ans = ansResult.getList();
			ansPage = ansResult.getPage();
			//获取回复的用户名
			//获取提问者
			Map<Integer,String> userList = new HashMap<>();
			userList = userService.getUserNameMap();
			//设置回复的html代码
			String html ="";
			System.out.println("回复的数量"+ans.size());
			for(Answer answer : ans){
				html += "<div class='showAns'><a href='#' class='ans-headImg'><img src='user/"+userService.getUserName(answer.getUserId())+"/images/cus.jpg\' /></a>"
							+"<div class='ans-person'>"
		                        +"<a href='#'>"+userService.getUserName(answer.getUserId())+":</a>"
		                        +"<span>"+answer.getContent()+"</span>"
		                        +"<div class='ans-bottom'><span class='reply'>回复</span><span class='reply-time'>"+ answer.getDate() +"</span></div>"
		                    +"</div>"
	                    +"</div>";
			}
			String pageHead = "<div class='ans-page' id='ans-page'>";
			String pageCon = "";
			if(ansPage.isHasPrePage()){
				pageCon = "<a class='enabled'>首页</a>"
			                	+"<a class='enabled'>上一页</a>";
				
				for(int i=1;i<ansPage.getCurrentPage();i++){
					pageCon += "<a class='enabled'>"+i+"</a>";
				}
			}if(ansPage.getTotalPage() > 1){
				pageCon += "<a class='active enabled'>"+currentPage+"</a>";	
			}
			if(ansPage.isHasNextPage()){
				for(int j=currentPage+1;j<=ansPage.getTotalPage();j++){
					pageCon += "<a class='enabled'>"+j+"</a>";
				}
				pageCon += "<a class='enabled'>下一页</a>"
	                		+"<a class='enabled'>尾页</a>";
			}
			String pageEnd = "</div>";
			String pageContent = pageHead + pageCon + pageEnd;
			String addReply = "<div class='add-reply'>"
								   +"<h3>添加回答</h3>"
							   	   +"<input type='hidden' class='critiqueId' value='"+id+"' />"
							       +"<input type='hidden' class='user' value='"+ session.get("username") +"' />"
							       +"<div class='reply-input'><input class='anscontent' type='text' /></div>"
							       +"<div class='reply'>"
							           +"<button class='add-ans'>回复</button>"
							       +"</div>"
							  +"</div>";
			html += pageContent + addReply;
			//返回json数据
			System.out.println("当前页面是:"+currentPage);
			System.out.println("页面总数是:"+ansPage.getTotalPage());
			String json = "{\"html\":"+"\""+html+"\""+",\"currentPage\":"+currentPage+",\"totalPage\":"+ansPage.getTotalPage()+"}";
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			return null;
		}
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
