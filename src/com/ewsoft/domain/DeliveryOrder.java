package com.ewsoft.domain;

import java.util.List;

import lombok.Data;

@Data
public class DeliveryOrder {
	
	private String soNumber;
	private String deliveryStatus;
	private String custCode;
	private String custName;
	private String custDelAtt;
	private String schDelDate;
	private String schDelTime;
	private String noPax;
	private String payType;
	private List deliveryOrderDetails;
	

}
