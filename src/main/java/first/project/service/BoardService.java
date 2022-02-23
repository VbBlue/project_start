package first.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.project.dao.BoardDao;

@Service
public class BoardService {
	@Autowired
	BoardDao dao;

}
