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
	
	/**
	 * fetch vehicle listing
	 * @return
	 * @throws DataAccessException
	 */
	public List fetchVehicleList() throws DataAccessException {
		return jdbcTemplate.queryForList("select v.assetRegNo as vehicleNo from m09asset");
	}
	
	public boolean fetchVehicleByvehicleNoForDeliveryApp(String vehicleNo) {
		String sql = "select count(assetRegNo) from m09asset where assetRegNo = ?";
		Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
		if (count == 0) return false;
		else return true;
	}
	/************* original field end *****************/
}
