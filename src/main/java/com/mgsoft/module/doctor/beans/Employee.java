package com.mgsoft.module.doctor.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column
	private String name;
	
	@Column
	private String nameOl;
	
	@Column
	private String contact;
	
	@Column
	private String email;
	
	@Column
	private String address;
	
	@Column
	private String status;

	@Column
	private long typeId;
	
	@Column
	private String typeName;
	
	public long getTypeId() {
		return typeId;
	}

	public void setTypeId(long typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

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

	public String getNameOl() {
		return nameOl;
	}

	public void setNameOl(String nameOl) {
		this.nameOl = nameOl;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString()
	{
		return "Employee [ " + " id = "+ id + "," 
							 + " name = "+ name + ","
							 + " nameOl = "+ nameOl + ","
							 + " contact = "+ contact + ","
							 + " email = "+ email + ","
							 + " address = "+ address + ","
							 + " status = "+ status
							 + "]";
	}
}
