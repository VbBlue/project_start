package first.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import first.project.dto.buserDto;
import first.project.dto.empDto;
import first.project.service.JoinService;

@Controller
public class JoinController {
	@Autowired
	JoinService service;
	
	@GetMapping("/empsignupform")
	public String empsignupform() {
		return "signup/empsignupform";
	}
	@GetMapping("/usersignupform")
	public String usersignupform() {
		return "signup/usersignupform";
	}
	@PostMapping("/empsignup")
	public String empsignup(empDto dto) {
		service.empsignup(dto);
		return "login/login";
	}
	
	@PostMapping("/usersignup")
	public String usersignup(buserDto dto) {
		dto.setBcount(0);
		dto.setPoint(0);
		service.usersignup(dto);
		return "login/login";
	}
}
