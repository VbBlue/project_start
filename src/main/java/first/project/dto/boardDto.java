package first.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class boardDto {  
	String boardname;		
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date boarddate;	
	String empid;			
	String inboard;			
	int boardview;			
	int boardnum;
	String bhname;
	int r;
}
