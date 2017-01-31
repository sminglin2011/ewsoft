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
import com.ewsoft.service.SystemService;
import com.ewsoft.views.JsonView;

@Controller
public class OrderConfirmationController extends BaseController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(OrderConfirmationController.class);
	@Autowired
	private OrderConfirmationService orderSvc;
	@Autowired
	private SystemService timeSheetSvc;
	
	/****************************** page forward ***************************************/
	@RequestMapping(value="/backend/orderList")
    public ModelAndView ewGoToPageOrderList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("online ordering!!!!!!!!!!!");
		return new ModelAndView("order/order-list");
	}
	@RequestMapping(value="/backend/orderNew")
    public ModelAndView ewGoToPageOrderNew(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("online ordering!!!!!!!!!!!");
		return new ModelAndView("order/order-new");
	}
	/****************************** ***************************************/
	@ResponseBody
	@RequestMapping(value="/fetchOrderConfrimationList")
	public Object fetchOrderConfrimationList(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		//res.setHeader("Access-Control-Allow-Methods","POST");
		//res.setHeader("Access-Control-Allow-Headers","x-requested-with,content-type");
		log.debug("coming !!!!!!!");
		return JsonView.Render(orderSvc.loadOrderConfirmationByKeyword(""), res);
	}
	@ResponseBody
	@RequestMapping(value="/fetchTimeSheet")
	public Object fetchTimeSheet(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(timeSheetSvc.loadTimeSheet(), res);
	}
}
