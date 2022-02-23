package first.project.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import first.project.dto.buserDto;
import first.project.email.EmailService;
import first.project.email.EmailVO;
import first.project.service.LoginService;


@Controller
@SessionAttributes("user")
public class LoginController {

	@Autowired	//의존
	LoginService service;

	@Autowired
	private EmailService emailService;



	@ModelAttribute("user")
	public buserDto getBuserDto() {
		return new buserDto();
	}


	@PostMapping("login")
	public String login(@ModelAttribute("command") @Valid buserDto dto, BindingResult error, Model m) {

		buserDto resultDto = service.login(dto);
		if(resultDto == null) {
			error.reject("nocode", "아이디와 비밀번호를 확인해주세요.");
			return "login/login";
		} else {
			m.addAttribute("user", resultDto);
		}
		return "redirect:/";
	}


	@GetMapping("logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}

	@GetMapping("checklogin")
	public String check(@ModelAttribute("user") buserDto dto) {
		if(dto.getUserid() != null) {
		return "login/loginckeck";
		} else {
			return "redirect:/loginform";
		}
	}

	// 회원가입 페이지로 이동하기
	@GetMapping("signup")
	public String signup() {
		return "signup/signup";
	}


	@GetMapping("findidform")
	public String findidform() {
		return "login/findid";
	}

	// 아이디 찾기
	@PostMapping("/findid")
	public String findidResult(Model model, buserDto dto) {
		buserDto id = service.findid(dto);
		System.out.println(id);
		model.addAttribute("findid", id);
		return "login/findidResult";
	}


	@GetMapping("findpwform")
	public String findpwform() {
		return "login/findpw";
	}

	// 비밀번호 찾기
	@PostMapping("/findpw")
	public String findpwResult(Model model, buserDto dto) throws Exception {
		buserDto pw = service.findpw(dto);
		System.out.println(pw);

		if (pw==null){
			model.addAttribute("findpw", pw);
		} else {
			String useremail = pw.getUseremail();
			EmailVO email = new EmailVO();

			email.setReceiver(useremail);
			email.setSubject("비밀번호 보내드립니다");
			email.setContent("비밀번호는" +pw.getUserpw()+ "입니다.");

			Boolean result = emailService.sendMail(email);
			System.out.println(result);
			model.addAttribute("result", result);
			model.addAttribute("findpw", pw);
		}


		return "login/findpwResult";

	}

	// 이메일 전송
}





