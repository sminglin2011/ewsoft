package com.ewsoft.service;

import java.util.Date;

import javax.management.RuntimeErrorException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ewsoft.dao.PurchaseRequisitionDao;
import com.ewsoft.dao.StockDao;
import com.ewsoft.dao.SupplierDao;
import com.ewsoft.domain.PR;
import com.ewsoft.domain.Stock;
import com.ewsoft.domain.Supplier;
import com.ewsoft.exception.BusinessException;
import com.ewsoft.util.DataFormat;
import com.ewsoft.util.GeneratorId;

@Service
public class PurchaserRequisitionService {

	Logger logger = Logger.getLogger(PurchaserRequisitionService.class);
	@Autowired
	private PurchaseRequisitionDao prDao;
	@Autowired
	private StockDao stockDao;
	@Autowired
	private SupplierDao supplierDao;
	
	public void savePr(PR pr)throws RuntimeException{
		Stock stock = stockDao.fetchStock(pr.getStockId());
		if(stock.getSupplierId() == null || stock.getSupplierId().equals("")) {
			throw new BusinessException("stock havne't default supplier");
		}
		Supplier supplier = supplierDao.fetchSupplier(stock.getSupplierId());
		pr.setDate(DataFormat.dateToString(new Date()));
		pr.setPrNumber(GeneratorId.generate9());
		pr.setSupplierId(supplier.getId());
		pr.setLedger(stock.getCogLedger());
		pr.setUnitOriginal(stock.getDefaultPrice());
		pr.setTerms(supplier.getApTerm());
		
		prDao.savePurchaseRequisition(pr);
		prDao.savePurchaseRequisitionDet(pr);
		logger.debug("service---------------- pr = " + pr);
		throw new RuntimeException("");
	}
	
}
