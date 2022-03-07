package first.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.dao.DataAccessException;

import first.project.dto.boardDto;


@Mapper
public interface BoardDao {
  public List<boardDto> listBoard(); //리스트
  public boardDto viewBoard(int n); //상세보기
  public int insertBoard(boardDto dept) throws DataAccessException; //작성
  public void update(boardDto dept); //수정
  public void deleteBoard(int no); //삭제
  public int updateView(int no); //조회수
}
