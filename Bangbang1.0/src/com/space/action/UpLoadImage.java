package com.space.action;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpLoadImage extends ActionSupport{
	public String execute() throws Exception{
		
		Map session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		Part filePart = request.getPart("filelist");
		String header = filePart.getHeader("Content-Disposition");
	    String fileName = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
		
	    
	     String username =(String) session.get("username");
	     
	    if(username == null){
	    	System.out.println("上传出错，用户名为空");
	    	response.getWriter().write("error");
	    }else{
	   
		    String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"index"+File.separator+"user"+File.separator+username+File.separator+"upload";
		    File targetFile = new File(path);
		    if(!targetFile.exists()){
		    	targetFile.mkdirs();
		    }
		    System.out.println("上传图片路径是："+path);
			filePart.write(path+File.separator+fileName);
		    response.getWriter().write("true");
	    }
	    return null;
	}
}
