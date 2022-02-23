package first.project.dto;

import lombok.Data;

@Data
public class boardDto {  //게시판
	String boardname;		//게시판 이름
	String boarddate;		//게시판 날짜
	String empid;			//관리자 아이디
	String inboard;			//게시글
	int boardview;			//조회수
	int boardnum;			//게시글 번호 (시퀀스)
}
