package com.test.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class CustomerDetails {
	@Id
	@GeneratedValue
	@Column(name="custid")
	private int custId;
	private String custName;
	private String custEmail;
	private String custMobile;
    private String custPassword;
    
	public String getCustPassword() {
		return custPassword;
	}

	public void setCustPassword(String custPassword) {
		this.custPassword = custPassword;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public String getCustMobile() {
		return custMobile;
	}

	public void setCustMobile(String custMobile) {
		this.custMobile = custMobile;
	}

	@Override
	public String toString() {
		return "CustomerDetails [custId=" + custId + ", custName=" + custName + ", custEmail=" + custEmail
				+ ", custMobile=" + custMobile + ", custPassword=" + custPassword + "]";
	}

	

}
