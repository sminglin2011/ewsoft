package com.ewsoft.domain;

import lombok.Data;

@Data
public class PR {
	private String prNumber;
	private String date;
	private String supplierId;
	private String terms;
	private String prepareByCode;
	private String requestedby;
	
	private String stockId;
	private String quantityOrder;
	private String unitMs;
	private String ledger;
	private double unitOriginal;
	

}
