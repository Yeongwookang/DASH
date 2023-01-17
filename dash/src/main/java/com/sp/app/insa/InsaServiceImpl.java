package com.sp.app.insa;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;
import com.sp.app.employee.Employee;
import com.sp.app.employee.EmployeeService;

@Service("insa.insaService")
public class InsaServiceImpl implements InsaService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private EmployeeService service;

	@Override
	public void insertInsa(Insa dto, String pathname) throws Exception {
		try {

			String filename = fileManager.doFileUpload(dto.getImageFilenameFile(), pathname);
			
			if (filename != null) {
				dto.setImageFilename(filename);
			}

			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}

			if (dto.getZip().length() != 0 && dto.getAddr1().length() != 0 && dto.getAddr2().length() != 0) {
				dto.setAddr(dto.getZip() + dto.getAddr1() + dto.getAddr2());
			}
			
			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}
			
			String pwd = bcrypt.encode(dto.getPwd());
			dto.setPwd(pwd);
			
			// 사원정보 저장
			dao.updateData("insa.insertInsa3", dto); 
			dao.insertData("insa.insertAuthority", dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public void updateAuthority(Map<String, Object> map) throws Exception {
			try {
				dao.updateData("insa.updateEmployeeEnabled", map);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		
	}

	
	@Override
	public void updateInsa(Insa dto, String pathname) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}
			
			boolean bPwdUpdate = ! service.isPasswordCheck(dto.getEmpNo(), dto.getPwd());
			if(bPwdUpdate) {
				// 패스워드가 변경된 경우에만 member1 수정
				String encPassword = bcrypt.encode(dto.getPwd());
				dto.setPwd(encPassword);
				
				dao.updateData("insa.updateInsa1", dto);
				dao.updateData("insa.updateInsa2", dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
/*
	@Override
	public void deleteInsa(Map<String, Object> map) throws Exception {
		try {
			map.put("updateEmployeeEnabled", 0);
			updateAuthority(map);

			dao.deleteData("insa.deleteInsa2", map);
			dao.deleteData("insa.deleteInsa1", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	
	}
*/
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("insa.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Insa> list(Map<String, Object> map) {
		List<Insa> list = null;

		try {
			list = dao.selectList("insa.listInsa", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	@Override
	public Insa readInsa(String empNo) {
		// 전체사원 목록에서 한 항목 클릭하면 오른쪽 화면 내용 보이게
		Insa dto =null;
		
			try {
				dto = dao.selectOne("insa.readInsa", empNo);

				if (dto != null) {
					if (dto.getEmail() != null) {
						String[] s = dto.getEmail().split("@");
						dto.setEmail1(s[0]);
						dto.setEmail2(s[1]);
					}

					if (dto.getTel() != null) {
						String[] s = dto.getTel().split("-");
						dto.setTel1(s[0]);
						dto.setTel2(s[1]);
						dto.setTel3(s[2]);
					}
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	
	@Override
	public List<Insa> listFile(String empNo) {
		List<Insa> listFile = null;
		
		try {
			listFile = dao.selectList("insa.listFile", empNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}


	@Override
	public boolean isPasswordCheck(String empNo, String pwd) {
		Employee dto = service.readEmployee(empNo);
		
		if(dto == null) {
			return false;
		}
		
		return bcrypt.matches(pwd, dto.getPwd());
	}
	
}
