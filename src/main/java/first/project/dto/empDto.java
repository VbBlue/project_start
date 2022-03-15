package first.project.dto;



import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;


import lombok.Data;




@Data
public class empDto {
	String empid;		//���̵�
	String emppw;		//��й�ȣ
	String empname;		//�̸�

	@Pattern(regexp = "^\\d{3}-\\d{4}-\\d{4}$")
	String empphone;	//��ȭ��ȣ

	String empemail;	//�̸���

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	String empbirth;	//�������

	String bhname;		//�������� �̸�
}
