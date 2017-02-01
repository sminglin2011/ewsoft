package com.ewsoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SystemDao {
	
	Logger logger = Logger.getLogger(SystemDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	/************* original field *****************/
	/**
	 * fetch time sheet (original field)
	 * @return
	 */
	public List fetchTiemShee() throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select a.time, a.blocked from m33time a");
		return list;
	}
	
	public String getNumberPrefix(String parameterConstant) throws DataAccessException {
		return jdbcTemplate.queryForObject("select value from m07Parameter where Name= ? ", new Object[] { parameterConstant }, String.class);
	}
	/************* original field end *****************/
}
