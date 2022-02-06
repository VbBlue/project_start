package first.project.dto;

import lombok.Data;

@Data
public class empDto {
	String empid;		//아이디
	String emppw;		//비밀번호
	String empname;		//이름
	String empphone;	//전화번호
	String empemail;	//이메일
	String empbirth;	//생년월일
	String bhname;		//헌혈의집 이름
}
