package com.space.dao;

import java.util.List;

import com.space.fenye.Page;
import com.space.po.Answer;

public interface AnswerDAO {
	//添加回复
	public void addAnswer(Answer answer);
	//根据评论id获取回复
	public List<Answer> queryByPage(int AId,Page page);
	//获得指定评论的回复数
	public int queryAnswerCount(int AId);
}
