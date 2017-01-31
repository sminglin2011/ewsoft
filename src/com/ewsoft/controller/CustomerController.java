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

import com.ewsoft.service.CustomerService;
import com.ewsoft.service.OrderConfirmationService;
import com.ewsoft.service.StockService;
import com.ewsoft.views.JsonView;

@Controller
public class CustomerController extends BaseController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(CustomerController.class);
	@Autowired
	private CustomerService customerSvc;
	
	/****************************** page forward ***************************************/
	@RequestMapping(value="/backend/customerList")
    public ModelAndView ewGoToPageCustomerList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return new ModelAndView("customer/customer-list");
	}
	@RequestMapping(value="/backend/customerNew")
    public ModelAndView ewGoToPageCustomerNew(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return new ModelAndView("customer/customer-new");
	}
	/****************************** ***************************************/
	@ResponseBody
	@RequestMapping(value="/fetchCustomerList")
	public Object fetchCustomerList(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(customerSvc.loadCustomerList(), res);
	}
}
