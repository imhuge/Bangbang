package com.space.service;

import java.util.List;
import com.space.fenye.Page;
import com.space.fenye.Result;
import com.space.po.Answer;

public interface AnswerService {
	//添加回复
	public void addAnswer(Answer answer);
	//根据评论id获取相应的回复
	public List<Answer> getAnswerByPage(int AId,Page page);
	//分页显示回复
	public Result showAnswerByPage(int AId,Page page);
}