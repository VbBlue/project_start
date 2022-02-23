package first.project.dao;



import org.apache.ibatis.annotations.Mapper;


import first.project.dto.buserDto;


@Mapper
public interface LoginDao {


	public buserDto login(buserDto dto);

	public int updateMem(buserDto dto);

	public int insertMem(buserDto dto);

	public buserDto findid(buserDto dto);

	public buserDto findpw(buserDto dto);

	public buserDto idcheck(buserDto dto);

	public String pwdcheck(String userid);



}



