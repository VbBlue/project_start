package first.project.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.project.dao.MapDao;
import first.project.dto.buserDto;
import first.project.dto.reservation;

@Service
public class MapService {
	@Autowired
	MapDao dao;
	
	public buserDto buserinfo(String id) {
		return dao.buserinfo(id);
	}
	
	public int reservation(reservation dto) {
		return dao.reservation(dto);
	}
	
	public reservation resselect(String id) {
		return dao.resselect(id);
	}
	
	public int updateUserPhone(String userphone, String userid) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("userphone", userphone);
		m.put("userid", userid);
		return dao.updateUserPhone(m);
	}
	
	public int updateUserBtype(String userbtype, String userid) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("userbtype", userbtype);
		m.put("userid", userid);
		return dao.updateUserBtype(m);
	}
}
