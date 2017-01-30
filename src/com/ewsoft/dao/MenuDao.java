package com.ewsoft.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDao {
	
	Logger logger = Logger.getLogger(MenuDao.class);

	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	/************* original field *****************/
	/**
	 * fetch menu group list (original field)
	 * @return
	 */
	public List fetchMenuGroupList() throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select mg.code, mg.menuGroupId, mg.sequence, mg.menuGroupName, mg.remark, mg.webShowMenu"
				+ ", mr.url from m33menugroup mg left join m33menuresource mr"
				+ " on mg.menuGroupId = mr.menuGroupId and mr.itemType='menugroup'");
		return list;
	}
	/**
	 * fetch menu list by menu group id(original field)
	 * @param menuGroupId
	 * @return
	 */
	public List fetchMenuListByMenuGroupId(String menuGroupId) throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select m.code, m.active, m.menuGroupId, m.menuGroupName, m.menuId, m.menuName, m.minPax, m.price, m.sequence"
				+ ", m.menuOrigName, m.noItem, m.ledger, m.addPaxPrice, m.cookLeadTime, m.deliveryLeadTime"
				+ ", m.collectionLeadTime, m.terms, m.termsWeb, m.multiDelivery, m.noDelivery, m.delYN, m.colYN"
				+ ", m.priceByItem, m.menuItemShowImage, m.deliveryRef, m.deliveryFee, m.minTotalWaiver, m.minPaxWaiver"
				+ ", m.minWaiverMode, mr.url, m.addOn"
				+ " from m33menu m left join m33menuresource mr on m.menuGroupId = mr.menuGroupId"
				+ " and m.menuId = mr.menuId and mr.itemType='menu'"
				+ " where m.menuGroupId = ? ", menuGroupId);
		return list;
	}
	/**
	 * fetch menu list
	 * @return
	 * @throws DataAccessException
	 */
	public List fetchMenuList() throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select m.code, m.active, m.menuGroupId, m.menuGroupName, m.menuId, m.menuName, m.minPax, m.price, m.sequence"
				+ ", m.menuOrigName, m.noItem, m.ledger, m.addPaxPrice, m.cookLeadTime, m.deliveryLeadTime"
				+ ", m.collectionLeadTime, m.terms, m.termsWeb, m.multiDelivery, m.noDelivery, m.delYN, m.colYN"
				+ ", m.priceByItem, m.menuItemShowImage, m.deliveryRef, m.deliveryFee, m.minTotalWaiver, m.minPaxWaiver"
				+ ", m.minWaiverMode, mr.url, m.addOn"
				+ " from m33menu m left join m33menuresource mr on m.menuGroupId = mr.menuGroupId"
				+ " and m.menuId = mr.menuId and mr.itemType='menu'"
				);
		return list;
	}
	/**
	 * fetch menuItem by menu id and menu group id (original field)
	 * @param menuGroupId
	 * @param menuId
	 * @return
	 */
	public List fetchMenuItemListByMenuNMenuGroupId(String menuGroupId, String menuId) throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select mi.code, mi.menuGroupId, mi.menuId, mi.kitchen, mi.chief, mi.remark, mi.sequence, mi.menuItem"
				+ ", mi.section, mi.addOn, mi.addPrice, mi.menuItemName, mi.menuItemOrigName, mi.itemId, mi.menuCategoryType"
				+ ", mi.limitSelection, mi.optional, mi.prepareQty, mi.prepareUnitMs, mi.noDel, mi.price, mr.url"
				+ ", a.menuItemName as groupName "
				+ " from m33menuitem mi left join m33menuItem a on a.menuGroupId = mi.menuGroupId and a.menuId = mi.menuId"
				+ " and a.menuCategoryType='menu-item-group' and a.sequence = mi.sequence"
				+ " left join m33menuresource mr on mi.menuGroupId = mr.menuGroupId"
				+ " and mi.menuId = mr.menuId and mi.itemId = mr.itemId and mr.itemType = 'Item'"
				+ " where mi.menuCategoryType = 'menu-item' and mi.menuGroupId = ? and mi.menuId = ?", menuGroupId, menuId);
		return list;
	}
	/**
	 * fetch menuItem list
	 * @return
	 * @throws DataAccessException
	 */
	public List fetchMenuItemList() throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select mi.code, mi.menuGroupId, mi.menuId, mi.kitchen, mi.chief, mi.remark, mi.sequence, mi.menuItem"
				+ ", mi.section, mi.addOn, mi.addPrice, mi.menuItemName, mi.menuItemOrigName, mi.itemId, mi.menuCategoryType"
				+ ", mi.limitSelection, mi.optional, mi.prepareQty, mi.prepareUnitMs, mi.noDel, mi.price, mr.url"
				+ ", a.menuItemName as groupName "
				+ " from m33menuitem mi left join m33menuItem a on a.menuGroupId = mi.menuGroupId and a.menuId = mi.menuId"
				+ " and a.menuCategoryType='menu-item-group' and a.sequence = mi.sequence"
				+ " left join m33menuresource mr on mi.menuGroupId = mr.menuGroupId"
				+ " and mi.menuId = mr.menuId and mi.itemId = mr.itemId and mr.itemType = 'Item'"
				+ " where mi.menuCategoryType = 'menu-item' ");
		return list;
	}
	/**
	 * fetch menuItem by menu id and menu group id (original field)
	 * @param menuGroupId
	 * @param menuId
	 * @return
	 */
	public List fetchMenuItemGroupListByMenuNMenuGroupId(String menuGroupId, String menuId) throws DataAccessException {
		List list = null;
		list = jdbcTemplate.queryForList(
				"select mi.code, mi.menuGroupId, mi.menuId, mi.kitchen, mi.chief, mi.remark, mi.sequence, mi.menuItem"
				+ ", mi.section, mi.addOn, mi.addPrice, mi.menuItemName, mi.menuItemOrigName, mi.itemId, mi.menuCategoryType"
				+ ", mi.limitSelection, mi.optional, mi.prepareQty, mi.prepareUnitMs, mi.noDel, mi.price, mr.url"
				+ " from m33menuitem mi left join m33menuresource mr on mi.menuGroupId = mr.menuGroupId"
				+ " and mi.menuId = mr.menuId and mi.itemId = mr.itemId and mr.itemType = 'Item'"
				+ " where mi.menuCategoryType = 'menu-item-group' and mi.menuGroupId = ? and mi.menuId = ?", menuGroupId, menuId);
		return list;
	}
	/************* original field end *****************/
}
