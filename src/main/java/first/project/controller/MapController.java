package first.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import first.project.service.MapService;

@Controller
public class MapController {
	@Autowired
	MapService service;

	
	
}
