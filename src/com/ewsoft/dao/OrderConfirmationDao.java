package com.ewsoft.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.ewsoft.domain.DeliveryOrder;
import com.ewsoft.domain.DeliveryOrderDetails;
import com.ewsoft.domain.Stock;
import com.ewsoft.util.DataFormat;

@Repository
public class OrderConfirmationDao {

	Logger logger = Logger.getLogger(OrderConfirmationDao.class);
	
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * fetch original field
	 * @param keyword
	 * @return
	 * @throws Exception
	 */
	public List keywordFetchSoList(String keyword) throws DataAccessException {
		List list = null;
		String sql = "select distinct(a.soNumber), a.code, a.docType, a.soDate, a.billStatus, a.postStatus, a.deliverStatus"
				+ ", a.referenceOur, a.referenceYour, a.terms, a.termsDay, a.incoTerm, a.custCode, a.custAttention"
				+ ", a.custName, a.custAddPostal, a.custAddCountry, a.custTelephone, a.custAddress1, a.dueDate"
				+ ", a.valueOriginal, a.billOriginal, a.balanceOriginal, a.totalQuantity"
				+ ", a.deliveryComments, a.cst, a.kst, a.pst, a.dst, a.poNo, a.eventDate, a.eventTime, a.deliveryDate"
				+ ", a.deliveryTime, a.collectionDate, a.collectionTime, a.noPax, a.payType, a.mainSoNo"
				+ ", a.delYN, a.colYN , a.invNo"
				+ " from m02So a left join m02Sodet b on a.sonumber = b.sonumber"
				+ " where a.soNumber like '%"+keyword+"%' or a.custName like '%"+keyword+"%'"
						+ " or a.deliveryComments like '%"+keyword+"%' or a.eventDate like '%"+keyword+"%'"
								+ " or a.deliveryDate like '%"+keyword+"%' or a.collectionDate like '%"+keyword+"%'"
										+ " or a.payType like '%"+keyword+"%' or a.invNo like '%"+keyword+"%'"
												+ " or b.mainRefCode like '%"+keyword+"%' or b.refType like '%"+keyword+"%'"
														+ " or b.description like '%"+keyword+"%'";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
	/**
	 * for delivery App delivery order listing
	 * @return
	 * @throws DataAccessException
	 */
	public List fetchDeliveryOrderList() throws DataAccessException {
		List list = null;
		String sql = "select distinct(a.soNumber), (select sum(valueOriginal) from IEATZ2015.dbo.m02Sodet where sonumber = a.SoNumber) as orderAmount"
				+ ", a.code, a.docType, a.soDate, a.billStatus, a.postStatus, a.deliverStatus"
				+ ", a.referenceOur, a.referenceYour, a.terms, a.termsDay, a.incoTerm, a.custCode, a.custAttention"
				+ ", a.custName, a.custAddPostal, a.custAddCountry, a.custTelephone, a.custAddress1, a.dueDate"
				+ ", a.valueOriginal, a.billOriginal, a.balanceOriginal, a.totalQuantity"
				+ ", a.deliveryComments, a.cst, a.kst, a.pst, a.dst, a.poNo, a.eventDate, a.eventTime, a.deliveryDate"
				+ ", a.deliveryTime, a.collectionDate, a.collectionTime, a.noPax, a.payType, a.mainSoNo"
				+ ", a.delYN, a.colYN , a.invNo, a.schDelTime, a.schDelDate, a.custDelAtt"
				+ " from m02So a "
				+ " where a.SchDelTime != '' and a.postStatus = 'P' and a.delYN ='1' and a.schDelDate >='"+DataFormat.dateToString(new Date())+"'" 
				+ " order by a.SchDelDate  desc, a.SchDelTime asc";
		list = jdbcTemplate.queryForList(sql);
		return list;
	}
	
	public DeliveryOrder fetchDeliveryOrder(String soNumber) throws DataAccessException {
		RowMapper<DeliveryOrder> rowMapper = new RowMapper<DeliveryOrder>() {
			public DeliveryOrder mapRow(ResultSet rs, int sowNum) throws SQLException {
				DeliveryOrder obj = new DeliveryOrder();
				obj.setCustCode(rs.getString("custCode"));
				obj.setCustDelAtt(rs.getString("custDelAtt"));
				obj.setCustName(rs.getString("custName"));
				obj.setDeliveryStatus(rs.getString("deliverStatus"));
				obj.setNoPax(rs.getString("noPax"));
				obj.setPayType(rs.getString("payType"));
				obj.setSchDelDate(rs.getString("schDelDate"));
				obj.setSchDelTime(rs.getString("schDelTime"));
				obj.setSoNumber(rs.getString("soNumber"));
				return obj;
			}
		};
		return jdbcTemplate.queryForObject("select a.soNumber, (select sum(valueOriginal) from IEATZ2015.dbo.m02Sodet where sonumber = a.SoNumber) as orderAmount"
				+ ", a.code, a.docType, a.soDate, a.billStatus, a.postStatus, a.deliverStatus"
				+ ", a.referenceOur, a.referenceYour, a.terms, a.termsDay, a.incoTerm, a.custCode, a.custAttention"
				+ ", a.custName, a.custAddPostal, a.custAddCountry, a.custTelephone, a.custAddress1, a.dueDate"
				+ ", a.valueOriginal, a.billOriginal, a.balanceOriginal, a.totalQuantity"
				+ ", a.deliveryComments, a.cst, a.kst, a.pst, a.dst, a.poNo, a.eventDate, a.eventTime, a.deliveryDate"
				+ ", a.deliveryTime, a.collectionDate, a.collectionTime, a.noPax, a.payType, a.mainSoNo"
				+ ", a.delYN, a.colYN , a.invNo, a.schDelTime, a.schDelDate, a.custDelAtt"
				+ " from m02So a where a.soNumber = ? ", rowMapper, soNumber);
	}
	
	public List fetchDeliveryOrderDetails (String soNumber) throws DataAccessException {
//		RowMapper<DeliveryOrderDetails> rowMapper = new RowMapper<DeliveryOrderDetails>() {
//			public DeliveryOrderDetails mapRow(ResultSet rs, int sowNum) throws SQLException {
//				DeliveryOrderDetails obj = new DeliveryOrderDetails();
//				obj.setDescription(rs.getString("description"));
//				obj.setNoPax(rs.getString("col"));
//				obj.setQuantityOrder(rs.getString("quantityOrder"));
//				obj.setRefType(rs.getString("refType"));
//				obj.setSequence(rs.getString("sequence"));
//				obj.setSubType(rs.getString("subType"));
//				obj.setUnitMs(rs.getString("unitMs"));
//				obj.setValueOriginal(rs.getDouble("valueOriginal"));
//				obj.setSoNumber(rs.getString("soNumber"));
//				return obj;
//			}
//		};
		return jdbcTemplate.queryForList("select b.soNumber, b.description, b.col1, b.quantityOrder, b.refType, b.sequence"
				+ ", b.subType, b.unitMs, b.valueOriginal from m02Sodet b where b.soNumber = ?", soNumber);
	}
}
