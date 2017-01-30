package com.ewsoft.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TestService {
	
	static Logger logger = Logger.getLogger(TestService.class);

	@Resource(name="jdbcTemplate")
    private JdbcTemplate jdbcTemplate;
	
	public List getList() {
		List list = null;
		String sql = "select staffid, name from m03staff";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
	
	public void saveTest() {
		String sql = "insert into m03Staff (staffid, name) values ('testid', 'test')";
		String sql1 = "insert into m03Staff (staffid, name) values (null, 'test')";
		jdbcTemplate.update(sql);
		
		jdbcTemplate.update(sql1);
		throw new RuntimeException("运行期例外");
	}

}
