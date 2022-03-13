package first.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class bloodlist { //��������
	String bhname;		//�������� �̸�
	String userid;		//����� ���̵�
	Date bhdate;		//������ ��¥
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	String bhselect;		//���� ����
	int bhlistnum;		//�������� ��ȣ (������)
	String empid;
}
