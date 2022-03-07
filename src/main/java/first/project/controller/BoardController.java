package first.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

import first.project.dto.boardDto;
import first.project.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	//리스트
	@RequestMapping("boardform") 
	public String boardPrint(Model m) {
		List<boardDto> list = service.depts();
		m.addAttribute("listBoard", list);
		return "board";
	}
	
	//매핑
	@RequestMapping("boardCreate")
	public void boardCreate(Model m) {
	}
	
	//작성
	@RequestMapping("insert")
	public String insertBoard(boardDto dept, Model m) {
		int i = service.insertBoard(dept);
		m.addAttribute("i", i);
		return "insert";
	}
	
	//상세보기
	@RequestMapping("boardView")
	public String boardView(Model m, int no) throws Exception {
		service.updateView(no);
		boardDto dept = service.viewBoard(no);		
		m.addAttribute("dept", dept);
		return "boardView";
	}
	
	//수정 페이지
	@RequestMapping("boardUpdate")
	public String boardUpdate(Model m, int no) throws Exception{
		boardDto dept = service.viewBoard(no);
		m.addAttribute("dept", dept);
		return "boardUpdate";
	}
	
	//수정
	@RequestMapping("update")
	public String update(boardDto dept) throws Exception{
		service.update(dept);
		return "update";
	}
	
	//삭제
	@RequestMapping("boardDelete")
	public String boardDelete(int no) throws Exception{
		service.deleteBoard(no);
		return "delete";
	}
	
}



