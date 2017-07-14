package com.space.service;

import com.space.fenye.Page;
import com.space.fenye.Result;
import com.space.po.Account;
import com.space.po.Message;
import java.util.List;
public interface MessageService {
	//进行帮帮的保存
	public void addMessage(Message message);
	//取出用户的所有帮帮
	public List<Message> showUserAllMessage(int userId);
	//分页显示用户的所有帮帮
	public Result showUserMessageByPage(int userId,Page page);
	//分页显示全部帮帮
	public Result showMessageByPage(Page page);
	//显示热门帮帮
	public List<Message> showHotMessage();
	//显示帮帮
	public Message showMessage(int id);
	//显示帮帮排行榜
	public List<Account> showBangTop();
	//显示全部帮帮
	public List<Message> showBangAnswer();
	//显示用户的帮帮数
	public int getBangByUser(int userId);
	//获得评论数
	public int getCritiqueCount(int AId);
}
