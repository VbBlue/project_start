package first.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.project.dao.MapDao;

@Service
public class MapService {
	@Autowired
	MapDao dao;
}
