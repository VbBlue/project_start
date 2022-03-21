package first.project.dto;

//import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Builder;

import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class buserDto {
	@Size(min=2, max=15)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String userid;		

	@Size(min=8, max=15)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String userpw;			

	@Size(min=2, max=4)
	@Pattern(regexp = "[가-힣]*")
	private String username;		


	private String userphone;		

	private String useremail;		
	private String userbtype;		

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date userbirth;		

	private String useraddr;		
	private int bcount;				
	private int point;				
}
