package com.space.service;

import com.space.fenye.Page;
import com.space.fenye.Result;
import com.space.po.CriClick;
import com.space.po.Critique;

public interface CritiqueService {
	//添加评论
	public void addCritique(Critique critique);
	//更新评论
	public void updateCritique(Critique critique);
	//分页显示评论
	public Result showCritiqueByPage(int AId,Page page);
	//获取指定文章的评论数
	public int getCritiqueCount(int AId);
	public Critique getCritiqueById(int id);
	//获取是否点赞
	public int getZanClick(int AId,int userId);
	//获取是否拉进小黑屋
	public int getOpposeClick(int AId,int userId);
	//获取criclik
	public CriClick getCriClick(int AId,int userId);
	//更新criclick
	public void updateCriClick(CriClick criClick);
}
