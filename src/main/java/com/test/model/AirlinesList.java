package com.test.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class AirlinesList {
	@Id
	@GeneratedValue
	@Column(name="airlinesid")
	private int airlinesId;
	private String airlinesName;

	public int getAirlinesId() {
		return airlinesId;
	}

	public void setAirlinesId(int airlinesId) {
		this.airlinesId = airlinesId;
	}

	public String getAirlinesName() {
		return airlinesName;
	}

	public void setAirlinesName(String airlinesName) {
		this.airlinesName = airlinesName;
	}

}
