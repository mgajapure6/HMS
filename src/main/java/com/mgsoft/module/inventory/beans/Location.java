package com.mgsoft.module.inventory.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class Location implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column
	private String locationName;
	
	@Column
	private String desc;
	
	@Column
	private String status;
	
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
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name="location_invItem", joinColumns = {@JoinColumn(name="location_id")}, inverseJoinColumns = {@JoinColumn(name="invItem_id")})
	private List<InvItem> invItems = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<InvItem> getInvItems() {
		return invItems;
	}

	public void setInvItems(List<InvItem> invItems) {
		this.invItems = invItems;
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
	
	

}
