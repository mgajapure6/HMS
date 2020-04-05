package com.mgsoft.module.patient.beans;

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
public class InsuranceMaster implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column
	private String type;
	
	@Column
	private String holderName;
	
	@Column
	private String planName;
	
	@Column
	private String insuredName;
	
	@Column
	private String insuredMobile;
	
	@Column
	private String insuredAddr1;
	
	@Column
	private String insuredAddr2;
	
	@Column
	private String insuredSocialSecurityNo;
	
	@Column
	private String policyId;
	
	@Column
	private String policyNo;
	
	@Column
	private String groupNo;
	
	@Column
	private String claimAddr;
	
	@Column
	private String relationship;
	
	@ManyToOne
	@JsonIgnore
	private PatientMaster patientMaster;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getHolderName() {
		return holderName;
	}

	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getInsuredName() {
		return insuredName;
	}

	public void setInsuredName(String insuredName) {
		this.insuredName = insuredName;
	}

	public String getInsuredMobile() {
		return insuredMobile;
	}

	public void setInsuredMobile(String insuredMobile) {
		this.insuredMobile = insuredMobile;
	}

	public String getInsuredAddr1() {
		return insuredAddr1;
	}

	public void setInsuredAddr1(String insuredAddr1) {
		this.insuredAddr1 = insuredAddr1;
	}

	public String getInsuredAddr2() {
		return insuredAddr2;
	}

	public void setInsuredAddr2(String insuredAddr2) {
		this.insuredAddr2 = insuredAddr2;
	}

	public String getInsuredSocialSecurityNo() {
		return insuredSocialSecurityNo;
	}

	public void setInsuredSocialSecurityNo(String insuredSocialSecurityNo) {
		this.insuredSocialSecurityNo = insuredSocialSecurityNo;
	}

	public String getPolicyId() {
		return policyId;
	}

	public void setPolicyId(String policyId) {
		this.policyId = policyId;
	}

	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}

	public String getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}

	public String getClaimAddr() {
		return claimAddr;
	}

	public void setClaimAddr(String claimAddr) {
		this.claimAddr = claimAddr;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public PatientMaster getPatientMaster() {
		return patientMaster;
	}

	public void setPatientMaster(PatientMaster patientMaster) {
		this.patientMaster = patientMaster;
	}
	
	

}
