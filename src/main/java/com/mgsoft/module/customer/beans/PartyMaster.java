package com.mgsoft.module.customer.beans;

import java.io.Serializable;
import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table
public class PartyMaster implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String name;
	@Column
	private String addrL1;
	@Column
	private String addrL2;
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddrL1() {
		return addrL1;
	}

	public void setAddrL1(String addrL1) {
		this.addrL1 = addrL1;
	}

	public String getAddrL2() {
		return addrL2;
	}

	public void setAddrL2(String addrL2) {
		this.addrL2 = addrL2;
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

	
}
