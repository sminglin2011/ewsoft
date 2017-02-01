package com.ewsoft.domain;

import lombok.Data;

@Data
public class Customer {
	
	private boolean isCustomer = true;
	private String id;
	private String name; 
	private String addPostal;
	private String telephone;
	private String fax;
	private String billAddress1;
	private String billPostal;
	private String contactPerson;
	private String address1;
	private String contactPersonEmail;
	private String arTerm;
	private String billTelephone;
	private String billFax;
	private String billContactPerson;

}
