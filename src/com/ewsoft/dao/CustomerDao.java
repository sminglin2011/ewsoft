package com.ewsoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDao {
	
	Logger logger = Logger.getLogger(CustomerDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	/************* original field *****************/
	/**
	 * fetch customer list (original field)
	 * @return
	 */
	public List fetchCustomerList() throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select c.code, c.isCustomer, c.id, c.name, c.addPostal, c.telephone, c.fax, c.billAddress1, c.billPostal"
				+ ", c.contactPerson, c.address1, c.contactPersonEmail, c.arTerm, c.billTelephone, c.billFax"
				+ ", c.billContactPerson"
				+ " from m03company c where c.isCustomer = 'true'");
		return list;
	}
	
	/************* original field end *****************/
}
