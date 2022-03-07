package first.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.project.dao.JoinDao;
import first.project.dto.buserDto;
import first.project.dto.empDto;

@Service
public class JoinService {
	@Autowired
	JoinDao dao;
	
	public int empsignup(empDto dto) {
		return dao.empsignup(dto);
	}
	
	public int usersignup(buserDto dto) {
		return dao.usersignup(dto);
	}
	
	public int empidcheck(String empid) {
		return dao.empidcheck(empid);
	}
	public int useridcheck(String userid) {
		return dao.useridcheck(userid);
	}
}
