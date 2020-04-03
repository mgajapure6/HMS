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
public class ItemCategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String categoryName;
	@Column
	private String parentCategoryId;
	@Column
	private String desc;
	@Column
	private String status;
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name="itemCategory_invItem", joinColumns = {@JoinColumn(name="itemCategory_id")}, inverseJoinColumns = {@JoinColumn(name="invItem_id")})
	private List<InvItem> invItems = new ArrayList<>();
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getParentCategoryId() {
		return parentCategoryId;
	}
	public void setParentCategoryId(String parentCategoryId) {
		this.parentCategoryId = parentCategoryId;
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
}
