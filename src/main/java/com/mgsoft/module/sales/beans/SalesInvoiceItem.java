package com.mgsoft.module.sales.beans;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mgsoft.module.setting.beans.Discount;
import com.mgsoft.module.setting.beans.Tax;

@Entity
@Table
public class SalesInvoiceItem implements Serializable {
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
    private String qty;
    @Column
    private String brand;
    @Column
    private String status;
    @Column
    private String unitAmt;
    @Column
    private String qtyAmt;
    @Column
    private Long inventoryItemId;
    @Column
    private Long categoryId;
    @Column
    private String taxableAmt;
    @Column
    private String totalAmt;
    
    @OneToMany(cascade = {CascadeType.ALL},fetch = FetchType.EAGER)
    @JoinTable(name="soldItem_tax", joinColumns = {@JoinColumn(name="soldItem_id")}, inverseJoinColumns = {@JoinColumn(name="tax_id")})
    private Set<Tax> taxes;
    
    @OneToMany(cascade = {CascadeType.ALL},fetch = FetchType.EAGER)
    @JoinTable(name="soldItem_discount", joinColumns = {@JoinColumn(name="soldItem_id")}, inverseJoinColumns = {@JoinColumn(name="discount_id")})
    private Set<Discount> discounts;

    @ManyToOne
    @JsonIgnore
    private SalesInvoice salesInvoice;

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

    public String getQty() {
	return qty;
    }

    public void setQty(String qty) {
	this.qty = qty;
    }

    public String getBrand() {
	return brand;
    }

    public void setBrand(String brand) {
	this.brand = brand;
    }

    public String getStatus() {
	return status;
    }

    public void setStatus(String status) {
	this.status = status;
    }

    public String getUnitAmt() {
	return unitAmt;
    }

    public void setUnitAmt(String unitAmt) {
	this.unitAmt = unitAmt;
    }

    public String getQtyAmt() {
	return qtyAmt;
    }

    public void setQtyAmt(String qtyAmt) {
	this.qtyAmt = qtyAmt;
    }

    public Long getInventoryItemId() {
	return inventoryItemId;
    }

    public void setInventoryItemId(Long inventoryItemId) {
	this.inventoryItemId = inventoryItemId;
    }


    public Long getCategoryId() {
	return categoryId;
    }

    public void setCategoryId(Long categoryId) {
	this.categoryId = categoryId;
    }

    public SalesInvoice getSalesInvoice() {
	return salesInvoice;
    }

    public void setSalesInvoice(SalesInvoice salesInvoice) {
	this.salesInvoice = salesInvoice;
    }

    public String getTaxableAmt() {
        return taxableAmt;
    }

    public void setTaxableAmt(String taxableAmt) {
        this.taxableAmt = taxableAmt;
    }

    public String getTotalAmt() {
        return totalAmt;
    }

    public void setTotalAmt(String totalAmt) {
        this.totalAmt = totalAmt;
    }

    public Set<Tax> getTaxes() {
        return taxes;
    }

    public void setTaxes(Set<Tax> taxes) {
        this.taxes = taxes;
    }

    public Set<Discount> getDiscounts() {
        return discounts;
    }

    public void setDiscounts(Set<Discount> discounts) {
        this.discounts = discounts;
    }


}
