package com.mgsoft.module.patient.beans;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table
public class PatientMaster implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	private Date patientRegDate;

	@Column
	private String patientFName;

	@Column
	private String patientMName;

	@Column
	private String patientLName;

	@Column
	private String patientAddr1;

	@Column
	private String patientAddr2;

	@Column
	private String patientCity;

	@Column
	private String patientState;

	@Column
	private String patientZip;

	@Column
	private String patientMob;

	@Column
	private String patientAltMob;

	@Column
	private String patientEmail;

	@Column
	private String patientLLNo;

	@Column
	private String patientGender;

	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	private Date patientDob;

	@Column
	private String patientLangKnow;

	@Column
	private String patientEdu;

	@Column
	private String patientOccup;

	@Column
	private String patientMStatus;

	@Column
	private String patientIdProof;

	@Column
	private String patientIdProofNum;

	@Lob
	private byte[] patientIdProofDocImg;

	@Column
	private String patientAddrProof;

	@Column
	private String patientAddrProofNum;

	@Lob
	private byte[] patientAddrProofDocImg;

	@Lob
	private byte[] patientImage;

	@Column
	private String patientStatus;
	
	@Column
	private String gardFName;

	@Column
	private String gardMName;

	@Column
	private String gardLName;

	@Column
	private String gardAddr1;

	@Column
	private String gardAddr2;

	@Column
	private String gardCity;

	@Column
	private String gardState;

	@Column
	private String gardZip;

	@Column
	private String gardMob;

	@Column
	private String gardAltMob;

	@Column
	private String gardEmail;

	@Column
	private String gardLLNo;

	@Column
	private String gardGender;

	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	private Date gardDob;

	@Column
	private String gardLangKnow;

	@Column
	private String gardEdu;

	@Column
	private String gardOccup;

	@Column
	private String gardMStatus;

	@Column
	private String gardIdProof;

	@Column
	private String gardIdProofNum;

	@Lob
	private byte[] gardIdProofDocImg;

	@Column
	private String gardAddrProof;

	@Column
	private String gardAddrProofNum;

	@Lob
	private byte[] gardAddrProofDocImg;

	@Lob
	private byte[] gardPatientImg;

	@Column
	private String gardStatus;

	@Column
	private String insurType;
	
	@Column
	private String insurHolderName;
	
	@Column
	private String insurPlanName;
	
	@Column
	private String insurName;
	
	@Column
	private String insurMobile;
	
	@Column
	private String insurAddr1;
	
	@Column
	private String insurAddr2;
	
	@Column
	private String insurSocialSecurityNo;
	
	@Column
	private String insurPolicyId;
	
	@Column
	private String insurPolicyNo;
	
	@Column
	private String insurGroupNo;
	
	@Column
	private String insurClaimAddr;
	
	@Column
	private String insurRelationship;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getPatientRegDate() {
		return patientRegDate;
	}

	public void setPatientRegDate(Date patientRegDate) {
		this.patientRegDate = patientRegDate;
	}

	public String getPatientFName() {
		return patientFName;
	}

	public void setPatientFName(String patientFName) {
		this.patientFName = patientFName;
	}

	public String getPatientMName() {
		return patientMName;
	}

	public void setPatientMName(String patientMName) {
		this.patientMName = patientMName;
	}

	public String getPatientLName() {
		return patientLName;
	}

	public void setPatientLName(String patientLName) {
		this.patientLName = patientLName;
	}

	public String getPatientAddr1() {
		return patientAddr1;
	}

	public void setPatientAddr1(String patientAddr1) {
		this.patientAddr1 = patientAddr1;
	}

	public String getPatientAddr2() {
		return patientAddr2;
	}

	public void setPatientAddr2(String patientAddr2) {
		this.patientAddr2 = patientAddr2;
	}

	public String getPatientCity() {
		return patientCity;
	}

	public void setPatientCity(String patientCity) {
		this.patientCity = patientCity;
	}

	public String getPatientState() {
		return patientState;
	}

	public void setPatientState(String patientState) {
		this.patientState = patientState;
	}

	public String getPatientZip() {
		return patientZip;
	}

	public void setPatientZip(String patientZip) {
		this.patientZip = patientZip;
	}

	public String getPatientMob() {
		return patientMob;
	}

	public void setPatientMob(String patientMob) {
		this.patientMob = patientMob;
	}

	public String getPatientAltMob() {
		return patientAltMob;
	}

	public void setPatientAltMob(String patientAltMob) {
		this.patientAltMob = patientAltMob;
	}

	public String getPatientEmail() {
		return patientEmail;
	}

	public void setPatientEmail(String patientEmail) {
		this.patientEmail = patientEmail;
	}

	public String getPatientLLNo() {
		return patientLLNo;
	}

	public void setPatientLLNo(String patientLLNo) {
		this.patientLLNo = patientLLNo;
	}

	public String getPatientGender() {
		return patientGender;
	}

	public void setPatientGender(String patientGender) {
		this.patientGender = patientGender;
	}

	public Date getPatientDob() {
		return patientDob;
	}

	public void setPatientDob(Date patientDob) {
		this.patientDob = patientDob;
	}

	public String getPatientLangKnow() {
		return patientLangKnow;
	}

	public void setPatientLangKnow(String patientLangKnow) {
		this.patientLangKnow = patientLangKnow;
	}

	public String getPatientEdu() {
		return patientEdu;
	}

	public void setPatientEdu(String patientEdu) {
		this.patientEdu = patientEdu;
	}

	public String getPatientOccup() {
		return patientOccup;
	}

	public void setPatientOccup(String patientOccup) {
		this.patientOccup = patientOccup;
	}

	public String getPatientMStatus() {
		return patientMStatus;
	}

	public void setPatientMStatus(String patientMStatus) {
		this.patientMStatus = patientMStatus;
	}

	public String getPatientIdProof() {
		return patientIdProof;
	}

	public void setPatientIdProof(String patientIdProof) {
		this.patientIdProof = patientIdProof;
	}

	public String getPatientIdProofNum() {
		return patientIdProofNum;
	}

	public void setPatientIdProofNum(String patientIdProofNum) {
		this.patientIdProofNum = patientIdProofNum;
	}

	public byte[] getPatientIdProofDocImg() {
		return patientIdProofDocImg;
	}

	public void setPatientIdProofDocImg(byte[] patientIdProofDocImg) {
		this.patientIdProofDocImg = patientIdProofDocImg;
	}

	public String getPatientAddrProof() {
		return patientAddrProof;
	}

	public void setPatientAddrProof(String patientAddrProof) {
		this.patientAddrProof = patientAddrProof;
	}

	public String getPatientAddrProofNum() {
		return patientAddrProofNum;
	}

	public void setPatientAddrProofNum(String patientAddrProofNum) {
		this.patientAddrProofNum = patientAddrProofNum;
	}

	public byte[] getPatientAddrProofDocImg() {
		return patientAddrProofDocImg;
	}

	public void setPatientAddrProofDocImg(byte[] patientAddrProofDocImg) {
		this.patientAddrProofDocImg = patientAddrProofDocImg;
	}

	public byte[] getPatientImage() {
		return patientImage;
	}

	public void setPatientImage(byte[] patientImage) {
		this.patientImage = patientImage;
	}

	public String getPatientStatus() {
		return patientStatus;
	}

	public void setPatientStatus(String patientStatus) {
		this.patientStatus = patientStatus;
	}

	public String getGardFName() {
		return gardFName;
	}

	public void setGardFName(String gardFName) {
		this.gardFName = gardFName;
	}

	public String getGardMName() {
		return gardMName;
	}

	public void setGardMName(String gardMName) {
		this.gardMName = gardMName;
	}

	public String getGardLName() {
		return gardLName;
	}

	public void setGardLName(String gardLName) {
		this.gardLName = gardLName;
	}

	public String getGardAddr1() {
		return gardAddr1;
	}

	public void setGardAddr1(String gardAddr1) {
		this.gardAddr1 = gardAddr1;
	}

	public String getGardAddr2() {
		return gardAddr2;
	}

	public void setGardAddr2(String gardAddr2) {
		this.gardAddr2 = gardAddr2;
	}

	public String getGardCity() {
		return gardCity;
	}

	public void setGardCity(String gardCity) {
		this.gardCity = gardCity;
	}

	public String getGardState() {
		return gardState;
	}

	public void setGardState(String gardState) {
		this.gardState = gardState;
	}

	public String getGardZip() {
		return gardZip;
	}

	public void setGardZip(String gardZip) {
		this.gardZip = gardZip;
	}

	public String getGardMob() {
		return gardMob;
	}

	public void setGardMob(String gardMob) {
		this.gardMob = gardMob;
	}

	public String getGardAltMob() {
		return gardAltMob;
	}

	public void setGardAltMob(String gardAltMob) {
		this.gardAltMob = gardAltMob;
	}

	public String getGardEmail() {
		return gardEmail;
	}

	public void setGardEmail(String gardEmail) {
		this.gardEmail = gardEmail;
	}

	public String getGardLLNo() {
		return gardLLNo;
	}

	public void setGardLLNo(String gardLLNo) {
		this.gardLLNo = gardLLNo;
	}

	public String getGardGender() {
		return gardGender;
	}

	public void setGardGender(String gardGender) {
		this.gardGender = gardGender;
	}

	public Date getGardDob() {
		return gardDob;
	}

	public void setGardDob(Date gardDob) {
		this.gardDob = gardDob;
	}

	public String getGardLangKnow() {
		return gardLangKnow;
	}

	public void setGardLangKnow(String gardLangKnow) {
		this.gardLangKnow = gardLangKnow;
	}

	public String getGardEdu() {
		return gardEdu;
	}

	public void setGardEdu(String gardEdu) {
		this.gardEdu = gardEdu;
	}

	public String getGardOccup() {
		return gardOccup;
	}

	public void setGardOccup(String gardOccup) {
		this.gardOccup = gardOccup;
	}

	public String getGardMStatus() {
		return gardMStatus;
	}

	public void setGardMStatus(String gardMStatus) {
		this.gardMStatus = gardMStatus;
	}

	public String getGardIdProof() {
		return gardIdProof;
	}

	public void setGardIdProof(String gardIdProof) {
		this.gardIdProof = gardIdProof;
	}

	public String getGardIdProofNum() {
		return gardIdProofNum;
	}

	public void setGardIdProofNum(String gardIdProofNum) {
		this.gardIdProofNum = gardIdProofNum;
	}

	public byte[] getGardIdProofDocImg() {
		return gardIdProofDocImg;
	}

	public void setGardIdProofDocImg(byte[] gardIdProofDocImg) {
		this.gardIdProofDocImg = gardIdProofDocImg;
	}

	public String getGardAddrProof() {
		return gardAddrProof;
	}

	public void setGardAddrProof(String gardAddrProof) {
		this.gardAddrProof = gardAddrProof;
	}

	public String getGardAddrProofNum() {
		return gardAddrProofNum;
	}

	public void setGardAddrProofNum(String gardAddrProofNum) {
		this.gardAddrProofNum = gardAddrProofNum;
	}

	public byte[] getGardAddrProofDocImg() {
		return gardAddrProofDocImg;
	}

	public void setGardAddrProofDocImg(byte[] gardAddrProofDocImg) {
		this.gardAddrProofDocImg = gardAddrProofDocImg;
	}

	public byte[] getGardPatientImg() {
		return gardPatientImg;
	}

	public void setGardPatientImg(byte[] gardPatientImg) {
		this.gardPatientImg = gardPatientImg;
	}

	public String getGardStatus() {
		return gardStatus;
	}

	public void setGardStatus(String gardStatus) {
		this.gardStatus = gardStatus;
	}

	public String getInsurType() {
		return insurType;
	}

	public void setInsurType(String insurType) {
		this.insurType = insurType;
	}

	public String getInsurHolderName() {
		return insurHolderName;
	}

	public void setInsurHolderName(String insurHolderName) {
		this.insurHolderName = insurHolderName;
	}

	public String getInsurPlanName() {
		return insurPlanName;
	}

	public void setInsurPlanName(String insurPlanName) {
		this.insurPlanName = insurPlanName;
	}

	public String getInsurName() {
		return insurName;
	}

	public void setInsurName(String insurName) {
		this.insurName = insurName;
	}

	public String getInsurMobile() {
		return insurMobile;
	}

	public void setInsurMobile(String insurMobile) {
		this.insurMobile = insurMobile;
	}

	public String getInsurAddr1() {
		return insurAddr1;
	}

	public void setInsurAddr1(String insurAddr1) {
		this.insurAddr1 = insurAddr1;
	}

	public String getInsurAddr2() {
		return insurAddr2;
	}

	public void setInsurAddr2(String insurAddr2) {
		this.insurAddr2 = insurAddr2;
	}

	public String getInsurSocialSecurityNo() {
		return insurSocialSecurityNo;
	}

	public void setInsurSocialSecurityNo(String insurSocialSecurityNo) {
		this.insurSocialSecurityNo = insurSocialSecurityNo;
	}

	public String getInsurPolicyId() {
		return insurPolicyId;
	}

	public void setInsurPolicyId(String insurPolicyId) {
		this.insurPolicyId = insurPolicyId;
	}

	public String getInsurPolicyNo() {
		return insurPolicyNo;
	}

	public void setInsurPolicyNo(String insurPolicyNo) {
		this.insurPolicyNo = insurPolicyNo;
	}

	public String getInsurGroupNo() {
		return insurGroupNo;
	}

	public void setInsurGroupNo(String insurGroupNo) {
		this.insurGroupNo = insurGroupNo;
	}

	public String getInsurClaimAddr() {
		return insurClaimAddr;
	}

	public void setInsurClaimAddr(String insurClaimAddr) {
		this.insurClaimAddr = insurClaimAddr;
	}

	public String getInsurRelationship() {
		return insurRelationship;
	}

	public void setInsurRelationship(String insurRelationship) {
		this.insurRelationship = insurRelationship;
	}

}
