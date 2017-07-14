package com.space.service;

import java.util.List;
import com.space.dao.AnswerDAO;
import com.space.po.Answer;
import com.space.fenye.Page;
import com.space.fenye.PageUtil;
import com.space.fenye.Result;
public class AnswerServiceImpl implements AnswerService{
	private AnswerDAO answerDAO;
	
	//添加回复
	public void addAnswer(Answer answer){
		answerDAO.addAnswer(answer);
	}
	//根据评论id获取相应的回复
	public List<Answer> getAnswerByPage(int AId,Page page){
		return answerDAO.queryByPage(AId,page);
	}
	//分页显示回复
	public Result showAnswerByPage(int AId,Page page){
		page = PageUtil.createPage(page,answerDAO.queryAnswerCount(AId));
		List<Answer> list = answerDAO.queryByPage(AId, page);
		Result result = new Result();
		result.setList(list);
		result.setPage(page);
		return result;
	}
	public AnswerDAO getAnswerDAO() {
		return answerDAO;
	}
	public void setAnswerDAO(AnswerDAO answerDAO) {
		this.answerDAO = answerDAO;
	}
	
}
