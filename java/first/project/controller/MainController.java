package first.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;

import first.project.dto.bloodhouse;


@Controller
public class MainController {
	
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
	public String mypageform() {
		return "mypage/mypage";
	}
}
