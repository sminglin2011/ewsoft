package com.ewsoft.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ewsoft.dao.MenuDao;
import com.ewsoft.dao.StockDao;
import com.ewsoft.dao.SystemDao;

@Service
public class SystemService {

	Logger logger = Logger.getLogger(SystemService.class);
	
	@Autowired
	private SystemDao systemDao;
	
	/**
	 * load Time Sheet
	 * @return
	 * @throws RuntimeException
	 */
	public List loadTimeSheet() throws RuntimeException{
		List list = systemDao.fetchTiemShee();
		return list;
	}
	
	/**
	 * 加载 vehicle listing
	 * @return
	 * @throws RuntimeException
	 */
	public List loadVehicleList() throws RuntimeException {
		List list = systemDao.fetchVehicleList();
		return list;
	}
	
	public boolean deliveryAppLoginByVehicleNo(String vehicleNo) {
		return systemDao.fetchVehicleByvehicleNoForDeliveryApp(vehicleNo);
	}
}
