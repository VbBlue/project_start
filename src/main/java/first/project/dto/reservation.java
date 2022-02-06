package first.project.dto;

import lombok.Data;

@Data
public class reservation {  //예약내역
	String bhname;			//헌혈의집 이름
	String username;		//사용자 이름
	String resdate;			//예약날짜
	String restime;			//예약시간
	String goods;			//기념품
	String bhselect;		//헌혈종류 (전혈 //일반헌혈 )
	int resnum;				//예약내역 번호 (시퀀스)
	String resstate;		//예약상태
}
