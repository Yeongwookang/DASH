package com.sp.app.community;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("community.communityService")
public class CommunityServiceImpl implements CommunityService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertCommunity(Community dto) throws Exception {
		try {
			dao.insertData("community.insertCommunity", dto);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("community.dataCount", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return result;
	}

	@Override
	public List<Community> listCommunity(Map<String, Object> map) {
		List<Community> list = null;
		
		try {
			list = dao.selectList("community.listCommunity", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return list;
	}

	@Override
	public Community readCommunity(long num) {
		Community dto = null;
		
		try {
			dto = dao.selectOne("community.readCommunity", num);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;
	}

	@Override
	public void insertCommunityLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("community.insertCommunityLike", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public Map<String, Object> communityLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		
		try {
			countMap = dao.selectOne("community.communityLikeCount", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return countMap;
	}
	
	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("community.insertReply", dto);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) throws Exception {
		List<Reply> listReply = null;
		
		try {
			listReply = dao.selectList("community.listReply", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return listReply;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("community.replyCount", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("community.deleteReply", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
	}

	@Override
	public List<Reply> listReplyAnswer(Map<String, Object> map) {
		List<Reply> listReplyAnswer = null;
		
		try {
			listReplyAnswer = dao.selectList("community.listReplyAnswer", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return listReplyAnswer;
	}

	@Override
	public int replyAnswerCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("community.replyAnswerCount", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return result;
	}

	@Override
	public List<Reply> listReplyTop(Map<String, Object> map) throws Exception {
		List<Reply> listReplyTop = null;
		
		try {
			listReplyTop = dao.selectList("community.listReplyTop", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return listReplyTop;
	}

	@Override
	public void updateCommunity(Community dto) throws Exception {
		try {
			dao.selectList("community.updateCommunity", dto);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
	}

	@Override
	public List<Community> listCommunityMain() {
		List<Community> listCommunityMain = null;
		
		try {
			listCommunityMain = dao.selectList("community.listCommunityMain");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return listCommunityMain;
	}

}
