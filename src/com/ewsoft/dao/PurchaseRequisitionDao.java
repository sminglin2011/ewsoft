package com.ewsoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.ewsoft.domain.PR;

@Repository
public class PurchaseRequisitionDao {
	
	Logger logger = Logger.getLogger(PurchaseRequisitionDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	/************* original field *****************/
	
	/**
	 * PR header
	 * @param pr
	 * @throws DataAccessException
	 */
	public void savePurchaseRequisition(PR pr) throws DataAccessException {
		String sql = "insert into m02PurchaseRequisition (prNumber, prDate, terms, custCode, prepareByCode"
				+ ",requestedBy) values (?,?,?,?,?,?)";
		jdbcTemplate.update(sql, pr.getPrNumber(), pr.getDate(), pr.getTerms(), pr.getSupplierId(), pr.getPrepareByCode()
				, pr.getRequestedby());
	}
	public void savePurchaseRequisitionDet(PR pr) throws DataAccessException {
		String sql = "insert into m02PurchaseRequisitionDet (prNumber, subCode, quantityOrder, unitMs"
				+ ", unitOriginal, refType, ledger) values (?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, pr.getPrNumber(), pr.getDate(), pr.getTerms(), pr.getSupplierId(), pr.getPrepareByCode()
				, pr.getRequestedby());
	}
	/************* original field end *****************/
}
