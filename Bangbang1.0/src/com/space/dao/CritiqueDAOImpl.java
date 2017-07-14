package com.space.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.space.fenye.Page;
import com.space.po.CriClick;
import com.space.po.Critique;

public class CritiqueDAOImpl extends HibernateDaoSupport implements CritiqueDAO{
	public void addCritique(Critique critique) {
		this.getHibernateTemplate().save(critique);
	}
	//更新评论
	public void updateCritique(Critique critique){
		this.getHibernateTemplate().update(critique);
	}
	@Override
	public int queryCritiqueCount(int AId) {
		List find = this.getHibernateTemplate().find("select count(*) "
				+ "from Critique cri where cri.AId=?",AId);
		return ((Long)find.get(0)).intValue();
	}

	@Override
	public List<Critique> queryByPage(int AId, Page page) {
		
		return this.getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session) throws HibernateException,SQLException{
				Query query = session.createQuery("select cri from Critique cri where cri.AId=?"+"order by cri.date desc");
				query.setParameter(0, AId);
				query.setMaxResults(page.getEveryPage());
				query.setFirstResult(page.getBeginIndex());
				return query.list();
			}
		});		
	}
	//根据id获取评论
	public Critique queryCritiqueById(int id){
		List find = this.getHibernateTemplate().find("from Critique cri where cri.id=?",id);
		return (Critique) find.get(0);
	}
	//获取是否点赞
	public int queryZanClick(int AId,int userId){
		List find = this.getHibernateTemplate().find("select zanclick from CriClick cck where cck.AId="+AId+"and cck.userId="+userId);
		if(find.size() == 0){
			return 0;
		}else{
			return ((Integer)find.get(0)).intValue();
		}
	}
	//获取是否拉进小黑屋
	public int queryOpposeClick(int AId,int userId){
		List find = this.getHibernateTemplate().find("select opclick from CriClick cck where cck.AId="+AId+"and cck.userId="+userId);
		if(find.size() == 0){
			return 0;
		}else{
			return ((Integer)find.get(0)).intValue();
		}
	}
	//获取criclik
	public CriClick queryCriClick(int AId,int userId){
		List find = this.getHibernateTemplate().find("from CriClick cck where cck.AId="+AId+"and cck.userId="+userId);
		if(find.size() == 0){
			return null;
		}else{
			return (CriClick) find.get(0);
		}
	}
	//更新criclick
	public void updateCriClick(CriClick criClick){
		this.getHibernateTemplate().saveOrUpdate(criClick);
	}
}
