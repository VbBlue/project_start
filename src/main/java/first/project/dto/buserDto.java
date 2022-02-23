package first.project.dto;

import javax.validation.constraints.NotBlank;
//import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class buserDto {

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