package com.ewsoft.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ewsoft.service.OrderConfirmationService;
import com.ewsoft.service.StockService;
import com.ewsoft.views.JsonView;

//@Controller
public class _bankController extends BaseController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(_bankController.class);
//	@Autowired
	private StockService stockSvc;
	
	/****************************** page forward ***************************************/
//	@RequestMapping(value="/stock/stockList")
    public ModelAndView ewGoToPageStockList(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		logger.debug("online stock list!!!!!!!!!!!");
		return new ModelAndView("stock/stock-list");
	}
	/****************************** ***************************************/
//	@ResponseBody
//	@RequestMapping(value="/fetchStockList")
	public Object fetchStockList(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(stockSvc.loadStockList(), res);
	}
}
