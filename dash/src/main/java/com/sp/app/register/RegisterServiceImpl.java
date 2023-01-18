package com.sp.app.register;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("register.registerServiceImpl")
public class RegisterServiceImpl implements RegisterService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertstation(Register dto, String pathname) throws Exception {
	
		
		
		
		try {
			
			
			String filename = fileManager.doFileUpload(dto.getImageFilenameFile(), pathname);
			if (filename != null) {
				dto.setImageFilename(filename);
				dao.insertData("register.stationregister", dto);
			}
			
			
			
			
		
			
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void insertchargestation(Register dto, String pathname) throws Exception {
		
		
		
		try {
			
			String filename1 = fileManager.doFileUpload(dto.getImageFilenameFile(), pathname);
			
			
			if (filename1 != null) {
				dto.setImageFilename(filename1);
				dao.insertData("register.chrgestationregister", dto);
			}
			
			System.out.println(filename1);
				
			
			
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
	}

	@Override
	public void insertkickboard(Register dto, String pathname) throws Exception {
		
		
		
		try {
			String filename = fileManager.doFileUpload(dto.getImageFilenameFile(), pathname);
			
			
			if (filename != null) {
				dto.setImageFilename(filename);
				dao.insertData("register.kickboardregister", dto);
			}
			System.out.println(filename);
			
		} catch (Exception e) {
			logger.warn("{} ", e.getMessage());
		}
		
	}
	
	
	
	
	
}
