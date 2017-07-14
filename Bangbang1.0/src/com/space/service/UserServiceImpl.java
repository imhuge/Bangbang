package com.space.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.space.dao.UserDAO;
import com.space.po.User;

public class UserServiceImpl implements UserService{
	public UserDAO userDAO;
	
	//判断用户名是否已存在
	public boolean isExited(String username){
		if(userDAO.queryByUserName(username) > 0){
			return true;
		}else{
			return false;
		}
	}
	
	//根据用户名获取其userId
	public int getUserId(String username){
		return userDAO.queryByUserName(username);
	}
	//根据userId获取用户名
	public String getUserName(int userId){
		return userDAO.queryByUserId(userId);
	}
	//获取全部用户
	public List<User> getAllUser(){
		return userDAO.queryAll();
	}
	//获取userId和用户名的映射
	public Map<Integer,String> getUserNameMap(){
		List<User> list = this.getAllUser();
		Map<Integer,String> userinfo = new HashMap<>();
		for(User user : list){
			userinfo.put(user.getUserId(), user.getUsername());
		}
		return userinfo;
	}
	//根据用户名获取头像名称
	//public String getHeadImg(String username){
	//	return userDAO.queryHeadImgByUsername(username);
	//}
	public boolean loginUser(User user)
	{
		System.out.println("登录的用户名是："+user.getUsername());
		if(userDAO.queryByusername(user.getUsername()) == null)
		{
			return false;
		}
		else
		{
			User queryUser = userDAO.queryByusername(user.getUsername());
			if(queryUser.getPassword().equals(user.getPassword()))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

	public boolean registerUser(User user) {
		if(userDAO.queryByusername(user.getUsername()) != null){
			return false;
		}
		else {
			userDAO.add(user);
			return true;
		}
	}
	
	public User getUserById(int userId){
		return userDAO.queryByuserid(userId);
	}
	
	public void updateUser(User user){
		userDAO.update(user);
	}
	
	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

}
