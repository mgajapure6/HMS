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
import com.mgsoft.module.customer.beans.Customer;

@Entity
@Table
//@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class SalesInvoice implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String invNum;

    @Column
    private String invDate;
    @Column
    private String posoNum;
    @Column
    private String payDueDate;
    @Column
    private String invVal;
    @Column
    private String discountVal;
    @Column
    private String taxableVal;
    @Column
    private String taxVal;
    @Column
    private String recipientDesc;
    @Column
    private String payStatus; // P=for paid, U=for unpaid, h=for half or partial paid

    @ManyToOne
    @JsonIgnore
    private Customer customer;

    @OneToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
    @JoinTable(name = "salesInvoice_salesInvoiceItem", joinColumns = {
	    @JoinColumn(name = "salesInvoice_id") }, inverseJoinColumns = { @JoinColumn(name = "salesInvoiceItem_id") })
    private Set<SalesInvoiceItem> items;

    @OneToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
    @JoinTable(name = "salesInvoice_salesInvoicePayment", joinColumns = {
	    @JoinColumn(name = "salesInvoice_id") }, inverseJoinColumns = {
		    @JoinColumn(name = "salesInvoicePayment_id") })
    private Set<SalesInvoicePayment> payments;

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getInvNum() {
	return invNum;
    }

    public void setInvNum(String invNum) {
	this.invNum = invNum;
    }

    public String getInvDate() {
	return invDate;
    }

    public void setInvDate(String invDate) {
	this.invDate = invDate;
    }

    public String getPosoNum() {
	return posoNum;
    }

    public void setPosoNum(String posoNum) {
	this.posoNum = posoNum;
    }

    public String getPayDueDate() {
	return payDueDate;
    }

    public void setPayDueDate(String payDueDate) {
	this.payDueDate = payDueDate;
    }

    public String getInvVal() {
	return invVal;
    }

    public void setInvVal(String invVal) {
	this.invVal = invVal;
    }

    public String getDiscountVal() {
	return discountVal;
    }

    public void setDiscountVal(String discountVal) {
	this.discountVal = discountVal;
    }

    public String getTaxableVal() {
	return taxableVal;
    }

    public void setTaxableVal(String taxableVal) {
	this.taxableVal = taxableVal;
    }

    public String getTaxVal() {
	return taxVal;
    }

    public void setTaxVal(String taxVal) {
	this.taxVal = taxVal;
    }

    public Customer getCustomer() {
	return customer;
    }

    public void setCustomer(Customer customer) {
	this.customer = customer;
    }

    public Set<SalesInvoiceItem> getItems() {
	return items;
    }

    public void setItems(Set<SalesInvoiceItem> items) {
	this.items = items;
    }

    public String getRecipientDesc() {
	return recipientDesc;
    }

    public void setRecipientDesc(String recipientDesc) {
	this.recipientDesc = recipientDesc;
    }

    public String getPayStatus() {
	return payStatus;
    }

    public void setPayStatus(String payStatus) {
	this.payStatus = payStatus;
    }

    public Set<SalesInvoicePayment> getPayments() {
	return payments;
    }

    public void setPayments(Set<SalesInvoicePayment> payments) {
	this.payments = payments;
    }

}
