package first.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class goodslist {
	String goods;			//���ǰ
	String userid;			//����ھ��̵�
	Date goodsdate;		//��÷����
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	String bhname;			//���������̸�
	int goodsnum;			//��÷������ȣ (������)	
}
