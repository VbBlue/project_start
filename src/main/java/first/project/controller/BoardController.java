package first.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.ui.Model;

import first.project.dto.boardDto;
import first.project.dto.empDto;
import first.project.service.BoardService;

@SessionAttributes("emp")
@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@ModelAttribute("emp")
	public empDto getDto() {
		return new empDto();
	}
	
	@PostMapping("boardinsert")
	public String write(boardDto dto) {
		service.boardinsert(dto);
		return "redirect:boardform";
	}
	
	@GetMapping("/boardwrite")
	public String writeForm(@ModelAttribute("emp") empDto dto, Model m) {
		m.addAttribute("dto", dto);
		return "/board/write";
	}
	
	@RequestMapping("/contents{boardnum}")
	public String content(@ModelAttribute("emp") empDto empdto,@PathVariable int boardnum, Model m) {
		service.viewcount(boardnum);
		boardDto dto = service.boardOne(boardnum);
		
		m.addAttribute("dto", dto);
		return "board/contents";
	}
	
	@GetMapping("update{no}")
	public String updateForm(@PathVariable int no, Model m ) {
		boardDto dto = service.boardOne(no);
		m.addAttribute("dto", dto);
		return "board/updateForm";
	}

	@PutMapping("/update")
	public String update(boardDto dto) {
		service.updateBoard(dto);
		return "redirect:boardform";
	}
	
	@DeleteMapping("/board/delete")
	@ResponseBody
	public String delete(int boardnum) {
		service.deleteBoard(boardnum);
		return "redirect:boardform";
	}
}



