package com.ewsoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

//@Repository
public class _bankDao {
	
	Logger logger = Logger.getLogger(_bankDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	/************* original field *****************/
	/**
	 * fetch stock list (original field)
	 * @return
	 */
	public List fetchStockList() throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select s.code, s.stockId, s.descrip1, s.oriDesc, s.menuItem as isMenuItem, b.foodItems, b.equipment, b.ingredients"
				+ ", b.disposables, b.condiments, b.cutlery"
				+ " from m14stock s left join m14stock_ext01 b on s.stockId = b.stockId");
		return list;
	}
	
	/************* original field end *****************/
}
