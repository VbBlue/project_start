package first.project.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import first.project.dto.bloodlist;
import first.project.dto.buserDto;
import first.project.dto.goodslist;
import first.project.dto.reservation;

@Mapper
public interface MypageDao {
	List<bloodlist> bloodlist(Map map);
	List<goodslist> goodslist(Map map);
	int updatebuser(buserDto dto);
	int deleteuser(String userid);
	reservation reserv_stat(String userid);
	int updateReservation(reservation dto);
	int deleteReservation(reservation dto);
	bloodlist last_bhdate(String userid);
	int goodslist_count(Map map);
	int blist_count(String userid);
}
