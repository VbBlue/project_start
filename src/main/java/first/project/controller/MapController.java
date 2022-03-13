package first.project.controller;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import first.project.dto.bloodhouse;
import first.project.dto.buserDto;
import first.project.service.MapService;
import first.project.dto.reservation;

@Controller
public class MapController {
	@Autowired
	MapService service;
	
	@RequestMapping("/resform")
	public String resform(buserDto buser , String name, String location, Model m) {
		String id = "red";
		bloodhouse bh = new bloodhouse();
		buser = service.buserinfo(id);
		
		
		bh.setBhname(name);
		bh.setBhlocation(location);
		m.addAttribute("bh",bh);
		m.addAttribute("buser", buser);
		
		return "res/reservationform";
	}
	
	@RequestMapping("/reservation")
	public String reservation(reservation dto,Model m, String bhlocation) {
		
		String userid = "red";
		SimpleDateFormat format1;
		format1 = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
		String resdate = format1.format(dto.getResdate());
		dto.setUserid(userid);
		dto.setResstate("대기중");
		
		service.reservation(dto);
		
		bloodhouse bh = new bloodhouse();
		bh.setBhlocation(bhlocation);
		bh.setBhname(dto.getBhname());
		
		
		buserDto user = service.buserinfo(dto.getUserid());
		reservation ressel = service.resselect(dto.getUserid());
		m.addAttribute("buser", user);
		m.addAttribute("bh", bh);
		m.addAttribute("res", ressel);
		m.addAttribute("date", resdate);
		
		return "res/resinfoform";
	}
	
	
	
}
