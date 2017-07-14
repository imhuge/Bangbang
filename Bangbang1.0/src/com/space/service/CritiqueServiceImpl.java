package com.space.service;



import java.util.List;

import com.space.dao.CritiqueDAO;
import com.space.fenye.Page;
import com.space.fenye.PageUtil;
import com.space.fenye.Result;
import com.space.po.CriClick;
import com.space.po.Critique;

public class CritiqueServiceImpl implements CritiqueService{
	private CritiqueDAO critiqueDAO;
	public void addCritique(Critique critique) {
		critiqueDAO.addCritique(critique);
	}
	//更新评论
	public void updateCritique(Critique critique){
		critiqueDAO.updateCritique(critique);
	}
	@Override
	public Result showCritiqueByPage(int AId, Page page) {
		page = PageUtil.createPage(page, critiqueDAO.queryCritiqueCount(AId));
		List<Critique> list = critiqueDAO.queryByPage(AId, page);
		Result result = new Result();
		result.setList(list);
		result.setPage(page);
		return result;
	}
	//获取是否点赞
	public int getZanClick(int AId,int userId){
		return critiqueDAO.queryZanClick(AId,userId);
	}
	//获取是否拉进小黑屋
	public int getOpposeClick(int AId,int userId){
		return critiqueDAO.queryOpposeClick(AId,userId);
	}
	//获取criclik
	public CriClick getCriClick(int AId,int userId){
		return critiqueDAO.queryCriClick(AId,userId);
	}
	//更新criclick
	public void updateCriClick(CriClick criClick){
		critiqueDAO.updateCriClick(criClick);
	}
	public Critique getCritiqueById(int id){
		return critiqueDAO.queryCritiqueById(id);
	}
	@Override
	public int getCritiqueCount(int AId) {
		return critiqueDAO.queryCritiqueCount(AId);
	}

	public CritiqueDAO getCritiqueDAO() {
		return critiqueDAO;
	}

	public void setCritiqueDAO(CritiqueDAO critiqueDAO) {
		this.critiqueDAO = critiqueDAO;
	}

}
