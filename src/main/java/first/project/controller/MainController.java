package first.project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import first.project.dto.bloodlist;
import first.project.dto.buserDto;
import first.project.service.MypageService;

@Controller
public class MainController {
	
	@Autowired
	MypageService m_service;
	
	@GetMapping("/")
	public String indexform() {
		return "index";
	}

	@GetMapping("signupform")
	public String signupform() {
		return "signup";
	}
	
	@GetMapping("loginform")
	public String loginform() {
		return "login";
	}
	
	@GetMapping("boardform")
	public String boardform() {
		return "board";
	}
	
	@GetMapping("mapform")
	public String mapform() {
		return "map";
	}
	
	@GetMapping("mypageform")
	public String mypageform(HttpSession session, Model m) throws ParseException {
		buserDto dto = new buserDto("red", "1234", "빨강", "010-0000-0001", "red@gmail.com", "A", "901010", "강남", 10, 100);
		session.setAttribute("user", dto);
		buserDto user = (buserDto)session.getAttribute("user");
		if(session.getAttribute("user") != null) {
			bloodlist list = m_service.last_bhdate(user.getUserid());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = list.getBhdate();
			Date now = new Date();
			String today = sdf.format(now);
			Date format1 = new SimpleDateFormat("yyyyMMdd").parse(today);
			Long Dday = (format1.getTime() - date.getTime())/(1000*60*60*24);
			String bhselect = list.getBhselect();
			Map<String, Object> lastDay = new HashMap<>();
			lastDay.put("Dday", Dday);
			lastDay.put("bhselect", bhselect);
			m.addAttribute("lastDay", lastDay);
			return "mypage";
		}
		return "redirect:/";
	}
}
