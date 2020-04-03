package com.mgsoft.module.admin.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class UserMaster implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String UserName;
	@Column
	private String UserNameOl;
	@Column
	private String address;
	@Column
	private String email;
	@Column
	private String contact;
	@Column
	private String loginName;
	@Column
	private String loginPassword;
	@Column
	private String status;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserNameOl() {
		return UserNameOl;
	}
	public void setUserNameOl(String userNameOl) {
		UserNameOl = userNameOl;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	@Override
	public String toString() {
		return "UserMaster [id="+id+", userName = "+UserName + ", UserNameOl = " + UserNameOl + ", address = " + address
				+ ", email = "+ email + ", loginName = "+ loginName +", loginPassword = "+ loginPassword + ", status = "+ status
				+ ", contact = " + contact +"]";
	}
	
}
