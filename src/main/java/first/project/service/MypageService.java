package first.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.project.dao.MypageDao;

@Service
public class MypageService {
	@Autowired
	MypageDao dao;
}
