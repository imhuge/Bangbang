package com.space.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.space.po.Account;
import com.space.po.Message;
import com.space.po.User;

public class UserDAOImpl extends HibernateDaoSupport implements UserDAO{

	public void add(User user) {
		this.getHibernateTemplate().save(user);
		//添加账户
		Account account = new Account();
		account.setUserId(user.getUserId());
		this.getHibernateTemplate().save(account);
	}
	public void delete(User user) {
		// TODO 
		
	}
	public void update(User user) {
		// TODO 
		this.getHibernateTemplate().update(user);
	}
	public List<User> queryAll() {
		List find = this.getHibernateTemplate().find("select user from User user");
		List<User> list = find;
		return list;
	}
	//根据用户名获取其userId
	public int queryByUserName(String username){
		List find = this.getHibernateTemplate().find("select userId from User user where user.username=?",username);
		if(find.size() == 0){
			return 0;
		}else{
			return (Integer)find.get(0);
		}
	}
	//根据userId获取用户名
	public String queryByUserId(int userId){
		List find = this.getHibernateTemplate().find("select username from User user where user.userId=?",userId);
		return (String)find.get(0);
	}
	//根据用户名获取头像名称
	/*
	public String queryHeadImgByUsername(String username){
		List find = this.getHibernateTemplate().find("select userheadimg from User user where user.username=?",username);
		return (String)find.get(0);
	}
	*/
	@Override
	public User queryByusername(String username) {
		List list = this.getHibernateTemplate().find("from User user where user.username=?",username);
		if(list.size() == 0)
		{
			return null;
		}
		else
		{
			return (User)list.get(0);
		}
	}
	public User queryByuserid(int userId) {
		List list = this.getHibernateTemplate().find("from User user where user.userId=?",userId);
		if(list.size() == 0)
		{
			return null;
		}
		else
		{
			return (User)list.get(0);
		}
	}

}
