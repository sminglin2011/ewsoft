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
import com.ewsoft.domain.Supplier;

@Repository
public class SupplierDao {
	
	Logger logger = Logger.getLogger(SupplierDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	/************* original field *****************/
	/**
	 * fetch supplier list (original field)
	 * @return
	 */
	public List fetchSupplierList() throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select c.code, c.isSupplier, c.id, c.name, c.addPostal, c.telephone, c.fax, c.billAddress1, c.billPostal"
				+ ", c.contactPerson, c.address1, c.contactPersonEmail, c.apTerm, c.billTelephone, c.billFax"
				+ ", c.billContactPerson"
				+ " from m03company c where c.isSupplier = 'true'");
		return list;
	}
	/**
	 * fetch customer (original field)
	 * @return
	 */
	public Supplier fetchSupplier(String supplierId) throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select c.code, c.isSupplier, c.id, c.name, c.addPostal, c.telephone, c.fax, c.billAddress1, c.billPostal"
				+ ", c.contactPerson, c.address1, c.contactPersonEmail, c.apTerm, c.billTelephone, c.billFax"
				+ ", c.billContactPerson"
				+ " from m03company c where c.isSupplier = 'true'");
		Supplier supplier = new Supplier();
		RowMapper<Supplier> rowMapper = new RowMapper<Supplier>() {
			public Supplier mapRow(ResultSet rs, int sowNum) throws SQLException {
				Supplier supplier = new Supplier();
				supplier.setId(rs.getString("id"));
				supplier.setName(rs.getString("name"));
				supplier.setAddPostal(rs.getString("addPostal"));
				supplier.setTelephone(rs.getString("telephone"));
				supplier.setFax(rs.getString("fax"));
				supplier.setBillAddress1(rs.getString("billAddress1"));
				supplier.setBillPostal(rs.getString("billPostal"));
				supplier.setContactPerson(rs.getString("contactPerson"));
				supplier.setAddress1(rs.getString("address1"));
				supplier.setContactPersonEmail(rs.getString("contactPersonEmail"));
				supplier.setApTerm(rs.getString("apTerm"));
				supplier.setBillTelephone(rs.getString("billTelephone"));
				supplier.setBillFax(rs.getString("billFax"));
				supplier.setBillContactPerson(rs.getString("billContactPerson"));
				return supplier;
			}
		};
		String sql = "select c.code, c.isSupplier, c.id, c.name, c.addPostal, c.telephone, c.fax, c.billAddress1, c.billPostal"
				+ ", c.contactPerson, c.address1, c.contactPersonEmail, c.apTerm, c.billTelephone, c.billFax"
				+ ", c.billContactPerson"
				+ " from m03company c where c.isSupplier = 'true' and c.id = ?";
		supplier = jdbcTemplate.queryForObject(sql, rowMapper, supplierId);
		return supplier;
	}
	/**
	 * save supplier
	 * @throws DataAccessException
	 */
	public void saveSupplier(Supplier supplier) throws DataAccessException {
		jdbcTemplate.update(
				" insert into m03company (isSupplier, id, name, addPostal, telephone, fax, billAddress1, billPostal"
				+ ", contactPerson, address1, contactPersonEmail, apTerm, billTelephone, billFax, billContactPerson) values "
				+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", supplier.isSupplier(), supplier.getId(), supplier.getName(), supplier.getAddPostal()
				, supplier.getTelephone(), supplier.getFax(), supplier.getBillAddress1(), supplier.getBillPostal()
				, supplier.getContactPerson(), supplier.getAddress1(), supplier.getContactPersonEmail(), supplier.getApTerm()
				, supplier.getBillTelephone(), supplier.getBillFax(), supplier.getBillContactPerson());
	}
	/**
	 * update supplier
	 * @throws DataAccessException
	 */
	public void updateSupplier(Supplier supplier) throws DataAccessException {
		jdbcTemplate.update(
				" update m03company set isSupplier =?, name=?, addPostal=?, telephone=?, fax=?, billAddress1=?, billPostal=?"
				+ ", contactPerson=?, address1=?, contactPersonEmail=?, apTerm=?, billTelephone=?, billFax=?, billContactPerson=? where id=?"
						,supplier.isSupplier(), supplier.getName(), supplier.getAddPostal()
				, supplier.getTelephone(), supplier.getFax(), supplier.getBillAddress1(), supplier.getBillPostal()
				, supplier.getContactPerson(), supplier.getAddress1(), supplier.getContactPersonEmail(), supplier.getApTerm()
				, supplier.getBillTelephone(), supplier.getBillFax(), supplier.getBillContactPerson(), supplier.getId());
	}
	/************* original field end *****************/
}
