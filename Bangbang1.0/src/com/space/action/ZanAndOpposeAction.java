package com.space.action;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.space.po.CriClick;
import com.space.po.Critique;
import com.space.service.CritiqueService;


public class ZanAndOpposeAction extends ActionSupport {
	private CritiqueService critiqueService;
	private String click;
	private String command;
	private int criId;
	public String execute() throws Exception{
		System.out.println("传入参数值："+click+"	"+criId);
		HttpServletResponse response = ServletActionContext.getResponse();
		Map session = ActionContext.getContext().getSession();
		if(click == null){
			response.getWriter().write("error");
			return null;
		}else{
			if(click.equals("zan")){
				System.out.println("进入点赞处理流程");
				Critique critique = critiqueService.getCritiqueById(criId);
				CriClick criClick = critiqueService.getCriClick(criId, (Integer)session.get("userId"));
				if(command.equals("plus")){
					System.out.println("开始点赞");
					int zan = critique.getZan();
					critique.setZan(++zan);
					critiqueService.updateCritique(critique);
					if(criClick == null){
						criClick = new CriClick();
						criClick.setAId(criId);
						criClick.setUserId((Integer)session.get("userId"));
						criClick.setZanclick(1);
						critiqueService.updateCriClick(criClick);;
					}else{
						criClick.setZanclick(1);
						critiqueService.updateCriClick(criClick);
					}
					response.getWriter().write("success");
					return null;
				}else{
					System.out.println("取消点赞");
					int zan = critique.getZan();
					--zan;
					if(zan<=0) zan=0;
					critique.setZan(zan);
					critiqueService.updateCritique(critique);
					if(criClick == null){
						criClick = new CriClick();
						criClick.setAId(criId);
						criClick.setUserId((Integer)session.get("userId"));
						critiqueService.updateCriClick(criClick);;
					}else{
						criClick.setZanclick(0);
						critiqueService.updateCriClick(criClick);
					}
					response.getWriter().write("success");
					return null;
				}
				
			}else if(click.equals("oppose")){
				Critique critique = critiqueService.getCritiqueById(criId);
				CriClick criClick = critiqueService.getCriClick(criId, (Integer)session.get("userId"));
				if(command.equals("plus")){
					System.out.println("开始拉近小黑屋");
					int oppose = critique.getOppose();
					critique.setOppose(++oppose);
					critiqueService.updateCritique(critique);
					if(criClick == null){
						criClick = new CriClick();
						criClick.setAId(criId);
						criClick.setUserId((Integer)session.get("userId"));
						criClick.setOpclick(1);
						critiqueService.updateCriClick(criClick);;
					}else{
						criClick.setOpclick(1);
						critiqueService.updateCriClick(criClick);
					}
					response.getWriter().write("success");
					return null;
				}else{
					System.out.println("取消拉近小黑屋");
					int oppose = critique.getOppose();
					--oppose;
					if(oppose<=0) oppose=0;
					critique.setOppose(oppose);
					critiqueService.updateCritique(critique);
					if(criClick == null){
						criClick = new CriClick();
						criClick.setAId(criId);
						criClick.setUserId((Integer)session.get("userId"));
						critiqueService.updateCriClick(criClick);;
					}else{
						criClick.setOpclick(0);
						critiqueService.updateCriClick(criClick);
					}
					response.getWriter().write("success");
					return null;
				}
			}else{
				//response.getWriter().write("error");
				return null;
			}
		}
	}
	public CritiqueService getCritiqueService() {
		return critiqueService;
	}
	public void setCritiqueService(CritiqueService critiqueService) {
		this.critiqueService = critiqueService;
	}
	public String getClick() {
		return click;
	}
	public void setClick(String click) {
		this.click = click;
	}
	public int getCriId() {
		return criId;
	}
	public void setCriId(int criId) {
		this.criId = criId;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
}
