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
public class RoleRights implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column
	private Long moduleId;

	@Column
	private String moduleName;

	@Column
	private Boolean moduleView;

	@Column
	private Boolean moduleAdd;

	@Column
	private Boolean moduleEdit;

	@Column
	private Boolean moduleDelete;

	@Column
	private Long menuId;

	@Column
	private String menuName;

	@Column
	private Boolean menuView;

	@Column
	private Boolean menuAdd;

	@Column
	private Boolean menuEdit;

	@Column
	private Boolean menuDelete;

	@ManyToOne
	@JsonIgnore
	private RoleMaster roleMaster;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getModuleId() {
		return moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	public Boolean getModuleView() {
		return moduleView;
	}

	public void setModuleView(Boolean moduleView) {
		this.moduleView = moduleView;
	}

	public Boolean getModuleAdd() {
		return moduleAdd;
	}

	public void setModuleAdd(Boolean moduleAdd) {
		this.moduleAdd = moduleAdd;
	}

	public Boolean getModuleEdit() {
		return moduleEdit;
	}

	public void setModuleEdit(Boolean moduleEdit) {
		this.moduleEdit = moduleEdit;
	}

	public Boolean getModuleDelete() {
		return moduleDelete;
	}

	public void setModuleDelete(Boolean moduleDelete) {
		this.moduleDelete = moduleDelete;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public Boolean getMenuView() {
		return menuView;
	}

	public void setMenuView(Boolean menuView) {
		this.menuView = menuView;
	}

	public Boolean getMenuAdd() {
		return menuAdd;
	}

	public void setMenuAdd(Boolean menuAdd) {
		this.menuAdd = menuAdd;
	}

	public Boolean getMenuEdit() {
		return menuEdit;
	}

	public void setMenuEdit(Boolean menuEdit) {
		this.menuEdit = menuEdit;
	}

	public Boolean getMenuDelete() {
		return menuDelete;
	}

	public void setMenuDelete(Boolean menuDelete) {
		this.menuDelete = menuDelete;
	}

	public RoleMaster getRoleMaster() {
		return roleMaster;
	}

	public void setRoleMaster(RoleMaster roleMaster) {
		this.roleMaster = roleMaster;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Override
	public String toString() {
		return "RoleRights [id=" + id + ", moduleId=" + moduleId + ", moduleView=" + moduleView + ", moduleAdd="
				+ moduleAdd + ", moduleEdit=" + moduleEdit + ", moduleDelete=" + moduleDelete + ", menuId=" + menuId
				+ ", menuView=" + menuView + ", menuAdd=" + menuAdd + ", menuEdit=" + menuEdit + ", menuDelete="
				+ menuDelete + "]";
	}

}
