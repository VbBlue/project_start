package first.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import first.project.dto.empDto;
import first.project.dto.reservation;
import first.project.dto.bhtimeDto;
import first.project.dto.bloodlist;
import first.project.dto.bloodownDto;
import first.project.dto.boardDto;
import first.project.service.EmpService;


@Controller
public class EmpController {

	@Autowired
	EmpService service;

	@RequestMapping("/empres")
	public String reservation() {
		return "/emppage/emp_reservation";
	}
	
	@GetMapping("/emppage")
	public String emppageform() {
		return"emppage/emp_main";
	}

	@RequestMapping("/emp_reslist")
	@ResponseBody
	public String emp_reslist(@RequestParam(name="p", defaultValue = "1") int page, HttpSession session, String cal1, String cal2) {
		Map<String, Object> param = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<>();
		empDto dto = (empDto)session.getAttribute("emp");
		String bhname = dto.getBhname();
		param.put("bhname", bhname);
		param.put("cal1", cal1);
		param.put("cal2", cal2);
		Gson gson = new Gson();
		String reslist = "";
		int perPage = 10;	//한 페이지에 보일 글 개수
		int count = service.emp_reslist_count(param);
		if(count > 0 ) {
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;
			param.put("startRow", startRow);
			param.put("endRow", endRow);
			List<Map<String, Object>> list = service.emp_reslist(param);
			result.put("list", list);
			int pageNum = 5;
			int totalPages = count/perPage + (count % perPage > 0 ? 1:0);

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			result.put("begin", begin);
			result.put("end", end);
			result.put("count", count);
			reslist = gson.toJson(result);
		}else {
			result.put("count",count);
			reslist = gson.toJson(result);
		}
		return reslist;
	}

	@RequestMapping("/res_confirm")
	public void res_confirm(int resnum) {
		service.res_confirm(resnum);
	}

	@RequestMapping("/res_cancel")
	public void res_cancel(int resnum) {
		service.res_cancel(resnum);
	}

	@RequestMapping("/empblist")
	public String bloodlist() {
		return "/emppage/emp_bloodlist";
	}

	@RequestMapping("/empblist_search")
	@ResponseBody
	public String bloodlist_search(@RequestParam(name="p", defaultValue = "1") int page, HttpSession session, String cal1, String cal2) {
		Map<String, Object> param = new HashMap<String, Object>();
		empDto dto = (empDto)session.getAttribute("emp");
		String bhname = dto.getBhname();
		param.put("bhname", bhname);
		param.put("cal1", cal1);
		param.put("cal2", cal2);
		Gson gson = new Gson();
		String blist = "";
		int perPage = 10;	//한 페이지에 보일 글 개수
		int count = service.emp_bloodlist_count(param);
		if(count > 0 ) {
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;
			param.put("startRow", startRow);
			param.put("endRow", endRow);
			List<Map<String, Object>> list = service.emp_bloodlist(param);
			Map<String, Object> result = new HashMap<>();
			result.put("list", list);
			int pageNum = 5;
			int totalPages = count/perPage + (count % perPage > 0 ? 1:0);

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			result.put("begin", begin);
			result.put("end", end);
			result.put("count", count);
			blist = gson.toJson(result);
		}
		return blist;
	}

	@RequestMapping("/today_res")
	public String today_res() {
		return "/emppage/emp_today_res";
	}

	@RequestMapping("/today_res_list")
	@ResponseBody
	public String today_res_list(@RequestParam(name="p", defaultValue = "1") int page, HttpSession session) {
		Map<String, Object> param = new HashMap<String, Object>();
		empDto dto = (empDto)session.getAttribute("emp");
		String bhname = dto.getBhname();
		param.put("bhname", bhname);
		Gson gson = new Gson();
		String reslist = "";
		int perPage = 10;	//한 페이지에 보일 글 개수
		int count = service.emp_today_list_count(bhname);
		Map<String, Object> result = new HashMap<>();
		result.put("count", count);
		if(count > 0) {
			int startRow = (page - 1) * perPage + 1;
			int endRow = page * perPage;
			param.put("startRow", startRow);
			param.put("endRow", endRow);
			List<Map<String, Object>> list = service.emp_today_list(param);
			result.put("list", list);
			int pageNum = 5;
			int totalPages = count/perPage + (count % perPage > 0 ? 1:0);
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			result.put("begin", begin);
			result.put("end", end);
		}
		reslist = gson.toJson(result);
		return reslist;
	}

	@RequestMapping("/b_complete")
	public void b_complete(reservation res, HttpSession session) {
		empDto emp = (empDto)session.getAttribute("emp");
		bloodownDto bown = new bloodownDto();
		bloodlist blist = new bloodlist();
		blist.setEmpid(emp.getEmpid());
		blist.setBhname(res.getBhname());
		blist.setUserid(res.getUserid());
		blist.setBhselect(res.getBhselect());
		String btype = service.btype(res.getUserid());
		bown.setBhname(res.getBhname());
		bown.setUserbtype(btype);
		bown.setBhselect(res.getBhselect());
		service.bown_insert(bown);
		service.b_complete(res.getResnum());
		service.blist_insert(blist);
	}
	
	@RequestMapping("/empset")
	public String setting(HttpSession session, Model m) {
		empDto emp = (empDto)session.getAttribute("emp");
		String bhname = emp.getBhname();
		bhtimeDto bhtime = service.bhtime_info(bhname);
		m.addAttribute("bhtime", bhtime);
		return "/emppage/emp_setting";
	}

	@RequestMapping("/bhtime_set")
	public String bhtime_set(HttpSession session, bhtimeDto bhtime) {
		empDto emp = (empDto)session.getAttribute("emp");
		String bhname = emp.getBhname();
		bhtime.setBhname(bhname);
		service.bhtime_set(bhtime);
		return "redirect:/emp";
	}

}
