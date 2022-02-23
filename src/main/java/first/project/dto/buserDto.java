package first.project.dto;

import lombok.Data;

@Data
public class buserDto {
	String userid;			//���̵�
	String userpw;			//��й�ȣ
	String username;		//�̸�
	String userphone;		//��ȭ��ȣ
	String useremail;		//�̸���
	String userbtype;		//������
	String userbirth;		//�������
	String useraddr;		//�ּ�
	int bcount;				//����Ƚ��
	int point;				//����Ʈ
	public buserDto(String userid, String userpw, String username, String userphone, String useremail, String userbtype,
			String userbirth, String useraddr, int bcount, int point) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userphone = userphone;
		this.useremail = useremail;
		this.userbtype = userbtype;
		this.userbirth = userbirth;
		this.useraddr = useraddr;
		this.bcount = bcount;
		this.point = point;
	}
	public buserDto() {
	}
	
	
	
}
