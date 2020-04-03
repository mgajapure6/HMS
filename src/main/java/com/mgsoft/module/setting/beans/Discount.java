package com.mgsoft.module.setting.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Discount implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String disName;
	@Column
	private String disShortCode;
	@Column
	private Double disPercentage;
	@Column
	private String status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDisName() {
		return disName;
	}

	public void setDisName(String disName) {
		this.disName = disName;
	}

	public String getDisShortCode() {
		return disShortCode;
	}

	public void setDisShortCode(String disShortCode) {
		this.disShortCode = disShortCode;
	}

	public Double getDisPercentage() {
		return disPercentage;
	}

	public void setDisPercentage(Double disPercentage) {
		this.disPercentage = disPercentage;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
