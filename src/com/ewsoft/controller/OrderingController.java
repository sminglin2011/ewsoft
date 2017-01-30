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

import com.ewsoft.service.MenuService;
import com.ewsoft.views.JsonView;

@Controller
public class OrderingController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	Logger logger = Logger.getLogger(OrderingController.class);
	@Autowired
	private MenuService menuSvc;
	
	/****************************** page forward ***************************************/
	@RequestMapping(value="/online/ordering")
    public ModelAndView ewGoToPageOrdering(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("online ordering!!!!!!!!!!!");
		return new ModelAndView("online/ordering");
	}
	@RequestMapping(value="/online/orderingMenu")
    public ModelAndView ewGoToPageOrderingMenu(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("online ordering!!!!!!!!!!!");
		return new ModelAndView("online/ordering-menu");
	}
	@RequestMapping(value="/online/orderingMenuItem")
    public ModelAndView ewGoToPageOrderingMenuItem(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("online ordering!!!!!!!!!!!");
		return new ModelAndView("online/ordering-menu-item");
	}

	/****************/
	@ResponseBody
	@RequestMapping(value="/onlineFetchMenuGroupList")
	public Object fetchMenuGroupList(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		//res.setHeader("Access-Control-Allow-Methods","POST");
		//res.setHeader("Access-Control-Allow-Headers","x-requested-with,content-type");
		log.debug("coming !!!!!!!");
		return JsonView.Render(menuSvc.loadMenuGroupList(), res);
	}
	@ResponseBody
	@RequestMapping(value="/onlineFetchMenuListByMenuGroupId")
	public Object fetchMenuListByMenuGroupId(ModelMap model, HttpServletResponse res, String menuGroupId) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(menuSvc.loadMenuListByMenuGroupId(menuGroupId), res);
	}
	@ResponseBody
	@RequestMapping(value="/onlineFetchMenuItemGroupListByMenuIdAndMenuGroupId")
	public Object fetchMenuItemGroupListByMenuIdAndMenuGroupId(ModelMap model, HttpServletResponse res
			, String menuId, String menuGroupId) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(menuSvc.loadMenuItemGroupListByMenuIdAndMenuGroupId(menuGroupId, menuId), res);
	}
	@ResponseBody
	@RequestMapping(value="/onlineFetchMenuItemListByMenuIdAndMenuGroupId")
	public Object fetchMenuItemListByMenuIdAndMenuGroupId(ModelMap model, HttpServletResponse res
			, String menuId, String menuGroupId) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(menuSvc.loadMenuItemListByMenuIdAndMenuGroupId(menuGroupId, menuId), res);
	}
}
