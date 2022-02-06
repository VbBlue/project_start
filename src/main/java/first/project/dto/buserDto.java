package first.project.dto;

import lombok.Data;

@Data
public class buserDto {
	String userid;			//아이디
	String userpw;			//비밀번호
	String username;		//이름
	String userphone;		//전화번호
	String useremail;		//이메일
	String userbtype;		//혈액형
	String userbirth;		//생년월일
	String useraddr;		//주소
	int bcount;				//헌혈횟수
	int point;				//포인트
}
