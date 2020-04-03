package com.mgsoft.module.admin.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

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
public class Module implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
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
	private String status;

	@OneToMany(cascade = { CascadeType.ALL })
	@JoinTable(name = "module_menu", joinColumns = { @JoinColumn(name = "module_id") }, inverseJoinColumns = {
			@JoinColumn(name = "menu_id") })
	private Collection<Menu> menus = new ArrayList<Menu>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
			
		if (obj == null) {
			return false;
		}
			
		if (getClass() != obj.getClass()) {
			return false;
		}
			
		Module other = (Module) obj;
		if (id != other.id) {
			return false;
		}else {
			return true;
		}
			
		
	}

	

	
}
