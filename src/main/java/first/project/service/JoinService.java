package first.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.project.dao.JoinDao;

@Service
public class JoinService {
	@Autowired
	JoinDao dao;
}
