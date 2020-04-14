package com.mgsoft.module.admin.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class Module implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(unique = true)
	private Integer srNo;
	@Column
	private String moduleCssClasses;
	@Column
	private String moduleName;
	@Column
	private String moduleNameOl;
	@Column
	private Integer parentModuleId;
	@Column
	private Integer entityId;
	@Column
	private String moduleIcon;
	@Column
	private String moduleUnder;
	@Column
	private boolean hasLink;
	@Column
	private String link;
	@Column
	private Boolean addRight;
	@Column
	private Boolean editRight;
	@Column
	private Boolean delRight;
	@Column
	private Boolean viewRight;
	@Column
	private String status;

	@OneToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	@JoinTable(name = "module_menu", joinColumns = { @JoinColumn(name = "module_id") }, inverseJoinColumns = {
			@JoinColumn(name = "menu_id") })
	private Collection<Menu> menus = new ArrayList<Menu>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getSrNo() {
		return srNo;
	}

	public void setSrNo(Integer srNo) {
		this.srNo = srNo;
	}

	public String getModuleCssClasses() {
		return moduleCssClasses;
	}

	public void setModuleCssClasses(String moduleCssClasses) {
		this.moduleCssClasses = moduleCssClasses;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleNameOl() {
		return moduleNameOl;
	}

	public void setModuleNameOl(String moduleNameOl) {
		this.moduleNameOl = moduleNameOl;
	}

	public Integer getParentModuleId() {
		return parentModuleId;
	}

	public void setParentModuleId(Integer parentModuleId) {
		this.parentModuleId = parentModuleId;
	}

	public Integer getEntityId() {
		return entityId;
	}

	public void setEntityId(Integer entityId) {
		this.entityId = entityId;
	}

	public String getModuleUnder() {
		return moduleUnder;
	}

	public void setModuleUnder(String moduleUnder) {
		this.moduleUnder = moduleUnder;
	}

	public boolean isHasLink() {
		return hasLink;
	}

	public void setHasLink(boolean hasLink) {
		this.hasLink = hasLink;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getModuleIcon() {
		return moduleIcon;
	}

	public void setModuleIcon(String moduleIcon) {
		this.moduleIcon = moduleIcon;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Collection<Menu> getMenus() {
		return menus;
	}

	public void setMenus(Collection<Menu> menus) {
		this.menus = menus;
	}

	@Override
	public String toString() {
		return "Module [id=" + id + ", srNo=" + srNo + ", moduleCssClasses=" + moduleCssClasses + ", moduleName="
				+ moduleName + ", moduleNameOl=" + moduleNameOl + ", parentModuleId=" + parentModuleId + ", entityId="
				+ entityId + ", moduleIcon=" + moduleIcon + ", moduleUnder=" + moduleUnder + ", hasLink=" + hasLink
				+ ", link=" + link + ", addRight=" + addRight + ", editRight=" + editRight + ", delRight=" + delRight
				+ ", viewRight=" + viewRight + ", status=" + status + "]";
	}

}
