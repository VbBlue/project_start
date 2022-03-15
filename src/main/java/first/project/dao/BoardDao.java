package first.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.dao.DataAccessException;

import first.project.dto.boardDto;


@Mapper
public interface BoardDao {
	List<boardDto> boardList(Map<String, Object> m);
	
	int boardinsert(boardDto dto);
	
	int bcount();
	
	boardDto boardOne(int boardnum);
	
	int updateBoard(boardDto dto);
	
	int deleteBoard(int boardnum);
}
