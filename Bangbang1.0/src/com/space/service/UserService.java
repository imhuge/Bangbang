package com.space.service;

import java.util.List;
import java.util.Map;
import com.space.po.User;

public interface UserService {
	public boolean loginUser(User user);
	public boolean registerUser(User user);
	//判断用户名是否已存在
	public boolean isExited(String username);
	//获取用户信息
	public User getUserById(int userId);
	//更新用户信息
	public void updateUser(User user);
	//根据用户名获取其userId
	public int getUserId(String username);
	//根据userId获取用户名
	public String getUserName(int userId);
	//获取全部用户
	public List<User> getAllUser();
	//获取userId和用户名的映射
	public Map<Integer,String> getUserNameMap();
	//根据用户名获取头像名称
	//public String getHeadImg(String username);
	
}
