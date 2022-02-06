package first.project.dto;

import lombok.Data;

@Data
public class goodslist {
	String goods;			//기념품
	String userid;			//사용자아이디
	String goodsdate;		//당첨일자
	String bhname;			//헌혈의집이름
	int goodsnum;			//당첨내역번호 (시퀀스)	
}
