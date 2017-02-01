package com.ewsoft.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ewsoft.dao.CustomerDao;
import com.ewsoft.dao.MenuDao;
import com.ewsoft.dao.StockDao;
import com.ewsoft.domain.Customer;
import com.ewsoft.util.GeneratorId;

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
	/**
	 * load customer
	 * @param customerId
	 * @return
	 * @throws RuntimeException
	 */
	public Customer loadCustomer(String customerId) throws RuntimeException {
		return customerDao.fetchCustomerList(customerId);
	}
	/**
	 * save Customer
	 * @param customer
	 * @return
	 */
	public Customer saveCustomer(Customer customer) throws RuntimeException{
		logger.debug("Customer Id here ==" + customer.getId());
		if (customer.getId() != null && !customer.getId().equals("")){
			customerDao.updateCustomer(customer);
		} else {
			customer.setId(GeneratorId.generate9());
			customerDao.saveCustomer(customer);
		}
		return customer;
	}
}
