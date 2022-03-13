package first.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import first.project.dto.bloodhouse;
import first.project.dto.bloodlist;
import first.project.dto.buserDto;
import first.project.dto.empDto;
import first.project.service.EmpService;
import first.project.service.MypageService;


@Controller
public class MainController {
	@Autowired
	MypageService m_service;
	@Autowired
	EmpService e_servcie;

	@GetMapping("/")
	public String indexform() {
		return "index";
	}

	@GetMapping("signupform")
	public String signupform() {
		return "signup/signup";
	}

	@GetMapping("loginform")
	public String loginform() {
		return "login/login";
	}

	@GetMapping("boardform")
	public String boardform() {
		return "board/board";
	}

	@GetMapping("mapform")
	public String mapform(Model m) {

		List<bloodhouse> bh_list = new ArrayList<bloodhouse>();

		try {

            String urlStr = "https://api.odcloud.kr/api/15050728/v1/uddi:090a49f9-241c-4738-a3b4-bcff01d0062b_201711011009?page=1&perPage=200&serviceKey=TUfKwHlNTObSFJi9MUmOuy65HOB6W2S%2FcDhIbyI4ExrHpugJ2DZxO0e1RQtefwagX9JkVyBFlel9XMdE3nucLg%3D%3D";
            URL url = new URL(urlStr);

            String line = "";
            String result = "";

            BufferedReader br;
            br = new BufferedReader(new InputStreamReader(url.openStream()));
            while ((line = br.readLine()) != null) {
                result = result.concat(line);
            }

            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject)parser.parse(result);
            JSONArray parse_listArr = (JSONArray)obj.get("data");

            for (int i=0;i< parse_listArr.size();i++) {
            	bloodhouse bh = new bloodhouse();
                JSONObject bhouse = (JSONObject) parse_listArr.get(i);
                bh.setBhphone((String)bhouse.get("전화번호"));
                bh.setBhname((String)bhouse.get("헌혈의 집"));
                bh.setBhone((String)bhouse.get("혈액원"));
                bh.setBhlocation((String)bhouse.get("주소지"));
                bh_list.add(bh);

            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

		m.addAttribute("bh_list",bh_list);
		return "res/map";
	}

	@GetMapping("mypageform")
	public String mypageform(HttpSession session, Model m) throws ParseException {
		buserDto user = (buserDto)session.getAttribute("user");
		if(session.getAttribute("user") != null) {
			if(m_service.last_bhdate(user.getUserid()) != null) {
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
			}
			return "mypage/mypage";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/emp")
	public String emppage(HttpSession session, Model m) {
		empDto dto = new empDto("red_emp", "red_emp", "빨강", "010-0001-0002", "test@gmail.com", "2020-11-01", "한라센터");
		session.setAttribute("emp", dto);
		if(session.getAttribute("emp") != null) {
			String bhname = dto.getBhname();
			int resCount = e_servcie.emp_all_reslist_count(bhname);
			int todayCount = e_servcie.emp_today_list_count(bhname);
			int aCount = e_servcie.A_count(bhname);
			int bCount = e_servcie.B_count(bhname);
			int oCount = e_servcie.O_count(bhname);
			int abCount = e_servcie.AB_count(bhname);
			m.addAttribute("resCount", resCount);
			m.addAttribute("todayCount", todayCount);
			m.addAttribute("A", aCount);
			m.addAttribute("B", bCount);
			m.addAttribute("O", oCount);
			m.addAttribute("AB", abCount);
			return "emppage/emp_main";
		}
		return "redirect:/";
		
	}

}
