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

@Controller
public class DeliveryAppController extends BaseController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(DeliveryAppController.class);
	@Autowired
	private OrderConfirmationService soSvc;
	
	/****************************** page forward ***************************************/
	@RequestMapping(value="/orderDeliveryList")
    public ModelAndView ewGoToPageStockList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return new ModelAndView("online/order-delivery-list");
	}
	@RequestMapping(value="/orderDeliveryDetails")
    public ModelAndView orderDeliveryDetails(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return new ModelAndView("online/order-delivery-details");
	}
	/****************************** ***************************************/
	@ResponseBody
	@RequestMapping(value="/fetchOrderDeliveryList")
	public Object fetchOrderDeliveryList(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(soSvc.loadDeliveryOrderList(""), res);
	}
	@ResponseBody
	@RequestMapping(value="/fetchOrderDelivery")
	public Object fetchOrderDelivery(ModelMap model, HttpServletResponse res, String soNumber) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!" + soNumber);
		return JsonView.Render(soSvc.loadDeliveryOrder(soNumber), res);
	}
}
