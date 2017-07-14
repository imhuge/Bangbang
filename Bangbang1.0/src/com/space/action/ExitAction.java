package com.space.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.space.po.User;
import com.space.service.UserService;

public class ExitAction extends ActionSupport {
	
	public String execute() throws Exception{	
		Map session = ActionContext.getContext().getSession();
		session.clear();
		return this.SUCCESS;
	}
	
}
