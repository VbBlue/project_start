package first.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class goodslist {
	String goods;			//기념품
	String userid;			//사용자아이디
	Date goodsdate;		//당첨일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	String bhname;			//헌혈의집이름
	int goodsnum;			//당첨내역번호 (시퀀스)	
}
