package first.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.project.dao.EmpDao;
import first.project.dto.bhtimeDto;
import first.project.dto.bloodlist;
import first.project.dto.bloodownDto;

@Service
public class EmpService {
	@Autowired
	EmpDao dao;
	
	public List<Map<String, Object>> emp_reslist(Map<String, Object> param) {
		return dao.emp_reslist(param);
	}
	
	public int emp_reslist_count(Map<String, Object> param) {
		return dao.emp_reslist_count(param);
	}
	
	public int res_confirm(int resnum) {
		return dao.res_confirm(resnum);
	}
	
	public int res_cancel(int resnum) {
		return dao.res_cancel(resnum);
	}
	
	public List<Map<String, Object>> emp_bloodlist(Map<String, Object> param) {
		return dao.emp_bloodlist(param);
	}
	
	public int emp_bloodlist_count(Map<String, Object> param) {
		return dao.emp_bloodlist_count(param);
	}
	
	public List<Map<String, Object>> emp_today_list(Map<String, Object> param) {
		return dao.emp_today_list(param);
	}
	
	public int emp_today_list_count(String bhname) {
		return dao.emp_today_list_count(bhname);
	}
	
	public int blist_insert(bloodlist blist) {
		return dao.blist_insert(blist);
	}
	
	public int b_complete(int resnum) {
		return dao.b_complete(resnum);
	}
	
	public String btype(String userid) {
		return dao.btype(userid);
	}
	
	public int bown_insert(bloodownDto bown) {
		return dao.bown_insert(bown);
	}
	
	public bhtimeDto bhtime_info(String bhname) {
		return dao.bhtime_info(bhname);
	}
	
	public int bhtime_set(bhtimeDto bhtime) {
		return dao.bhtime_set(bhtime);
	}
	
	public int emp_all_reslist_count(String bhname) {
		return dao.emp_all_reslist_count(bhname);
	}
	
	public int A_count(String bhname) {
		return dao.A_count(bhname);
	}
	
	public int B_count(String bhname) {
		return dao.B_count(bhname);
	}
	
	public int O_count(String bhname) {
		return dao.O_count(bhname);
	}
	
	public int AB_count(String bhname) {
		return dao.AB_count(bhname);
	}
	
}
