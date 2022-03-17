package first.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import first.project.dao.BoardDao;
import first.project.dto.boardDto;

@Service
public class BoardService {
	@Autowired
	BoardDao dao;
	
	public int boardinsert(boardDto dto) {
		return dao.boardinsert(dto);
	}
	
	public List<boardDto> boardList(int start, int end){
		Map<String, Object> m =new HashMap<String, Object>();
		m.put("start", start);
		m.put("end", end);
		
		return dao.boardList(m);
	}
	
	public int bcount() {
		return dao.bcount();
	}
	
	public boardDto boardOne(int boardnum) {
		return dao.boardOne(boardnum);
	}
	
	public int updateBoard(boardDto dto) {
		return dao.updateBoard(dto);
	}
	
	public int deleteBoard(int boardnum) {
		return dao.deleteBoard(boardnum);
	}
	
	public int viewcount(int boardnum) {
		return dao.viewcount(boardnum);
	}
}
