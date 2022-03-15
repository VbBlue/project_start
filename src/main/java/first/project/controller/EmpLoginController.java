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

import first.project.dto.empDto;
import first.project.email.EmailService;
import first.project.email.EmailVO;
import first.project.service.EmpLoginService;


@Controller
@SessionAttributes("emp")
public class EmpLoginController {

	@Autowired
	EmpLoginService empLoginService;

	@Autowired
	private EmailService emailService;



	@ModelAttribute("emp")
	public empDto getEmpDto() {
		return new empDto();
	}


	@PostMapping("emplogin")
	public String emplogin(@ModelAttribute("command") @Valid empDto dto, BindingResult error, Model m) {

		empDto resultEmpDto = empLoginService.emplogin(dto);
		if(resultEmpDto == null) {
			error.reject("nocode", "아이디와 비밀번호를 확인해주세요.");
			return "login/emplogin";
		} else {
			m.addAttribute("emp", resultEmpDto);
		}
		return "redirect:/";

		}

	@GetMapping("emplogout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}

//	@GetMapping("signup")
//		public String singup() {
//			return "signup/signup";
//	}


	@GetMapping("findempidform")
	public String findempidform() {
		return "login/findempid";
	}

	@PostMapping("/findempid")
	public String findempidResult(Model model, empDto dto) {
		empDto empid = empLoginService.findempid(dto);
		System.out.println(empid);
		model.addAttribute("findempid", empid);
		return "login/findempidResult";
	}


	@GetMapping("findemppwform")
	public String findemppwform() {
		return "login/findemppw";
	}

	@PostMapping("/findemppw")
	public String findemppwResult(Model model, empDto dto) throws Exception {
		empDto emppw = empLoginService.findemppw(dto);
		System.out.println(emppw);

		if (emppw == null){
			model.addAttribute("findemppw", emppw);
		} else {
			String empemail = emppw.getEmpemail();
			EmailVO email = new EmailVO();

			email.setReceiver(empemail);
			email.setSubject("비밀번호 보내드립니다");
			email.setContent("비밀번호는" +emppw.getEmppw()+ "입니다.");

			Boolean result = emailService.sendMail(email);
			System.out.println(result);
			model.addAttribute("result", result);
			model.addAttribute("findemppw", emppw);
		}


		return "login/findemppwResult";

	}

	// 이메일 전송



	}



