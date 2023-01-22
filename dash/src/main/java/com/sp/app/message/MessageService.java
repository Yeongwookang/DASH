package com.sp.app.message;

import java.util.List;
import java.util.Map;


public interface MessageService {
	public List<Message> listEmployee(Map<String, Object> map);
	public void insertMessage(Message dto) throws Exception;
	
	public int dataCountReceive(Map<String, Object> map);
	public List<Message> listReceive(Map<String, Object> map);
	
	public int dataCountSend(Map<String, Object> map);
	public List<Message> listSend(Map<String, Object> map);
	
	public Message readReceive(long num);
	
	
	public Message readSend(long num);
	
	
	public void updateIdentifyDay(long num) throws Exception;
	
	public void deleteMessage(Map<String, Object> map) throws Exception;
	
	public int newMessageCount(String empNo);
	
}
