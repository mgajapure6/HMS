package com.mgsoft.module.diagnostic.beans;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table
public class TestMaster implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	private Date testRegDate;

	@Column
	private String testName;

	@Column
	private String testCode;

	@Column
	private String testType;

	@Column
	private String testTitle;

	@Column
	private Float testRate;

	@Column
	private Float testOMRate;

	@Column
	private Float testUrgentRate;

	@Column
	private Float testIPDRate;

	@Column
	private Float testNormalRate;

	@Column
	private Float testUnit;

	@Column
	private Float testDrCommission;

	@Column
	private String testDesc;

	@Column
	private String testStatus;

	@ManyToOne
	@JsonIgnore
	private TestGroup testGroup;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getTestRegDate() {
		return testRegDate;
	}

	public void setTestRegDate(Date testRegDate) {
		this.testRegDate = testRegDate;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public String getTestCode() {
		return testCode;
	}

	public void setTestCode(String testCode) {
		this.testCode = testCode;
	}

	public String getTestType() {
		return testType;
	}

	public void setTestType(String testType) {
		this.testType = testType;
	}

	public String getTestTitle() {
		return testTitle;
	}

	public void setTestTitle(String testTitle) {
		this.testTitle = testTitle;
	}

	public Float getTestRate() {
		return testRate;
	}

	public void setTestRate(Float testRate) {
		this.testRate = testRate;
	}

	public Float getTestOMRate() {
		return testOMRate;
	}

	public void setTestOMRate(Float testOMRate) {
		this.testOMRate = testOMRate;
	}

	public Float getTestUrgentRate() {
		return testUrgentRate;
	}

	public void setTestUrgentRate(Float testUrgentRate) {
		this.testUrgentRate = testUrgentRate;
	}

	public Float getTestIPDRate() {
		return testIPDRate;
	}

	public void setTestIPDRate(Float testIPDRate) {
		this.testIPDRate = testIPDRate;
	}

	public Float getTestNormalRate() {
		return testNormalRate;
	}

	public void setTestNormalRate(Float testNormalRate) {
		this.testNormalRate = testNormalRate;
	}

	public Float getTestUnit() {
		return testUnit;
	}

	public void setTestUnit(Float testUnit) {
		this.testUnit = testUnit;
	}

	public Float getTestDrCommission() {
		return testDrCommission;
	}

	public void setTestDrCommission(Float testDrCommission) {
		this.testDrCommission = testDrCommission;
	}

	public String getTestDesc() {
		return testDesc;
	}

	public void setTestDesc(String testDesc) {
		this.testDesc = testDesc;
	}

	public String getTestStatus() {
		return testStatus;
	}

	public void setTestStatus(String testStatus) {
		this.testStatus = testStatus;
	}

	public TestGroup getTestGroup() {
		return testGroup;
	}

	public void setTestGroup(TestGroup testGroup) {
		this.testGroup = testGroup;
	}

}
