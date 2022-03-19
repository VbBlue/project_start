package first.project.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import first.project.dto.bloodhouse;
import first.project.dto.buserDto;
import first.project.service.MapService;

@SessionAttributes("user")
@RestController
public class MapAjaxController {
	@Autowired
	MapService service;
	
	@RequestMapping("/res/phoneup")
	public int resuserphoneup(@ModelAttribute("user") buserDto dto) {
		int update = service.updateUserPhone(dto.getUserphone(), dto.getUserid());
		return update;
	}
	
	@RequestMapping("/res/btypeup")
	public int resuserbtypeup(@ModelAttribute("user") buserDto dto) {
		int update = service.updateUserBtype(dto.getUserbtype(), dto.getUserid());
		return update;
	}
	
	@RequestMapping("/bh_search")
	public ArrayList<bloodhouse> bh_search(String info, String select) {
		ArrayList<bloodhouse> dto = service.bh_search(info, select);
		return dto;
	}
}
