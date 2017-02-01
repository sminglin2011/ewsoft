package com.ewsoft.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ewsoft.domain.PR;
import com.ewsoft.exception.BusinessException;
import com.ewsoft.service.OrderConfirmationService;
import com.ewsoft.service.PurchaserRequisitionService;
import com.ewsoft.service.StockService;
import com.ewsoft.views.JsonView;

@Controller
public class PurchaseRequisitionController extends BaseController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(PurchaseRequisitionController.class);
	@Autowired
	private PurchaserRequisitionService prSvc;
	
	/****************************** page forward ***************************************/
	@RequestMapping(value="/backend/purchaseRequest")
    public ModelAndView ewGoToPageStockList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return new ModelAndView("purchase/purchase-request");
	}
	/****************************** ***************************************/
	@ResponseBody
	@RequestMapping(value="/submitPR")
	public Object fetchStockList(ModelMap model, HttpServletResponse res, @RequestBody PR pr) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!" + pr);
		Map<String, Object> map = new HashMap<>();
		map.put("status", true);
		map.put("msg", "success");
		try {
			prSvc.savePr(pr);
		} catch (BusinessException e) {
			map.put("status", false);
			map.put("msg", e.getMessage());
		} catch (Exception e) {
			throw e;
		}
		
		return JsonView.Render(map, res);
	}
}
