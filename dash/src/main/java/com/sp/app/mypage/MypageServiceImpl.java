package com.sp.app.mypage;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;



@Service("mypage.updatemypage")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private CommonDAO dao;
	
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void updateMypage(Mypage dto, String pathname) throws Exception {
		try {
			String filename = fileManager.doFileUpload(dto.getImageFilenameFile(), pathname);
			if(filename != null) {
				dto.setThumbnail(filename);
				dao.updateData("mypage.updatemypage", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Mypage> listemployee(Map<String, Object> map) {
		List<Mypage>  list = null;
		
		try {
			list =  dao.selectList("mypage.listmyemployee", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

		

	


	
}
