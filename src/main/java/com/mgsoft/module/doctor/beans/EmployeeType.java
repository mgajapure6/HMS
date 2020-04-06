package com.mgsoft.module.doctor.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class EmployeeType {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column
	private String name;
	
	@Column
	private String nameOl;
	
	@Column
	private String status;

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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString()
	{
		return "EmpoloyeeType[ "
								+ " id = " + id + ","
								+ " name = " + name + ","
								+ " nameOl = " + nameOl + ","
								+ " status = " + status
								+"]";
	}
}
