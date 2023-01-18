package com.sp.app.schedule;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("schedule.scheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertSchedule(Schedule dto) throws Exception {
		try {
			if(dto.getAll_day()!=null) {
				dto.setStime("");
				dto.setEtime("");
			}
			
			if(dto.getStime().length()==0&&dto.getEtime().length()==0&&dto.getSday().equals(dto.getEday()))
				dto.setEday("");
			
			if(dto.getRepeat_cycle()!=0) {
				dto.setEday("");
				dto.setStime("");
				dto.setEtime("");
			}
			
			dao.insertData("schedule.insertSchedule", dto);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}

	@Override
	public List<Schedule> listMonth(Map<String, Object> map) throws Exception{
		List<Schedule> list=null;
		try {
			list=dao.selectList("schedule.listMonth", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		return list;
	}

	@Override
	public Schedule readSchedule(long num) throws Exception{
		Schedule dto=null;
		try {
			dto=dao.selectOne("schedule.readSchedule", num);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		return dto;
	}

	@Override
	public void updateSchedule(Schedule dto) throws Exception{
		try {
			if(dto.getAll_day()!=null) {
				dto.setStime("");
				dto.setEtime("");
			}
			
			if(dto.getStime().length()==0&&dto.getEtime().length()==0&&dto.getSday().equals(dto.getEday()))
				dto.setEday("");
			
			if(dto.getRepeat_cycle()!=0) {
				dto.setEday("");
				dto.setStime("");
				dto.setEtime("");
			}
			dao.updateData("schedule.updateSchedule", dto);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}

	}

	@Override
	public void deleteSchedule(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("schedule.deleteSchedule", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}
	
	@Override
	public void insertCategory(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("schedule.insertCategory", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}

	@Override
	public List<Schedule> listCategory(Map<String, Object> map) throws Exception {
		List<Schedule> list = null;
		try {
			list = dao.selectList("schedule.listCategory", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		return list;
	}

	@Override
	public void deleteCategory(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("schedule.deleteCategory", map);
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
	}
}
