package first.project.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class bloodlist { //��������
	String bhname;		//�������� �̸�
	String userid;		//����� ���̵�
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date bhdate;		//������ ��¥
	String bhselect;		//���� ����
	int bhlistnum;		//�������� ��ȣ (������)
	String empid;
}
