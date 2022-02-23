package first.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import first.project.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
}
