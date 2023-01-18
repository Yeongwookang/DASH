package com.sp.app.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("notice.noticeService")
public class NoticeServiceImpl implements NoticeService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertNotice(Notice dto, String pathname) throws Exception {
		try {
			long seq = dao.selectOne("notice.seq");
			dto.setNum(seq);
			
			dao.insertData("notice.insertNotice", dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) {
						continue;
					}
					
					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();
					
					dto.setOriginalFilename(originalFilename);
					dto.setFileSize(fileSize);
					dto.setSaveFilename(saveFilename);
					
					dao.insertData("notice.insertFile", dto);
				}
			}
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("notice.listNotice", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("notice.listNoticeTop");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("notice.updateHitCount", num);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public Notice readNotice(long num) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("notice.readNotice", num);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("notice.preReadNotice", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("notice.nextReadNotice", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;	
	}

	@Override
	public void updateNotice(Notice dto, String pathname) throws Exception {
		try {
			dao.updateData("notice.updateNotice", dto);
			
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) {
						continue;
					}
					
					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();
					
					dto.setOriginalFilename(originalFilename);
					dto.setFileSize(fileSize);
					dto.setSaveFilename(saveFilename);
					
					dao.insertData("notice.insertFile", dto);
				}
			}
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void deleteNotice(long num, String pathname) throws Exception {
		try {
			List<Notice> listFile = listFile(num);
			if(listFile != null) {
				for(Notice dto : listFile) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);
			
			dao.deleteData("notice.deleteNotice", num);	
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void insertFile(Notice dto) throws Exception {
		try {
			dao.insertData("notice.insertFile", dto);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public List<Notice> listFile(long num) {
		List<Notice> listFile = null;
		
		try {
			listFile = dao.selectList("notice.listFile", num);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return listFile;
	}

	@Override
	public Notice readFile(long fileNum) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("notice.readFile", fileNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("notice.deleteFile", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public List<Notice> listNoticeMain() {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("notice.listNoticeMain");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public List<Notice> listNoticeTopMain() {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("notice.listNoticeTopMain");
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

}
