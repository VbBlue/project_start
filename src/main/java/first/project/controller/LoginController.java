package first.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import first.project.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	LoginService service;
}
