package first.project.dto;

import java.util.Date;

import lombok.Data;

@Data
public class bloodlist { //��������
	String bhname;		//�������� �̸�
	String userid;		//����� ���̵�
	Date bhdate;		//������ ��¥
	String bhselect;		//���� ����
	int bhlistnum;		//�������� ��ȣ (������)
}
