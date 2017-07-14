package com.space.action;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.space.po.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.space.service.UserService;

public class ShowEditUserInfo extends ActionSupport{
	private String username;
	private UserService userService;
	
	public String execute() throws Exception
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		Map session = ActionContext.getContext().getSession();
		User user = userService.getUserById((Integer) session.get("userId"));
		//String headImg = user.getUserheadimg();
		String sex = user.getSex();
		System.out.println(sex);
		if(sex.equals("男")){
			request.setAttribute("userSex",true);
			request.setAttribute("isMale",true);
		}else if(sex.equals("女")){
			request.setAttribute("userSex",true);
			request.setAttribute("isMale",false);
		}else{
			request.setAttribute("userSex",false);
		}
		return this.SUCCESS;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}

