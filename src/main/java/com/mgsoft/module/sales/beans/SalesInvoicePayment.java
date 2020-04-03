package com.mgsoft.module.sales.beans;

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
public class SalesInvoicePayment implements Serializable {
    private static final long serialVersionUID = 1L;
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column
    private String paidAmount;
    @Column
    private String paidDate;
    @Column
    private String balAmount;
    @Column
    private String paidMethod;
    @ManyToOne
    @JsonIgnore
    private SalesInvoice salesInvoice;
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getPaidAmount() {
        return paidAmount;
    }
    public void setPaidAmount(String paidAmount) {
        this.paidAmount = paidAmount;
    }
    public String getPaidDate() {
        return paidDate;
    }
    public void setPaidDate(String paidDate) {
        this.paidDate = paidDate;
    }
    public String getBalAmount() {
        return balAmount;
    }
    public void setBalAmount(String balAmount) {
        this.balAmount = balAmount;
    }
    public String getPaidMethod() {
        return paidMethod;
    }
    public void setPaidMethod(String paidMethod) {
        this.paidMethod = paidMethod;
    }
    public SalesInvoice getSalesInvoice() {
        return salesInvoice;
    }
    public void setSalesInvoice(SalesInvoice salesInvoice) {
        this.salesInvoice = salesInvoice;
    }
    
    
    

}
