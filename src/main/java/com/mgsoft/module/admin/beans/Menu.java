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
	private String menuCssClasses;
	@Column
	private String menuNameOl;
	@Column
	private String link;
	@Column
	private Integer menuCount;
	@Column
	private String menuIcon;
	@Column
	private Boolean addRight;
	@Column
	private Boolean editRight;
	@Column
	private Boolean delRight;
	@Column
	private Boolean viewRight;
	@Column
	private Boolean printRight;
	@Column
	private Boolean specialRight;
	@Column
	private Boolean hasLink;
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

	public String getMenuCssClasses() {
		return menuCssClasses;
	}

	public void setMenuCssClasses(String menuCssClasses) {
		this.menuCssClasses = menuCssClasses;
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

	public Boolean getAddRight() {
		return addRight;
	}

	public void setAddRight(Boolean addRight) {
		this.addRight = addRight;
	}

	public Boolean getEditRight() {
		return editRight;
	}

	public void setEditRight(Boolean editRight) {
		this.editRight = editRight;
	}

	public Boolean getDelRight() {
		return delRight;
	}

	public void setDelRight(Boolean delRight) {
		this.delRight = delRight;
	}

	public Boolean getViewRight() {
		return viewRight;
	}

	public void setViewRight(Boolean viewRight) {
		this.viewRight = viewRight;
	}

	public Boolean getPrintRight() {
		return printRight;
	}

	public void setPrintRight(Boolean printRight) {
		this.printRight = printRight;
	}

	public Boolean getSpecialRight() {
		return specialRight;
	}

	public void setSpecialRight(Boolean specialRight) {
		this.specialRight = specialRight;
	}

	public Boolean getHasLink() {
		return hasLink;
	}

	public void setHasLink(Boolean hasLink) {
		this.hasLink = hasLink;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	@Override
	public String toString() {
		return "Menu [id=" + id + ", menuName=" + menuName + ", menuCssClasses=" + menuCssClasses + ", menuNameOl="
				+ menuNameOl + ", link=" + link + ", menuCount=" + menuCount + ", menuIcon=" + menuIcon + ", addRight="
				+ addRight + ", editRight=" + editRight + ", delRight=" + delRight + ", viewRight=" + viewRight
				+ ", printRight=" + printRight + ", specialRight=" + specialRight + ", hasLink=" + hasLink + ", status="
				+ status + ", parentId=" + parentId + ", parentName=" + parentName + "]";
	}

}
