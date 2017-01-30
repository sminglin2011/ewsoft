package com.ewsoft.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ewsoft.dao.OrderConfirmationDao;

@Service
public class OrderConfirmationService {
	Logger logger = Logger.getLogger(OrderConfirmationService.class);
	
	@Autowired
	private OrderConfirmationDao orderDao;
	
	public List loadOrderConfirmationByKeyword(String keyword) throws RuntimeException {
		if (keyword == null) keyword = "";
		List list = orderDao.keywordFetchSoList(keyword);
		return list;
	}
}
