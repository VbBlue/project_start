package first.project.dao;

import org.apache.ibatis.annotations.Mapper;

import first.project.dto.empDto;

@Mapper
public interface EmpLoginDao {


	public empDto emplogin(empDto dto);

	public int updateEmp(empDto dto);

	public int insertEmp(empDto dto);

	public empDto findempid(empDto dto);

	public empDto findemppw(empDto dto);

	public empDto empidcheck(empDto dto);

	public String emppwcheck(String empid);

}
