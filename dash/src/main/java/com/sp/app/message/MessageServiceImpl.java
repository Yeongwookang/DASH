package com.sp.app.message;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("message.messageService")
public class MessageServiceImpl implements MessageService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Message> listEmployee(Map<String, Object> map) {
		List<Message> list = null;
		
		try {
			list = dao.selectList("message.listEmployee", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public void insertMessage(Message dto) throws Exception {
		try {
			for(String receiver : dto.getReceivers()) {
				dto.setReceiverEmpNo(receiver);
				dao.insertData("message.insertMessage", dto);
			}
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public int dataCountReceive(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("message.dataCountReceive", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return result;
	}

	@Override
	public List<Message> listReceive(Map<String, Object> map) {
		List<Message> list = null;
		
		try {
			list = dao.selectList("message.listReceive", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public int dataCountSend(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("message.dataCountSend", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return result;
	}

	@Override
	public List<Message> listSend(Map<String, Object> map) {
		List<Message> list = null;
		
		try {
			list = dao.selectList("message.listSend", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public Message readReceive(long num) {
		Message dto = null;
		
		try {
			dto = dao.selectOne("message.readReceive", num);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;
	}

	@Override
	public Message readSend(long num) {
		Message dto = null;
		
		try {
			dto = dao.selectOne("message.readSend", num);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;
	}

	@Override
	public void updateIdentifyDay(long num) throws Exception {
		try {
			dao.updateData("message.updateIdentifyDay", num);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void deleteMessage(Map<String, Object> map) throws Exception {
		
		try {
			dao.deleteData("message.deleteMessage", map);

			dao.updateData("message.updateDeleteState", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public int newMessageCount(String empNo) {
		int result = 0;
		
		try {
			result = dao.selectOne("message.newMessageCount", empNo);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return result;
	}
	
	
}
