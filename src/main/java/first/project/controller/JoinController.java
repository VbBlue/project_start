package first.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import first.project.dto.bloodhouse;
import first.project.dto.buserDto;
import first.project.dto.empDto;
import first.project.service.JoinService;

@Controller
public class JoinController {
	@Autowired
	JoinService service;
	
	@GetMapping("/empsignupform")
	public String empsignupform() {
		return "signup/empsignupform";
	}
	@GetMapping("/usersignupform")
	public String usersignupform() {
		return "signup/usersignupform";
	}
	@PostMapping("/empsignup")
	public String empsignup(empDto dto) {
		service.empsignup(dto);
		return "login/emplogin";
	}
	
	@PostMapping("/usersignup")
	public String usersignup(buserDto dto,String useraddr_front, String useraddr_back) {
		String useraddr = useraddr_front + useraddr_back;
		dto.setUseraddr(useraddr);
		dto.setBcount(0);
		dto.setPoint(0);
		service.usersignup(dto);
		return "login/login";
	}
	
	@GetMapping("/findbhform")
	public String findbhform(@RequestParam(name="p",defaultValue = "1") int page, Model m) {
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
		
		int count = bh_list.size();
		if(count > 0) {
			int perpage = 10; //���������� ���� ���� ����
			int startRow = (page-1) * perpage;
			int endRow = page * perpage;
		
			List<bloodhouse> bh_page_list = new ArrayList<bloodhouse>();
			for (int i=0; i<bh_list.size(); i++) {
				if(i>=startRow && i<=endRow) {
					bh_page_list.add(bh_list.get(i));
				}
			}
			m.addAttribute("bh_page_list", bh_page_list);
			
			int pageNum = 10;
			int totalPages = count / perpage + (count%perpage > 0 ? 1:0);//��ü ��������
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if(end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("totalpages", totalPages);
			m.addAttribute("pageNum", pageNum);
		}
		m.addAttribute("count", count);

		m.addAttribute("bh_list",bh_list);
		return "signup/findbhform";
	}
}
