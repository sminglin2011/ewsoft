package com.ewsoft.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ewsoft.dao.MenuDao;
import com.ewsoft.dao.StockDao;

@Service
public class StockService {

	Logger logger = Logger.getLogger(StockService.class);
	
	@Autowired
	private StockDao stockDao;
	
	/**
	 * load stock list
	 * @return
	 * @throws RuntimeException
	 */
	public List loadStockList() throws RuntimeException{
		List list = stockDao.fetchStockList();
		return list;
	}
	
	public void updateStockDefaultSupplier(String stockIds, String supplierId) {
		stockDao.updateStockDefaulSupplier(stockIds, supplierId);
	}
}
