package com.ewsoft.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ewsoft.dao.MenuDao;

@Service
public class MenuService {

	Logger logger = Logger.getLogger(MenuService.class);
	
	@Autowired
	private MenuDao menuDao;
	
	/**
	 * load menu group list
	 * @return
	 * @throws RuntimeException
	 */
	public List loadMenuGroupList() throws RuntimeException{
		List list = menuDao.fetchMenuGroupList();
		return list;
	}
	/**
	 * load all menu to list
	 * @return
	 */
	public List loadMenuList() {
		return menuDao.fetchMenuList();
	}
	/**
	 * load menu list by menuGroupId
	 * @param menuGroupId
	 * @return
	 */
	public List loadMenuListByMenuGroupId(String menuGroupId) {
		List list = menuDao.fetchMenuListByMenuGroupId(menuGroupId);
		return list;
	}
	/**
	 * load menuItemGroup By menuGroupId and menuId
	 * @param menuGroupId
	 * @param menuId
	 * @return
	 */
	public List loadMenuItemGroupListByMenuIdAndMenuGroupId(String menuGroupId, String menuId) {
		List list = menuDao.fetchMenuItemGroupListByMenuNMenuGroupId(menuGroupId, menuId);
		return list;
	}
	/**
	 * load all menuItemGroup to list
	 * @return
	 */
	public List loadAllMenuItemGroup() {
		List list = menuDao.fetchMenuItemGroupList();
		return list;
	}
	/**
	 * fetch all menuItem to list
	 * @return
	 */
	public List loadMenuItemList() {
		return menuDao.fetchMenuItemList();
	}
	/**
	 * load menuItem list by menuGroupId and menuId
	 * @param menuGroupId
	 * @param menuId
	 * @return
	 */
	public List loadMenuItemListByMenuIdAndMenuGroupId(String menuGroupId, String menuId) {
		List list = menuDao.fetchMenuItemListByMenuNMenuGroupId(menuGroupId, menuId);
		return list;
	}
}
