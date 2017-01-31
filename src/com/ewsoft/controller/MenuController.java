package com.ewsoft.controller;

import java.util.List;

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
public class MenuController extends BaseController{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	Logger logger = Logger.getLogger(MenuController.class);
	
	@Autowired
	private MenuService menuSvc;
	

	/****************************** page forward ***************************************/
	@RequestMapping(value="/backend/menuSetup")
    public ModelAndView ewGoToPageMenuSetup(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("menu-setup!!!!!!!!!!!");
		return new ModelAndView("menu/menu-setup");
	}
	@RequestMapping(value="/backend/menuGroupList")
    public ModelAndView ewGoToPageMenuGroup(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("menu-group-list!!!!!!!!!!!");
		return new ModelAndView("menu/menu-group-list");
	}
	@RequestMapping(value="/backend/menuList")
    public ModelAndView ewGoToPageMenuList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("menu-list!!!!!!!!!!!");
		return new ModelAndView("menu/menu-list");
	}
	@RequestMapping(value="/backend/menuItemList")
    public ModelAndView ewGoToPageMenuItemList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("menu-item-list!!!!!!!!!!!");
		return new ModelAndView("menu/menu-item-list");
	}
	@RequestMapping(value="/backend/menuItemGroupList")
    public ModelAndView ewGoToPageMenuItemGroupList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("menu-item-group-list!!!!!!!!!!!");
		return new ModelAndView("menu/menu-item-group-list");
	}
	@RequestMapping(value="/backend/allMenuItem")
    public ModelAndView ewGoToPageAllMenuItem(HttpServletRequest request, HttpServletResponse response) throws Exception{
		logger.debug("menu-item-group-list!!!!!!!!!!!");
		return new ModelAndView("menu/all-menu-item");
	}
	/****************************** fetch data or update ***************************************/
	@ResponseBody
	@RequestMapping(value="/fetchMenuGroupList")
	public Object fetchMenuGroupList(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		//res.setHeader("Access-Control-Allow-Methods","POST");
		//res.setHeader("Access-Control-Allow-Headers","x-requested-with,content-type");
		log.debug("coming !!!!!!!");
		return JsonView.Render(menuSvc.loadMenuGroupList(), res);
	}
	@ResponseBody
	@RequestMapping(value="/fetchMenuListByMenuGroupId")
	public Object fetchMenuListByMenuGroupId(ModelMap model, HttpServletResponse res, String menuGroupId) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(menuSvc.loadMenuListByMenuGroupId(menuGroupId), res);
	}
	@ResponseBody
	@RequestMapping(value="/fetchMenuItemGroupListByMenuIdAndMenuGroupId")
	public Object fetchMenuItemGroupListByMenuIdAndMenuGroupId(ModelMap model, HttpServletResponse res
			, String menuId, String menuGroupId) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(menuSvc.loadMenuItemGroupListByMenuIdAndMenuGroupId(menuGroupId, menuId), res);
	}
	@ResponseBody
	@RequestMapping(value="/fetchMenuItemListByMenuIdAndMenuGroupId")
	public Object fetchMenuItemListByMenuIdAndMenuGroupId(ModelMap model, HttpServletResponse res
			, String menuId, String menuGroupId) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(menuSvc.loadMenuItemListByMenuIdAndMenuGroupId(menuGroupId, menuId), res);
	}
	@ResponseBody
	@RequestMapping(value="/fetchAllMenu")
	public Object fetchAllMenu(ModelMap model, HttpServletResponse res) throws Exception {
		List list = menuSvc.loadMenuList();
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!! all menu = " + list);
		return JsonView.Render(list, res);
	}
	@ResponseBody
	@RequestMapping(value="/fetchAllMenuItemGroup")
	public Object fetchAllMenuItemGroup(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(menuSvc.loadAllMenuItemGroup(), res);
	}
	@ResponseBody
	@RequestMapping(value="/fetchAllMenuItem")
	public Object fetchAllMenuItem(ModelMap model, HttpServletResponse res) throws Exception {
		res.setHeader("Access-Control-Allow-Origin", "*");
		log.debug("coming !!!!!!!");
		return JsonView.Render(menuSvc.loadMenuItemList(), res);
	}
	
	
}
