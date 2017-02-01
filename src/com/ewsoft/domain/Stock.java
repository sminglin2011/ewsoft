package com.ewsoft.domain;

import lombok.Data;

@Data
public class Stock {
	
	private String stockId;
	private String descrip1;
	private String oriDesc;
	private String menuItem;
	private String isMenuItem;
	private String foodItems;
	private String equipment;
	private String ingredients;
	private String disposables;
	private String condiments;
	private String cutlery;
	private String supplierId;
	private double defaultPrice;// default price from supplier lstslspr
	private String cogLedger;

}
