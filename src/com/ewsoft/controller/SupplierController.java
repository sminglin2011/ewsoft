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
import com.ewsoft.service.SupplierService;
import com.ewsoft.views.JsonView;

@Controller
public class SupplierController extends BaseController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(SupplierController.class);
	@Autowired
	private SupplierService supplierSvc;
	
	/****************************** page forward ***************************************/
	@RequestMapping(value="/backend/supplierList")
    public ModelAndView ewGoToPageSupplierList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return new ModelAndView("supplier/supplier-list");
	}
	/****************************** ***************************************/
	@ResponseBody
	@RequestMapping(value="/fetchSupplierList")
	public Object fetchSupplierList(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(supplierSvc.loadSupplierList(), res);
	}
}
