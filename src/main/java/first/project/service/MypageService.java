package first.project.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.project.dao.MypageDao;
import first.project.dto.bloodlist;
import first.project.dto.buserDto;
import first.project.dto.goodslist;
import first.project.dto.reservation;

@Service
public class MypageService {
	@Autowired
	MypageDao dao;
	
	public List<bloodlist> bloodlist(Map map) {
		return dao.bloodlist(map);
	}
	
	public List<goodslist> goodslist(Map map) {
		return dao.goodslist(map);
	}
	
	public int updatebuser_pw(buserDto dto) {
		return dao.updatebuser_pw(dto);
	}
	public int updatebuser_ph(buserDto dto) {
		return dao.updatebuser_ph(dto);
	}
	public int updatebuser_em(buserDto dto) {
		return dao.updatebuser_em(dto);
	}
	public int updatebuser_bt(buserDto dto) {
		return dao.updatebuser_bt(dto);
	}
	public int updatebuser_ad(buserDto dto) {
		return dao.updatebuser_ad(dto);
	}
	
	public int deleteuser(String userid) {
		return dao.deleteuser(userid);
	}
	
	public reservation reserv_stat(String userid) {
		return dao.reserv_stat(userid);
	}
	
	public int updateReservation(reservation dto) {
		return dao.updateReservation(dto);
	}
	
	public int deleteReservation(reservation dto) {
		return dao.deleteReservation(dto);
	}
	
	public bloodlist last_bhdate(String userid) {
		return dao.last_bhdate(userid);
	}
	
	public int goodslist_count(Map map) {
		return dao.goodslist_count(map);
	}
	
	public int blist_count(String userid) {
		return dao.blist_count(userid);
	}
}
