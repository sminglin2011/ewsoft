package com.ewsoft.domain;

import lombok.Data;

@Data
public class DeliveryOrderDetails {
	
	private String soNumber;
	private String refType;
	private String description;
	private String sequence;
	private String quantityOrder;
	private String unitMs;
	private double valueOriginal;
	private String subType;
	private String noPax;
}
