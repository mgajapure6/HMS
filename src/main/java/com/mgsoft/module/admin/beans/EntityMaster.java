package com.mgsoft.module.admin.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class EntityMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column
	private String entityName;
	
	@Column
	private String entityNameOl;
	
	@Column
	private String entityAddress;
	
	@Column
	private String entityEmail;
	
	@Column
	private String entityContact;
	
	@Column
	private String status;
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public String getEntityNameOl() {
		return entityNameOl;
	}

	public void setEntityNameOl(String entityNameOl) {
		this.entityNameOl = entityNameOl;
	}

	public String getEntityAddress() {
		return entityAddress;
	}

	public void setEntityAddress(String entityAddress) {
		this.entityAddress = entityAddress;
	}

	public String getEntityEmail() {
		return entityEmail;
	}

	public void setEntityEmail(String entityEmail) {
		this.entityEmail = entityEmail;
	}

	public String getEntityContact() {
		return entityContact;
	}

	public void setEntityContact(String entityContact) {
		this.entityContact = entityContact;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Entity[id = " + id + ", entityName = " + entityName +", entityNameOl = " + entityNameOl +", entityAddress = "
				+ entityAddress +", entityEmail = " + entityEmail + ", entityContact = "+ entityContact +"]";
	}
	
}
