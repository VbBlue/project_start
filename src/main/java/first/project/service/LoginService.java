package first.project.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.project.dao.LoginDao;
import first.project.dto.buserDto;

@Service
public class LoginService {
	@Autowired
	LoginDao dao;


	public buserDto login(buserDto dto) {
		return dao.login(dto);
	}

	public int updateMem(buserDto dto) {
		return dao.updateMem(dto);
	}

	public int insertMem(buserDto dto) {
		return dao.insertMem(dto);
	}

	public buserDto findid(buserDto dto) {
		return dao.findid(dto);

	}

	public buserDto findpw(buserDto dto) {
		return dao.findpw(dto);

	}
	public buserDto idcheck(buserDto dto) {
		return dao.idcheck(dto);
	}

	public String pwdcheck(String userid) {
		return dao.pwdcheck(userid);
	}
}