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
	
	/**
	 * 加载 order confirmation 列表 查询 keyword
	 * @param keyword
	 * @return
	 * @throws RuntimeException
	 */
	public List loadOrderConfirmationByKeyword(String keyword) throws RuntimeException {
		if (keyword == null) keyword = "";
		List list = orderDao.keywordFetchSoList(keyword);
		return list;
	}
	
	/**
	 * 加载collection order listing
	 * @param keyword
	 * @return
	 * @throws RuntimeException
	 */
	public List loadCollectionOrderList(String keyword) throws RuntimeException {
		if (keyword == null) keyword = "";
		List list = orderDao.fetchCollectionOrderList(keyword);
		return list;
	}
	
	/**
	 * 加载 delivery order listing
	 * @param keyword
	 * @return
	 * @throws RuntimeException
	 */
	public List loadDeliveryOrderList(String keyword) throws RuntimeException {
		if (keyword == null) keyword = "";
		List list = orderDao.fetchDeliveryOrderList(keyword);
		return list;
	}
	
	/**
	 * 加载 delivery order 详情
	 * @param soNumber
	 * @return
	 * @throws RuntimeException
	 */
	public DeliveryOrder loadDeliveryOrder(String soNumber) throws RuntimeException {
		DeliveryOrder deliveryOrder = new DeliveryOrder();
		deliveryOrder = orderDao.fetchDeliveryOrder(soNumber);
		List deliveryOrderDetails = orderDao.fetchDeliveryOrderDetails(soNumber);
		deliveryOrder.setDeliveryOrderDetails(deliveryOrderDetails);
		return deliveryOrder;
	}
}
