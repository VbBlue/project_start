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
	
	//게시물 리스트
	public List<boardDto> depts() {
		List<boardDto> list = dao.listBoard();
		System.out.println(list.size());
		return list;
	}
	
	//게시물 작성
	public int insertBoard(boardDto dept) {
		int i = 0;
		try {
				i = dao.insertBoard(dept);
			} catch (DataAccessException e) {
				System.out.println("실패");
			}
		return i;	
	}
	
	//게시물 보기
	public boardDto viewBoard(int n) {
		return dao.viewBoard(n);
	}
	
	//게시물 업데이트
	public void update(boardDto dept) {		
		dao.update(dept);
	}
	
	
	//게시물 삭제
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}
	
	public int updateView(int no) throws Exception{
		return dao.updateView(no);
	}
}
