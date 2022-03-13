package first.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import first.project.dto.bhtimeDto;
import first.project.dto.bloodlist;
import first.project.dto.bloodownDto;

@Mapper
public interface EmpDao {
	
	List<Map<String, Object>> emp_reslist(Map<String, Object> param);
	int emp_reslist_count(Map<String, Object> param);
	int res_confirm(int resnum);
	int res_cancel(int resnum);
	List<Map<String, Object>> emp_bloodlist(Map<String, Object> param);
	int emp_bloodlist_count(Map<String, Object> param);
	List<Map<String, Object>> emp_today_list(Map<String, Object> param);
	int emp_today_list_count(String bhname);
	int blist_insert(bloodlist blist);
	int b_complete(int resnum);
	String btype(String userid);
	int bown_insert(bloodownDto bown);
	bhtimeDto bhtime_info(String bhname);
	int bhtime_set(bhtimeDto bhtime);
	int emp_all_reslist_count(String bhname);
	int A_count(String bhname);
	int B_count(String bhname);
	int O_count(String bhname);
	int AB_count(String bhname);
}
