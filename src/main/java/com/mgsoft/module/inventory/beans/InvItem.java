package com.mgsoft.module.inventory.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table
public class InvItem implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String itemName;
	@Column
	private String hsnNo;
	@Column
	private String hsnDesc;
	@Column
	private String measurementUnit;
	@Column
	private String mainQty;
	@Column
	private String brand;
	@Column
	private String expiryDate;
	@Column
	private String status;
	@Column
	private String lowStockQty;
	@Column
	private String costPrice;
	@Column
	private String sellingPrice;
	
	@ManyToOne
	@JsonIgnore
	private ItemCategory itemCategory;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public String getHsnNo() {
	    return hsnNo;
	}
	public void setHsnNo(String hsnNo) {
	    this.hsnNo = hsnNo;
	}
	public String getHsnDesc() {
	    return hsnDesc;
	}
	public void setHsnDesc(String hsnDesc) {
	    this.hsnDesc = hsnDesc;
	}
	public String getMeasurementUnit() {
		return measurementUnit;
	}
	public void setMeasurementUnit(String measurementUnit) {
		this.measurementUnit = measurementUnit;
	}
	public String getMainQty() {
		return mainQty;
	}
	public void setMainQty(String mainQty) {
		this.mainQty = mainQty;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLowStockQty() {
		return lowStockQty;
	}
	public void setLowStockQty(String lowStockQty) {
		this.lowStockQty = lowStockQty;
	}
	public String getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(String costPrice) {
		this.costPrice = costPrice;
	}
	public String getSellingPrice() {
		return sellingPrice;
	}
	public void setSellingPrice(String sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	public ItemCategory getItemCategory() {
		return itemCategory;
	}
	public void setItemCategory(ItemCategory itemCategory) {
		this.itemCategory = itemCategory;
	}
	

}
