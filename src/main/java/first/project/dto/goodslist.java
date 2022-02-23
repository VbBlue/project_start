package first.project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class goodslist {
	String goods;			//���ǰ
	String userid;			//����ھ��̵�
	Date goodsdate;		//��÷����
	String bhname;			//���������̸�
	int goodsnum;			//��÷������ȣ (������)	
}
