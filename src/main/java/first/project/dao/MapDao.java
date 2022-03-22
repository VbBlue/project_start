package first.project.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import first.project.dto.bloodhouse;
import first.project.dto.buserDto;
import first.project.dto.reservation;

@Mapper
public interface MapDao {

	buserDto buserinfo(String id);
	
	int reservation(reservation dto);
	
	reservation resselect(String id);
	
	int updateUserPhone(Map<String, Object> m);
	
	int updateUserBtype(Map<String, Object> m);
	
	int res_userid_count(String userid);
	
	int selectage(String userid);
	
	ArrayList<bloodhouse> search_bhname(String info);
	ArrayList<bloodhouse> search_bhlocation(String info);
	int bh_insert(bloodhouse dto);
}
