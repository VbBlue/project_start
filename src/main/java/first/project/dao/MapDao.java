package first.project.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import first.project.dto.buserDto;
import first.project.dto.reservation;

@Mapper
public interface MapDao {

	buserDto buserinfo(String id);
	
	int reservation(reservation dto);
	
	reservation resselect(String id);
	
	int updateUserPhone(Map<String, Object> m);
	
	int updateUserBtype(Map<String, Object> m);
}
