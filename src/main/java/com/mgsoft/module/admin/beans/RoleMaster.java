package com.mgsoft.module.admin.beans;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table
public class RoleMaster implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column
	private String roleName;

	@Column
	private String roleNameOl;

	@Column
	private String roleStatus;

	@Column
	private String roleDesc;

	@OneToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	@JoinTable(name = "role_master_rights", joinColumns = { @JoinColumn(name = "role_id") }, inverseJoinColumns = {
			@JoinColumn(name = "rights_id") })
	private Set<RoleRights> roleMasterRights = new HashSet<RoleRights>();

	@ManyToMany(mappedBy = "roles")
	@JsonIgnore
	private Set<UserMaster> users = new HashSet<UserMaster>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleNameOl() {
		return roleNameOl;
	}

	public void setRoleNameOl(String roleNameOl) {
		this.roleNameOl = roleNameOl;
	}

	public String getRoleStatus() {
		return roleStatus;
	}

	public void setRoleStatus(String roleStatus) {
		this.roleStatus = roleStatus;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public Set<RoleRights> getRoleMasterRights() {
		return roleMasterRights;
	}

	public void setRoleMasterRights(Set<RoleRights> roleMasterRights) {
		this.roleMasterRights = roleMasterRights;
	}

	public Set<UserMaster> getUsers() {
		return users;
	}

	public void setUsers(Set<UserMaster> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "RoleMaster [id=" + id + ", roleName=" + roleName + ", roleNameOl=" + roleNameOl + ", roleStatus="
				+ roleStatus + ", roleDesc=" + roleDesc + "]";
	}

}
