package com.ewsoft.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ewsoft.dao.MenuDao;
import com.ewsoft.dao.StockDao;
import com.ewsoft.dao.SupplierDao;

@Service
public class SupplierService {

	Logger logger = Logger.getLogger(SupplierService.class);
	
	@Autowired
	private SupplierDao supplierDao;
	
	/**
	 * load supplier list
	 * @return
	 * @throws RuntimeException
	 */
	public List loadSupplierList() throws RuntimeException{
		List list = supplierDao.fetchSupplierList();
		return list;
	}
	
}
