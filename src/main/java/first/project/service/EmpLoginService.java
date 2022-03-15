package first.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.project.dao.EmpLoginDao;
import first.project.dto.empDto;

@Service
public class EmpLoginService {

	@Autowired
	EmpLoginDao dao;

	public empDto emplogin(empDto dto) {
		return dao.emplogin(dto);

	}
	public int insertEmp(empDto dto) {
		return dao.insertEmp(dto);
	}

	public empDto findempid(empDto dto) {
		return dao.findempid(dto);
	}

	public empDto findemppw(empDto dto) {
		return dao.findemppw(dto);
	}

	public empDto empidcheck(empDto dto) {
		return dao.empidcheck(dto);
	}
	public String emppwcheck(String empid) {
		return dao.emppwcheck(empid);

	}
}
