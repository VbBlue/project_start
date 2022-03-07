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
	
	//�Խù� ����Ʈ
	public List<boardDto> depts() {
		List<boardDto> list = dao.listBoard();
		System.out.println(list.size());
		return list;
	}
	
	//�Խù� �ۼ�
	public int insertBoard(boardDto dept) {
		int i = 0;
		try {
				i = dao.insertBoard(dept);
			} catch (DataAccessException e) {
				System.out.println("����");
			}
		return i;	
	}
	
	//�Խù� ����
	public boardDto viewBoard(int n) {
		return dao.viewBoard(n);
	}
	
	//�Խù� ������Ʈ
	public void update(boardDto dept) {		
		dao.update(dept);
	}
	
	
	//�Խù� ����
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}
	
	public int updateView(int no) throws Exception{
		return dao.updateView(no);
	}
}
