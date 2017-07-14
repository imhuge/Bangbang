package com.space.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.space.po.User;
import com.space.service.UserService;

public class Register extends ActionSupport {
	private UserService userService;
	private String username;
	private String password;
	private String repassword;
	private String email;
	
	public String execute() throws Exception{
		
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setRepassword(repassword);
		user.setEmail(email);;
		HttpServletRequest request = ServletActionContext.getRequest();
		if(userService.registerUser(user)){
			String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"index"+File.separator+"user";
			File registerFile = new File(path+File.separator+username);
			if(!registerFile.exists()){
				registerFile.mkdirs();
				File imagesFile = new File(path+File.separator+username+File.separator+"images");
				if(!imagesFile.exists()){
					imagesFile.mkdirs();
					InputStream in = new FileInputStream(new File(path +File.separator+"00"+File.separator+"images"+File.separator+"cus.jpg"));
					File targetFile = new File(path+File.separator+username+File.separator+"images"+File.separator+"cus.jpg");
		            OutputStream out = new FileOutputStream(targetFile);
		            byte[] buffer = new byte[1024 * 1024];
		            int length;
		            while ((length = in.read(buffer)) > 0) {
		                out.write(buffer, 0, length);
		            }
		            in.close();
		            out.close();
				}
			}
			request.setAttribute("url", "login.action");
			request.setAttribute("info", "注册成功");
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			return this.SUCCESS;
		}
		else {
			request.setAttribute("url", "showIndex.action");
			request.setAttribute("info", "注册失败");
			return this.ERROR;
		}
		
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
