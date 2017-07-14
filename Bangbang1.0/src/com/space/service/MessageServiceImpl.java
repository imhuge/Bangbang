package com.space.service;

import java.util.List;

import com.space.dao.CritiqueDAO;
import com.space.dao.MessageDAO;
import com.space.fenye.Page;
import com.space.fenye.PageUtil;
import com.space.fenye.Result;
import com.space.po.Account;
import com.space.po.Message;

public class MessageServiceImpl implements MessageService{
	
	private MessageDAO messageDAO;
	private CritiqueDAO critiqueDAO;
	@Override
	public List<Message> showUserAllMessage(int userId) {
		return messageDAO.queryUserAll(userId);
	}
	@Override
	public Result showMessageByPage(Page page) {
		
		page = PageUtil.createPage(page, messageDAO.queryAllCount());
		List<Message> all = messageDAO.queryAllByPage(page);
		Result result = new Result();
		result.setPage(page);
		result.setList(all);
		return result;
	}
	 
	@Override
	public Result showUserMessageByPage(int userId, Page page) {
		page = PageUtil.createPage(page,messageDAO.queryUserAllCount(userId));
		List<Message> all = messageDAO.queryByPage(userId, page);
		Result result = new Result();
		result.setPage(page);
		result.setList(all);
		return result;
	}
	
	public List<Message> showHotMessage(){
		return messageDAO.queryByZan();
	}
	
	public Message showMessage(int id) {
		return messageDAO.queryById(id);
	}
	
	public List<Account> showBangTop(){
		return messageDAO.queryByBang();
	}
	
	public List<Message> showBangAnswer(){
		return messageDAO.queryByAnswer();
	}
	
	public int getBangByUser(int userId){
		return messageDAO.queryUserBang(userId);
	}
	
	@Override
	public int getCritiqueCount(int AId) {
		return critiqueDAO.queryCritiqueCount(AId);
	}

	public MessageDAO getMessageDAO() {
		return messageDAO;
	}

	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
	
	public CritiqueDAO getCritiqueDAO() {
		return critiqueDAO;
	}

	public void setCritiqueDAO(CritiqueDAO critiqueDAO) {
		this.critiqueDAO = critiqueDAO;
	}

	public void addMessage(Message message) {
		messageDAO.add(message);
	}
}
