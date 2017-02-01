package com.ewsoft.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ewsoft.domain.Customer;
import com.ewsoft.domain.Stock;

@Repository
public class StockDao {
	
	Logger logger = Logger.getLogger(StockDao.class);

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
				+ ", b.disposables, b.condiments, b.cutlery, s.cgldgr as cogLedger"
				+ " from m14stock s left join m14stock_ext01 b on s.stockId = b.stockId");
		return list;
	}
	
	/**
	 * fetch Stock 
	 * @param stockId
	 * @return
	 * @throws DataAccessException
	 */
	public Stock fetchStock(String stockId) throws DataAccessException {
		Stock stock = new Stock();
		RowMapper<Stock> rowMapper = new RowMapper<Stock>() {
			public Stock mapRow(ResultSet rs, int sowNum) throws SQLException {
				Stock obj = new Stock();
				obj.setStockId(rs.getString("stockId"));
				obj.setSupplierId(rs.getString("supplier"));
				obj.setDefaultPrice(rs.getDouble("lstslspr"));
				obj.setCogLedger(rs.getString("cgldgr"));
				return obj;
			}
		};
		return stock;
	}
	
	/**
	 * update stock default supplier 
	 * @param stockIds
	 * @param supplierId
	 */
	public void updateStockDefaulSupplier(String stockIds, String supplierId) {
		String sql = "update m14Stock set supplier = '" + supplierId + "' where code in ("+stockIds+")";
		jdbcTemplate.update(sql);
	}
	/************* original field end *****************/
}
