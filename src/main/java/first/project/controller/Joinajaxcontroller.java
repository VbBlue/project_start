package first.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import first.project.service.JoinService;

@RestController
public class Joinajaxcontroller {

	@Autowired
	JoinService service;
	
	@RequestMapping("/empidcheck")
	public int empidcheck(String empid) {
		int idcount = service.empidcheck(empid);
		return idcount;
	}
	@RequestMapping("/useridcheck")
	public int useridcheck(String userid) {
		int idcount = service.useridcheck(userid);
		return idcount;
	}
}
