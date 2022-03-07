package first.project.controller;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import first.project.dto.bloodhouse;
import first.project.dto.buserDto;
import first.project.service.MapService;
import first.project.dto.reservation;

@SessionAttributes("user")
@Controller
public class MapController {
	@Autowired
	MapService service;
	
	@ModelAttribute("user")
	public buserDto getDto() {
		return new buserDto();
	}
	
	@RequestMapping("/resform")
	public String resform(@ModelAttribute("user") buserDto buser , String bhname, String bhlocation, Model m) {
		if(buser.getUserid()== null) {
			return "login/login";
		}
		else {
			bloodhouse bh = new bloodhouse();
			buser = service.buserinfo(buser.getUserid());
			
			int userage = service.selectage(buser.getUserid());
			bh.setBhname(bhname);
			bh.setBhlocation(bhlocation);
			m.addAttribute("userage", userage);
			m.addAttribute("bh",bh);
			m.addAttribute("buser", buser);
			
			return "res/reservationform";
		}
	}
	
	@RequestMapping("/reservation")
	public String reservation(@ModelAttribute("user") buserDto dto, reservation resdto,Model m, String bhlocation) {
		
		int count = service.res_userid_count(dto.getUserid());
		
		if(count >=1) {
			return "res/resfail";
		}else {
			SimpleDateFormat format1;
			format1 = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
			String resdate = format1.format(resdto.getResdate());
			resdto.setUserid(dto.getUserid());
			resdto.setResstate("대기중");
			
			service.reservation(resdto);
			
			bloodhouse bh = new bloodhouse();
			bh.setBhlocation(bhlocation);
			bh.setBhname(resdto.getBhname());
			
			
			buserDto user = service.buserinfo(dto.getUserid());
			reservation ressel = service.resselect(dto.getUserid());
			m.addAttribute("buser", user);
			m.addAttribute("bh", bh);
			m.addAttribute("res", ressel);
			m.addAttribute("date", resdate);
			
			return "res/resinfoform";
		}
		
	}
	
}
