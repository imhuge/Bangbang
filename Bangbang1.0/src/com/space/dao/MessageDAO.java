package com.space.dao;

import java.util.List;

import com.space.fenye.Page;
import com.space.po.Account;
import com.space.po.Message;

public interface MessageDAO {
	//保存说说
	public void add(Message message);
	//取出用户所有的说说
	public List<Message> queryUserAll(int userId);
	//获得用户说说的总记录数
	public int queryUserAllCount(int userId);
	//按分页信息查询用户的记录
	public List<Message> queryByPage(int userId,Page page);
	//按ID查询文章
	public Message queryById(int id);
	//获得所有帮帮的总记录数
	public int queryAllCount();
	//获取用户的帮帮数
	public int queryUserBang(int userId);
	//按分页信息查询记录
	public List<Message> queryAllByPage(Page page);
	//按点赞数目查询
	public List<Message> queryByZan();
	//按帮帮数目查询
	public List<Account> queryByBang();
	//按帮帮回复查询
	public List<Message> queryByAnswer();
	
}
