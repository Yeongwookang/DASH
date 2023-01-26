package com.sp.app.approval;

import java.util.ArrayList;
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
import com.sp.app.employee.Employee;

@Service("approval.approvalService")
public class ApprovalServiceImpl implements ApprovalService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertApproval(Approval dto, String path) throws Exception {
		try {
			long signNum = dao.selectOne("approval.approvalSeq");
			dto.setSignNum(signNum);
			dao.insertData("approval.insertApproval", dto);
			
			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					String saveFilename = fileManager.doFileUpload(mf, path);
					if(saveFilename == null) {
						continue;
					}
					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();
					
					dto.setOriginalFilename(originalFilename);
					dto.setFileSize(fileSize);
					dto.setSaveFilename(saveFilename);
					
					dao.insertData("approval.insertFile", dto);
				}
			}
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void updateApproval(Approval dto, String path) throws Exception {
		try {
			
			Map<String,Object> refMap = new HashMap<String, Object>();
			
			refMap.put("signNum", dto.getSignNum());
			
			dao.deleteData("approval.deleteReference", refMap);
			
			refMap.put("ref1", dto.getRef1());
			refMap.put("ref2", dto.getRef2());
			refMap.put("ref3", dto.getRef3());
			refMap.put("refcnt", dto.getRefcnt());
			
			dao.insertData("approval.insertReference", refMap);
			
			Map<String, Object> updateMap = new HashMap<String, Object>();
			updateMap.put("title", dto.getTitle());
			updateMap.put("content", dto.getContent());
			updateMap.put("empNo", dto.getEmpNo());
			updateMap.put("formNum", dto.getFormNum());
			updateMap.put("signNum", dto.getSignNum());
			
			dao.updateData("approval.updateApproval", updateMap);
			
			long tlNum = dto.getTlNum();
			
			if(tlNum==0) {
				dao.deleteData("approval.deleteTimelineRecord", dto.getSignNum());
			} else {
				Map<String, Object> tlMap = new HashMap<String, Object>();
				tlMap.put("signNum", dto.getSignNum());
				tlMap.put("tlNum", dto.getTlNum());
				tlMap.put("state", dto.getTlState());
				
				dao.updateData("approval.updateTimelineRecord", tlMap);
			}
			
			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					String saveFilename = fileManager.doFileUpload(mf, path);
					if(saveFilename == null) {
						continue;
					}
					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();
					
					dto.setOriginalFilename(originalFilename);
					dto.setFileSize(fileSize);
					dto.setSaveFilename(saveFilename);
					
					dao.insertData("approval.insertFile", dto);
				}
			
			}
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void deleteApproval(long signNum, String path) throws Exception {
		try {
			List<Approval> listFile = fileList(signNum);
			if(listFile != null) {
				for(Approval dto : listFile) {
					fileManager.doFileDelete(dto.getSaveFilename(), path);
				}
			}
			dao.deleteData("approval.deleteApproval", signNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public Approval readApproval(long signNum) {
		Approval dto = null;
		
		try {
			dto = dao.selectOne("approval.readApproval", signNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("approval.dataCount", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return result;
	}
	
	@Override
	public int dataCount_tl(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("approval.dataCount_tl", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return result;
	}


	@Override
	public List<Approval> approvalList(Map<String, Object> map) {
		List<Approval> list = null;
		
		try {
			list = dao.selectList("approval.approvalList", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public List<Employee> empList(Map<String, Object> map) {
		
		List<Employee> empList = null;
		
		try {
			empList = dao.selectList("approval.empList", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return empList;
	}

	@Override
	public List<Approval> myApprovalList(Map<String, Object> map) {
		List<Approval> list = null;
		
		try {
			list = dao.selectList("approval.myApprovalList", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public List<String> refList(long signNum) {
		List<String> refList = new ArrayList<String>();
		try {
			Approval app = dao.selectOne("approval.refList", signNum);
			refList.add(app.getRef1());
			refList.add(app.getRef2());
			refList.add(app.getRef3());
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return refList;
	}

	@Override
	public Approval readEmp(String empNo) {
		Approval dto = null;
		try {
			dto = dao.selectOne("approval.readEmp", empNo);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;
	}

	@Override
	public void approve(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("approval.approve", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void approveUpdate(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("approval.approveUpdate", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}
	
	@Override
	public void reject(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("approval.reject", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void rejectUpdate(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("approval.rejectUpdate", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}

	@Override
	public List<Approval> fileList(long signNum) {
		
		List<Approval> list = null;
		try {
			list = dao.selectList("approval.fileList",signNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return list;
	}

	@Override
	public Approval readFile(long fileNum) {
		Approval dto = null;
		try {
			dto = dao.selectOne("approval.readFile", fileNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		return dto;
	}

	@Override
	public void deleteFile(long fileNum, String path) throws Exception {
		try {
			Approval dto = readFile(fileNum);
				
			fileManager.doFileDelete(dto.getSaveFilename(), path);

			dao.deleteData("approval.deleteFile", fileNum);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public int myApprovalCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("approval.myApprovalCount", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
		return result;
	}

	@Override
	public void insertTimeline(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("approval.insertTimeline", map);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public void updateTimeline(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("approval.updateTimeline", map);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void updateTimelineAdmin(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("approval.updateTlAdmin", map);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void deleteTimeline(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("approval.deleteTimeline", map);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Approval readTimeline(long tlNum) {
		Approval result = null;
		
		try {
			result = dao.selectOne("approval.readTimeline", tlNum);
		} catch (Exception e) {
			logger.warn("{} 에러가 발생했습니다. 파라미터: {}", e.getMessage(), tlNum);
		}
		return result;
	}
	
	@Override
	public Approval readTimelineRecord(long signNum) {
			Approval result = null;
		
		try {
			result = dao.selectOne("approval.readTimelineRecord", signNum);
		} catch (Exception e) {
			logger.warn("{} 에러가 발생했습니다. 파라미터: {}", e.getMessage(), signNum);
		}
		return result;
	}
	
	@Override
	public List<Approval> listTimeline(Map<String,Object> map) {
		List<Approval> result = null;
		
		try {
			result = dao.selectList("approval.listTimeline", map);
		} catch (Exception e) {
			logger.warn("{} 에러가 발생했습니다. 파라미터: {}", e.getMessage(), map.get("offset"));
		}
		return result;
	}

	@Override
	public List<Approval> recordTimeline(Approval dto) {
		List<Approval> result = null;
		
		try {
			result = dao.selectList("approval.recordTimeline", dto);
		} catch (Exception e) {
			logger.warn("{} 에러가 발생했습니다. 파라미터: {}", e.getMessage(), dto.getTlNum());
		}
		return result;
	}

	@Override
	public int countTimeline(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("approval.countTimeline", map);
		} catch (Exception e) {
			logger.warn("{} 에러가 발생했습니다. offset: {}, size: {}", e.getMessage(), map.get("offset"), map.get("size"));
		}
		return result;
	}

	@Override
	public Map<String, Object> readSubdocument(long tlNum) {
		Map<String, Object> map = null;
		try {
			map = new HashMap<String, Object>();
			map.put("list0", dao.selectList("approval.subDocumentList0",tlNum));
			map.put("list1", dao.selectList("approval.subDocumentList1",tlNum));
			map.put("list2", dao.selectList("approval.subDocumentList2",tlNum));
			map.put("list3", dao.selectList("approval.subDocumentList3",tlNum));
		} catch (Exception e) {
			logger.warn("{}가 발생했습니다. 파라미터: {}", e.getMessage(), tlNum);
		}
		return map;
	}

	
	
	
}
