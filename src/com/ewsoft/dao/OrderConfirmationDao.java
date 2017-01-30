package com.ewsoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
}
