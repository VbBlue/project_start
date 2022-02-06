package first.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import first.project.service.JoinService;

@Controller
public class JoinController {
	@Autowired
	JoinService service;
}
