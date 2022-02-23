package first.project.dao;

import org.apache.ibatis.annotations.Mapper;

import first.project.dto.buserDto;
import first.project.dto.empDto;

@Mapper
public interface JoinDao {
	int empsignup(empDto dto);
	int usersignup(buserDto dto);
	int empidcheck(String empid);
	int useridcheck(String userid);

}
