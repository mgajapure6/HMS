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
public class Tax implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column
    private String taxName;
    @Column
    private String taxRate;
    @Column
    private String taxRegNo;
    @Column
    private String authName;
    @Column
    private String taxCode;
    @Column
    private String status;

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getTaxName() {
	return taxName;
    }

    public void setTaxName(String taxName) {
	this.taxName = taxName;
    }

    public String getTaxRate() {
	return taxRate;
    }

    public void setTaxRate(String taxRate) {
	this.taxRate = taxRate;
    }

    public String getTaxRegNo() {
	return taxRegNo;
    }

    public void setTaxRegNo(String taxRegNo) {
	this.taxRegNo = taxRegNo;
    }

    public String getAuthName() {
	return authName;
    }

    public void setAuthName(String authName) {
	this.authName = authName;
    }

    public String getTaxCode() {
	return taxCode;
    }

    public void setTaxCode(String taxCode) {
	this.taxCode = taxCode;
    }

    public String getStatus() {
	return status;
    }

    public void setStatus(String status) {
	this.status = status;
    }
    


}
