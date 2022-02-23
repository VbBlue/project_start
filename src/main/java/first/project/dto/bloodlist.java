package first.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class bloodlist { //ÇåÇ÷³»¿ª
	String bhname;		//ÇåÇ÷ÀÇÁı ÀÌ¸§
	String userid;		//»ç¿ëÀÚ ¾ÆÀÌµğ
	Date bhdate;		//ÇåÇ÷ÇÑ ³¯Â¥
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	String bhselect;		//ÇåÇ÷ Á¾·ù
	int bhlistnum;		//ÇåÇ÷³»¿ª ¹øÈ£ (½ÃÄö½º)
}
