package com.ewsoft.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ewsoft.dao.CustomerDao;
import com.ewsoft.dao.MenuDao;
import com.ewsoft.dao.StockDao;

@Service
public class CustomerService {

	Logger logger = Logger.getLogger(CustomerService.class);
	
	@Autowired
	private CustomerDao customerDao;
	
	/**
	 * load customer list
	 * @return
	 * @throws RuntimeException
	 */
	public List loadCustomerList() throws RuntimeException{
		List list = customerDao.fetchCustomerList();
		return list;
	}
	
}
