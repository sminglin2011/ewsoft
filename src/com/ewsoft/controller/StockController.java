package com.ewsoft.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ewsoft.exception.BusinessException;
import com.ewsoft.service.OrderConfirmationService;
import com.ewsoft.service.StockService;
import com.ewsoft.views.JsonView;

@Controller
public class StockController extends BaseController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(StockController.class);
	@Autowired
	private StockService stockSvc;
	
	/****************************** page forward ***************************************/
	@RequestMapping(value="/backend/stockList")
    public ModelAndView ewGoToPageStockList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("online stock list!!!!!!!!!!!");
		return new ModelAndView("stock/stock-list");
	}
	/****************************** ***************************************/
	@ResponseBody
	@RequestMapping(value="/fetchStockList")
	public Object fetchStockList(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		//res.setHeader("Access-Control-Allow-Methods","POST");
		//res.setHeader("Access-Control-Allow-Headers","x-requested-with,content-type");
		logger.debug("coming !!!!!!!");
		return JsonView.Render(stockSvc.loadStockList(), res);
	}
	
	@ResponseBody
	@RequestMapping(value="/submitDefaultSupplier")
	public Object submitDefaultSupplier(ModelMap model, HttpServletResponse res, String param, String supplierId) throws Exception {
		logger.debug("param==" + param + " , supplier = " + supplierId);
		Map<String, Object> map = new HashMap<>();
		map.put("status", true);
		map.put("msg", "success");
		try {
			stockSvc.updateStockDefaultSupplier(param, supplierId);
		} catch (BusinessException e) {
			map.put("status", true);
			map.put("msg", e.getMessage());
		}
		
		return JsonView.Render(map, res);
	}
}
