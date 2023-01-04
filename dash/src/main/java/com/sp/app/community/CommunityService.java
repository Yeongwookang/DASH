package com.sp.app.community;

import java.util.List;
import java.util.Map;

public interface CommunityService {
	public void insertCommunity(Community dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Community> listCommunity(Map<String, Object> map);
	public Community readCommunity(long num);
	
	public void insertCommunityLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> communityLikeCount(Map<String, Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map) throws Exception;
	public List<Reply> listReplyTop(Map<String, Object> map) throws Exception;
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(Map<String, Object> map);
	public int replyAnswerCount(Map<String, Object> map);
	
	public void updateCommunity(Community dto) throws Exception;
	
}
