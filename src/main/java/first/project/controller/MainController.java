package first.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	public String mapform() {
		return "res/map";
	}

	@GetMapping("mypageform")
	public String mypageform() {
		return "mypage/mypage";
	}

}
