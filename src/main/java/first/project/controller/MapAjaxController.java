package first.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import first.project.dto.buserDto;
import first.project.service.MapService;

@RestController
public class MapAjaxController {
	@Autowired
	MapService service;
	
//	@RequestMapping("/res/phoneup")
//	public int resuserphoneup(buserDto dto) {
//		String userid = "yjh";
//		int update = service.updateUserPhone(dto.getUserphone(), userid);
//		
//		return update;
//	}
	
//	@RequestMapping("/res/btypeup")
//	public int resuserbtypeup(buserDto dto) {
//		String userid = "yjh";
//		int update = service.updateUserBtype(dto.getUserbtype(), userid);
//		return update;
//	}
}
