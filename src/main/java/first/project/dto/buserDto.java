package first.project.dto;

<<<<<<< HEAD
import javax.validation.constraints.NotBlank;
//import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Builder;
=======
import java.util.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

>>>>>>> branch 'master' of https://github.com/shshshrj/project_start.git
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class buserDto {
<<<<<<< HEAD

   @NotBlank(message="아이디는 필수 입력 값입니다.")
   private String userid;

   @NotBlank(message="비밀번호는 필수 입력 값입니다.")
   private String userpw;

   private String username;

   private String userphone;


   private String useremail;

   private String userbtype;

   private String userbirth;

   private String useraddr;

   private int bcount;
   private int point;
}
=======
	
	@Size(min=2, max=15)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String userid;			//���̵�
	
	@Size(min=8, max=15)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String userpw;			//��й�ȣ
	
	@Size(min=2, max=4)
	@Pattern(regexp = "[가-힣]*")
	private String username;		//�̸�
	
	
	@Pattern(regexp = "^010-?([0-9]{4})-?([0-9]{4})$", message = "010-xxxx-xxxx")
	private String userphone;		//��ȭ��ȣ

	private String useremail;		//�̸���
	private String userbtype;		//������
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date userbirth;		//�������
	
	private String useraddr;		//�ּ�
	private int bcount;				//����Ƚ��
	private int point;				//����Ʈ
}
>>>>>>> branch 'master' of https://github.com/shshshrj/project_start.git
