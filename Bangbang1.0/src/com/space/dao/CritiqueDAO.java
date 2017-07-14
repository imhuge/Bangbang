package com.space.dao;

import java.util.List;

import com.space.fenye.Page;
import com.space.po.CriClick;
import com.space.po.Critique;

public interface CritiqueDAO {
	//添加评论
	public void addCritique(Critique critique);
	//更新评论
	public void updateCritique(Critique critique);
	//根据id获取评论
	public Critique queryCritiqueById(int id);
	//获得指定文章的评论数
	public int queryCritiqueCount(int AId);
	//根据Page来查询指定文章的评论
	public List<Critique> queryByPage(int AId,Page page);
	//获取是否点赞
	public int queryZanClick(int AId,int userId);
	//获取是否拉进小黑屋
	public int queryOpposeClick(int AId,int userId);
	//获取criclik
	public CriClick queryCriClick(int AId,int userId);
	//更新criclick
	public void updateCriClick(CriClick criClick);
}
