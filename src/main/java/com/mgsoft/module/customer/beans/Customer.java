package com.mgsoft.module.customer.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.mgsoft.module.giravi.beans.Loan;
import com.mgsoft.module.sales.beans.SalesInvoice;

@Entity
@Table
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String cusName;
	@Column
	private String cusAddrL1;
	@Column
	private String cusAddrL2;
	@Column
	private String state;
	@Column
	private String city;
	@Column
	private String pincode;
	@Column
	private String mobile;
	@Column
	private String email;
	@Lob
	private byte[] image;
	

	@OneToMany(cascade = { CascadeType.ALL })
	@JoinTable(name = "customer_salesInvoice", joinColumns = {
			@JoinColumn(name = "customer_id") }, inverseJoinColumns = { @JoinColumn(name = "salesInvoice_id") })
	private Collection<SalesInvoice> salesInvoices = new ArrayList<SalesInvoice>();

	@OneToMany(cascade = { CascadeType.ALL })
	@JoinTable(name = "customer_loan", joinColumns = { @JoinColumn(name = "customer_id") }, inverseJoinColumns = {
			@JoinColumn(name = "loan_id") })
	private Collection<Loan> loans = new ArrayList<Loan>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}

	public String getCusAddrL1() {
		return cusAddrL1;
	}

	public void setCusAddrL1(String cusAddrL1) {
		this.cusAddrL1 = cusAddrL1;
	}

	public String getCusAddrL2() {
		return cusAddrL2;
	}

	public void setCusAddrL2(String cusAddrL2) {
		this.cusAddrL2 = cusAddrL2;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Collection<SalesInvoice> getSalesInvoices() {
		return salesInvoices;
	}

	public void setSalesInvoices(Collection<SalesInvoice> salesInvoices) {
		this.salesInvoices = salesInvoices;
	}

	public Collection<Loan> getLoans() {
		return loans;
	}

	public void setLoans(Collection<Loan> loans) {
		this.loans = loans;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}
	
	@Transient
	public String imageString() {
		if(getImage()!=null) {
			return "data:image/png;base64," +Base64.getEncoder().encodeToString(getImage());
		}else {
			return "";
		}
		
	}


	@Override
	public String toString() {
		return "Customer [id=" + id + ", cusName=" + cusName + ", cusAddrL1=" + cusAddrL1 + ", cusAddrL2=" + cusAddrL2
				+ ", state=" + state + ", city=" + city + ", pincode=" + pincode + ", mobile=" + mobile + ", email="
				+ email + "]";
	}

	
}
