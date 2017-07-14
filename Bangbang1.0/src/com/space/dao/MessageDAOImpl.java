package com.space.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.space.fenye.Page;
import com.space.po.Account;
import com.space.po.Message;

public class MessageDAOImpl extends HibernateDaoSupport implements MessageDAO{

	@Override
	public void add(Message message) {
		this.getHibernateTemplate().saveOrUpdate(message);
		
	}

	@Override
	public List<Message> queryUserAll(int userId) {
		List find = this.getHibernateTemplate().find("select message from Message message where message.userId=?",userId);
		List<Message> list = find;
		return list;
	}
	@Override
	public int queryUserAllCount(int userId) {
		List find = this.getHibernateTemplate().find("select count(*)"
				+"from Message message where message.userId=?",userId);
		return ((Long)find.get(0)).intValue();
	}

	@Override
	public List<Message> queryByPage(int userId,Page page) {
		return this.getHibernateTemplate().executeFind(new HibernateCallback()
		{
			public Object doInHibernate(Session session) throws HibernateException,SQLException
			{
				Query query = session.createQuery("select message from Message message where message.userId=?");
				query.setParameter(0, userId);
				query.setMaxResults(page.getEveryPage());
				query.setFirstResult(page.getBeginIndex());
				return query.list();
			}
		});
	}

	@Override
	public Message queryById(int id) {
		List find = this.getHibernateTemplate().find("from Message message where message.id=?",id);
		return (Message)find.get(0);
	}

	@Override
	public int queryAllCount() {
		List find = this.getHibernateTemplate().find("select count(*) from Message mes");
		return ((Long)find.get(0)).intValue();
	}

	public int queryAllBangCount(){
		List find = this.getHibernateTemplate().find("select count(*) from Message mes");
		return ((Long)find.get(0)).intValue();
	}
	
	@Override
	public List<Message> queryAllByPage(Page page) {
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery("select mes from Message mes order by mes.date desc");
				//设置每页显示多少个，设置多大结果
				query.setMaxResults(page.getEveryPage());
				//设置起点
				query.setFirstResult(page.getBeginIndex());
				return query.list();
			}
			
		});
	}
	
	public List<Message> queryByZan(){
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery("select mes from Message mes order by mes.zan desc");
				//设置每页显示多少个，设置多大结果
				query.setMaxResults(4);
				return query.list();
			}
			
		});
	}
	
	public List<Account> queryByBang(){
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery("select act from Account act order by act.bang desc");
				//设置每页显示多少个，设置多大结果
				query.setMaxResults(5);
				return query.list();
			}
			
		});
	}
	public List<Message> queryByAnswer(){
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery("select mes from Message mes order by mes.critique desc");
				//设置每页显示多少个，设置多大结果
				query.setMaxResults(5);
				return query.list();
			}
			
		});
	}
	public int queryUserBang(int userId){
		List find = this.getHibernateTemplate().find("select bang from Account act where act.userId=?",userId);
		return (Integer)find.get(0);
	}
}
