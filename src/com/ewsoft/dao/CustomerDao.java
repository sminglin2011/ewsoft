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
	/**
	 * fetch customer (original field)
	 * @return
	 */
	public Customer fetchCustomer(String customerId) throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select c.code, c.isCustomer, c.id, c.name, c.addPostal, c.telephone, c.fax, c.billAddress1, c.billPostal"
				+ ", c.contactPerson, c.address1, c.contactPersonEmail, c.arTerm, c.billTelephone, c.billFax"
				+ ", c.billContactPerson"
				+ " from m03company c where c.isCustomer = 'true'");
		Customer customer = new Customer();
		RowMapper<Customer> rowMapper = new RowMapper<Customer>() {
			public Customer mapRow(ResultSet rs, int sowNum) throws SQLException {
				Customer customer = new Customer();
				customer.setId(rs.getString("id"));
				customer.setName(rs.getString("name"));
				customer.setAddPostal(rs.getString("addPostal"));
				customer.setTelephone(rs.getString("telephone"));
				customer.setFax(rs.getString("fax"));
				customer.setBillAddress1(rs.getString("billAddress1"));
				customer.setBillPostal(rs.getString("billPostal"));
				customer.setContactPerson(rs.getString("contactPerson"));
				customer.setAddress1(rs.getString("address1"));
				customer.setContactPersonEmail(rs.getString("contactPersonEmail"));
				customer.setArTerm(rs.getString("arTerm"));
				customer.setBillTelephone(rs.getString("billTelephone"));
				customer.setBillFax(rs.getString("billFax"));
				customer.setBillContactPerson(rs.getString("billContactPerson"));
				return customer;
			}
		};
		String sql = "select c.code, c.isCustomer, c.id, c.name, c.addPostal, c.telephone, c.fax, c.billAddress1, c.billPostal"
				+ ", c.contactPerson, c.address1, c.contactPersonEmail, c.arTerm, c.billTelephone, c.billFax"
				+ ", c.billContactPerson"
				+ " from m03company c where c.isCustomer = 'true' and c.id = ?";
		customer = jdbcTemplate.queryForObject(sql, rowMapper, customerId);
		return customer;
	}
	/**
	 * save customer
	 * @throws DataAccessException
	 */
	public void saveCustomer(Customer customer) throws DataAccessException {
		jdbcTemplate.update(
				" insert into m03company (isCustomer, id, name, addPostal, telephone, fax, billAddress1, billPostal"
				+ ", contactPerson, address1, contactPersonEmail, arTerm, billTelephone, billFax, billContactPerson) values "
				+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", customer.isCustomer(), customer.getId(), customer.getName(), customer.getAddPostal()
				, customer.getTelephone(), customer.getFax(), customer.getBillAddress1(), customer.getBillPostal()
				, customer.getContactPerson(), customer.getAddress1(), customer.getContactPersonEmail(), customer.getArTerm()
				, customer.getBillTelephone(), customer.getBillFax(), customer.getBillContactPerson());
	}
	/**
	 * update customer
	 * @throws DataAccessException
	 */
	public void updateCustomer(Customer customer) throws DataAccessException {
		jdbcTemplate.update(
				" update m03company set isCustomer =?, name=?, addPostal=?, telephone=?, fax=?, billAddress1=?, billPostal=?"
				+ ", contactPerson=?, address1=?, contactPersonEmail=?, arTerm=?, billTelephone=?, billFax=?, billContactPerson=? where id=?"
						,customer.isCustomer(), customer.getName(), customer.getAddPostal()
				, customer.getTelephone(), customer.getFax(), customer.getBillAddress1(), customer.getBillPostal()
				, customer.getContactPerson(), customer.getAddress1(), customer.getContactPersonEmail(), customer.getArTerm()
				, customer.getBillTelephone(), customer.getBillFax(), customer.getBillContactPerson(), customer.getId());
	}
	/************* original field end *****************/
}
