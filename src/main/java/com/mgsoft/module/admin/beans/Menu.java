package com.mgsoft.module.admin.beans;

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
public class Menu implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column
	private String menuName;
	@Column
	private String menuNameOl;
	@Column
	private String link;
	@Column
	private Integer menuCount;
	@Column
	private String menuIcon;
	@Column
	private String addRight;
	@Column
	private String modRight;
	@Column
	private String delRight;
	@Column
	private String viewRight;
	@Column
	private String printRight;
	@Column
	private String specialRight;
	@Column
	private boolean hasLink;
	@Column
	private String status;
	@Column
	private Long parentId;
	@Column
	private String parentName;

	@ManyToOne
	@JsonIgnore
	private Module module;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuNameOl() {
		return menuNameOl;
	}

	public void setMenuNameOl(String menuNameOl) {
		this.menuNameOl = menuNameOl;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Integer getMenuCount() {
		return menuCount;
	}

	public void setMenuCount(Integer menuCount) {
		this.menuCount = menuCount;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getAddRight() {
		return addRight;
	}

	public void setAddRight(String addRight) {
		this.addRight = addRight;
	}

	public String getModRight() {
		return modRight;
	}

	public void setModRight(String modRight) {
		this.modRight = modRight;
	}

	public String getDelRight() {
		return delRight;
	}

	public void setDelRight(String delRight) {
		this.delRight = delRight;
	}

	public String getViewRight() {
		return viewRight;
	}

	public void setViewRight(String viewRight) {
		this.viewRight = viewRight;
	}

	public String getPrintRight() {
		return printRight;
	}

	public void setPrintRight(String printRight) {
		this.printRight = printRight;
	}

	public String getSpecialRight() {
		return specialRight;
	}

	public void setSpecialRight(String specialRight) {
		this.specialRight = specialRight;
	}

	public boolean isHasLink() {
		return hasLink;
	}

	public void setHasLink(boolean hasLink) {
		this.hasLink = hasLink;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getParentName() {
		return parentName;
	}

	public void setParentName(String moduleName) {
		this.parentName = moduleName;
	}
	
	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long moduleId) {
		this.parentId = moduleId;
	}

	@Override
	public String toString() {
		return "Menu [id=" + id + ", menuName=" + menuName + ", menuNameOl=" + menuNameOl + ", link=" + link
				+ ", menuCount=" + menuCount + ", menuIcon=" + menuIcon + ", addRight=" + addRight + ", modRight="
				+ modRight + ", delRight=" + delRight + ", viewRight=" + viewRight + ", printRight=" + printRight
				+ ", specialRight=" + specialRight + ", hasLink=" + hasLink + ", status=" + status + "]";
	}
	
	

}
