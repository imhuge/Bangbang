package com.space.dao;

import java.util.List;

import com.space.po.User;

public interface UserDAO {
	//添加
	public void add(User user);
	//删除
	public void delete(User user);
	//更新
	public void update(User user);
	//查询所有用户
	public List<User> queryAll();
	//根据用户名查询
	public User queryByusername(String username);
	//根据用户名查询
	public User queryByuserid(int userId);
	//根据用户名获取其userId
	public int queryByUserName(String username);
	//根据userId获取用户名
	public String queryByUserId(int userId);
	//根据用户名获取头像名称
	//public String queryHeadImgByUsername(String username);
}
