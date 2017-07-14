package com.space.dao;

import java.sql.SQLException;
import java.util.List;

import com.space.fenye.Page;
import com.space.po.Answer;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class AnswerDAOImpl extends HibernateDaoSupport implements AnswerDAO {
	
	//添加回复
	public void addAnswer(Answer answer){
		this.getHibernateTemplate().save(answer);
	}
	//获得指定评论的回复数
	public int queryAnswerCount(int AId){
		List find = this.getHibernateTemplate().find("select count(*) "
				+ "from Answer ans where ans.AId=?",AId);
		return ((Long)find.get(0)).intValue();
	}
	@Override
	public List<Answer> queryByPage(int AId,Page page) {
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery("select ans from Answer ans where ans.AId=?"+"order by ans.date");
				query.setParameter(0, AId);
				query.setMaxResults(page.getEveryPage());
				query.setFirstResult(page.getBeginIndex());
				return query.list();
			}
		});	
	}

}
