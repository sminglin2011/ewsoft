package com.ewsoft.domain;

import java.util.List;

import lombok.Data;

@Data
public class DeliveryOrder {
	
	private String soNumber;
	private String deliverStatus; //delivered status D, collected status C
	private String collectionStatus;
	private String custCode;
	private String custName;
	private String custDelAtt;
	private String schDelDate;
	private String schDelTime;
	private String schCollectionDate;
	private String schCollectionTime;
	private String noPax;
	private String payType;
	private List deliveryOrderDetails;
	

}
