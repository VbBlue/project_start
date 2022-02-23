package first.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import first.project.service.MypageService;

@Controller
public class MypageController {
	@Autowired
	MypageService service;
}
