package com.space.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.space.po.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.space.service.UserService;

public class EditUserInfo extends ActionSupport{
	private String username;
	private String sex;
	private String signature;
	//private String userHeadImg;
	private UserService userService;
	private List<File> headImg;
	private List<String> headImgFileName;
	
	public String execute() throws Exception
	{
		Map session = ActionContext.getContext().getSession();
		User user = userService.getUserById((Integer) session.get("userId"));
		System.out.println("改变之前用户名是:"+user.getUsername());
		//更改用户文件夹名
		HttpServletRequest request = ServletActionContext.getRequest();
		String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"index"+File.separator+"user";
		File file = new File(path+File.separator+user.getUsername());
		String headPath = "";
		if(!username.equals("")){
			file.renameTo(new File(path+File.separator+username));
			headPath = path + File.separator+username;
			//改变昵称
			user.setUsername(username);
			session.put("username", username);
			System.out.println("改变之后用户名是:"+user.getUsername());
		}else{
			headPath = path+ File.separator+user.getUsername();
		}
		System.out.println("路径是:"+headPath);
		if(headImg != null){
			if(headImg.size() >0){
				try{
		            InputStream in = new FileInputStream(headImg.get(0));
		            File validateFile = new File(headPath + File.separator+"images"+File.separator+"cus.jpg");
		            if(validateFile.exists()){
		            	Date date = new Date();
		    			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		    			String newName = df.format(date).replace(":", "").replace(" ", "").replace("-", "");
		            	validateFile.renameTo(new File(headPath+File.separator+"images"+File.separator+"cus"+newName+".jpg"));
		            	System.out.println("文件名称已改变:"+validateFile.getName());
		            }
		            File targetFile = new File(headPath+File.separator+"images"+File.separator+"cus.jpg");
		            OutputStream out = new FileOutputStream(targetFile);
		            byte[] buffer = new byte[1024 * 1024];
		            int length;
		            while ((length = in.read(buffer)) > 0) {
		                out.write(buffer, 0, length);
		            }
		            //改变头像图片名称
		            //user.setUserheadimg(this.getHeadImgFileName().get(0));
		            in.close();
		            out.close();
		        } catch (FileNotFoundException ex) {
		            ex.printStackTrace();
		        } catch (IOException ex) {
		            ex.printStackTrace();
		        }
			}
		}
		if(!sex.equals("")){
		user.setSex(sex);
		}
		if(!signature.equals("")){
			user.setSignature(signature);
		}
		userService.updateUser(user);
		return this.SUCCESS;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<File> getHeadImg() {
		return headImg;
	}

	public void setHeadImg(List<File> headImg) {
		this.headImg = headImg;
	}

	public List<String> getHeadImgFileName() {
		return headImgFileName;
	}

	public void setHeadImgFileName(List<String> headImgFileName) {
		this.headImgFileName = headImgFileName;
	}
	
	
}
