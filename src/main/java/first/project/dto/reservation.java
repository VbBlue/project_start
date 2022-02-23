package first.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class reservation {  //���೻��
	String bhname;			//�������� �̸�
	String userid;		//����� �̸�
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date resdate;			//���೯¥
	String restime;			//����ð�
	String goods;			//���ǰ
	String bhselect;		//�������� (���� //�Ϲ����� )
	int resnum;				//���೻�� ��ȣ (������)
	String resstate;		//�������
}
