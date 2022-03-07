package first.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.dao.DataAccessException;

import first.project.dto.boardDto;


@Mapper
public interface BoardDao {
  public List<boardDto> listBoard(); //����Ʈ
  public boardDto viewBoard(int n); //�󼼺���
  public int insertBoard(boardDto dept) throws DataAccessException; //�ۼ�
  public void update(boardDto dept); //����
  public void deleteBoard(int no); //����
  public int updateView(int no); //��ȸ��
}
