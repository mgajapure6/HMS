package com.mgsoft.module.diagnostic.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
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

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table
public class TestGroup implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	private Date groupRegDate;

	@Column
	private String groupName;

	@Column
	private String groupCode;
	
	@Column
	private String groupType;
	
	@Column
	private String groupDesc;

	@Column
	private String groupStatus;
	
	@OneToMany(cascade = {CascadeType.ALL})
	@JoinTable(name="testGroup_test", joinColumns = {@JoinColumn(name="testGroup_id")}, inverseJoinColumns = {@JoinColumn(name="test_id")})
	private List<TestMaster> tests = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getGroupRegDate() {
		return groupRegDate;
	}

	public void setGroupRegDate(Date groupRegDate) {
		this.groupRegDate = groupRegDate;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public String getGroupDesc() {
		return groupDesc;
	}

	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
	}

	public String getGroupStatus() {
		return groupStatus;
	}

	public void setGroupStatus(String groupStatus) {
		this.groupStatus = groupStatus;
	}

	public List<TestMaster> getTests() {
		return tests;
	}

	public void setTests(List<TestMaster> tests) {
		this.tests = tests;
	}
	
	

}
