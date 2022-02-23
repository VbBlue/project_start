package first.project.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import first.project.service.MypageService;
import first.project.dto.*;

@Controller
public class MypageController {
	@Autowired
	MypageService service;
	
	@RequestMapping("/pass_chk")
	public String pass_chk() {
		return "/mypage/pass_chk";
	}
	
	@RequestMapping("/mem_updateForm")
	public String mem_updateFrom() {
		return "/mypage/mem_update";
	}
	
	@RequestMapping("/mem_update")
	public String mem_update(buserDto dto, HttpSession session) {
		buserDto user = (buserDto)session.getAttribute("user");
		if(dto.getUserid().equals(user.getUserid())) {
			service.updatebuser(dto);
		}
		return "redirect:/loginform";
	}
	
	@RequestMapping("/bloodlist_search")
	@ResponseBody
	public String bloodlist_search(@RequestParam(name="p", defaultValue = "1") int page, String userid, String cal1, String cal2) {
		Map<String, Object> cal = new HashMap<>();
		cal.put("userid", userid);
		cal.put("cal1", cal1);
		cal.put("cal2", cal2);
		List<bloodlist> list = service.bloodlist(cal);
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		int perPage = 10;	//한 페이지에 보일 글 개수
		int count = list.size();
		if(count > 0 ) {
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;
			int pageNum = 10;
			int totalPages = count/perPage + (count % perPage > 0 ? 1:0);
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			result.put("begin", begin);
			result.put("end", end);
			result.put("PageNum", pageNum);
			result.put("totalPages", totalPages);
		}
		result.put("count", count);
		Gson gson = new Gson();
		String bloodlist = gson.toJson(result);
		return bloodlist;
	}
	
	
	@RequestMapping("/bloodlist")
	public String bloodlist(Model m, HttpSession session) {
		if(session.getAttribute("user") != null) {
			return "/mypage/bloodlist";
		}
		return "redirect:/loginform";
	}
	
	@RequestMapping("/goodslist_search")
	@ResponseBody
	public String goodslist_search(@RequestParam(name="p", defaultValue = "1") int page, String userid, String cal1, String cal2) {
		Map<String, Object> cal = new HashMap<>();
		cal.put("userid", userid);
		cal.put("cal1", cal1);
		cal.put("cal2", cal2);
		List<goodslist> list = service.goodslist(cal);
		Map<String, Object> result = new HashMap<>();
		result.put("list", list);
		int perPage = 10;	//한 페이지에 보일 글 개수
		int count = list.size();
		if(count > 0 ) {
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;
			int pageNum = 10;
			int totalPages = count/perPage + (count % perPage > 0 ? 1:0);
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			result.put("begin", begin);
			result.put("end", end);
			result.put("PageNum", pageNum);
			result.put("totalPages", totalPages);
		}
		result.put("count", count);
		Gson gson = new Gson();
		String goodslist = gson.toJson(result);
		return goodslist;
	}
	
	@RequestMapping("/goodslist")
	public String goodslist(Model m, HttpSession session) {
		if(session.getAttribute("user") != null) {
			return "/mypage/goodslist";
		}
		return "redirect:/loginform";
	}
	
	@RequestMapping("/mem_delete")
	public String mem_delete(HttpSession session) {
		buserDto user = (buserDto)session.getAttribute("user");
		if(session.getAttribute("user") != null) {
			service.deleteuser(user.getUserid());
			return "redirect:/";
		}
		return "redirect:/loginform";
	}
	
	@RequestMapping("/reserv_stat")
	@ResponseBody
	public String reserv_stat(HttpSession session) {
		buserDto user = (buserDto)session.getAttribute("user");
		if(session.getAttribute("user") != null) {
			reservation reserv_stat = service.reserv_stat(user.getUserid());
			Gson gson = new Gson();
			String reserv = gson.toJson(reserv_stat);
			return reserv;
		}
		return "redirect:/loginform";
	}
	
	@RequestMapping("/reservation_updateForm")
	public String reservation_updateForm(Model m, HttpSession session) {
		buserDto user = (buserDto)session.getAttribute("user");
		if(session.getAttribute("user") != null) {
			reservation res = service.reserv_stat(user.getUserid());
			m.addAttribute("res", res);
			return "/mypage/reservation_update";
		}
		return "redirect:/loginform";
	}
	
	@RequestMapping("/reservation_update")
	public String reservation_update(reservation dto, HttpSession session) {
		buserDto user = (buserDto)session.getAttribute("user");
		if(dto.getUserid().equals(user.getUserid())) {
			service.updateReservation(dto);
			return "redirect:/";
		}
		return "redirect:/loginform";
	}
	
	@RequestMapping("/reservation_delete")
	public String reservation_delete(reservation dto, HttpSession session) {
		buserDto user = (buserDto)session.getAttribute("user");
		if(dto.getUserid().equals(user.getUserid())) {
			service.deleteReservation(dto);
			return "redirect:/";
		}
		return "redirect:/loginform";
	}
}
