package com.ewsoft.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ewsoft.dao.OrderConfirmationDao;
import com.ewsoft.domain.DeliveryOrder;

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
	
	public List loadCollectionOrderList(String keyword) throws RuntimeException {
		if (keyword == null) keyword = "";
		List list = orderDao.fetchCollectionOrderList();
		return list;
	}
	
	public List loadDeliveryOrderList(String keyword) throws RuntimeException {
		if (keyword == null) keyword = "";
		List list = orderDao.fetchDeliveryOrderList();
		return list;
	}
	
	public DeliveryOrder loadDeliveryOrder(String soNumber) throws RuntimeException {
		
		DeliveryOrder deliveryOrder = new DeliveryOrder();
		deliveryOrder = orderDao.fetchDeliveryOrder(soNumber);
		List deliveryOrderDetails = orderDao.fetchDeliveryOrderDetails(soNumber);
		deliveryOrder.setDeliveryOrderDetails(deliveryOrderDetails);
		return deliveryOrder;
	}
}
