package com.mgsoft.module.patient.beans;

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
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class PatientMaster implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column
	private Date regDate;

	@Column
	private String firstName;

	@Column
	private String middleName;

	@Column
	private String lastName;

	@Column
	private String address1;

	@Column
	private String address2;

	@Column
	private String city;

	@Column
	private String state;

	@Column
	private String zip;

	@Column
	private String mobile;

	@Column
	private String altMobile;

	@Column
	private String email;

	@Column
	private String landlineNo;

	@Column
	private String gender;

	@Column
	private Date dob;

	@Column
	private String languageKnow;

	@Column
	private String education;

	@Column
	private String occupation;

	@Column
	private String maritalStatus;

	@Column
	private String idProof;

	@Column
	private String idProofNumber;

	@Lob
	private byte[] idProofDocImage;

	@Column
	private String addrProof;

	@Column
	private String addrProofNumber;

	@Lob
	private byte[] addrProofDocImage;

	@Lob
	private byte[] patientImage;

	@Column
	private String status;

	@OneToMany(cascade = { CascadeType.ALL })
	@JoinTable(name = "patient_insurance", joinColumns = { @JoinColumn(name = "patient_id") }, inverseJoinColumns = {
			@JoinColumn(name = "insurance_id") })
	private List<InsuranceMaster> insuranceMasters = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAltMobile() {
		return altMobile;
	}

	public void setAltMobile(String altMobile) {
		this.altMobile = altMobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLandlineNo() {
		return landlineNo;
	}

	public void setLandlineNo(String landlineNo) {
		this.landlineNo = landlineNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}


	public String getLanguageKnow() {
		return languageKnow;
	}

	public void setLanguageKnow(String languageKnow) {
		this.languageKnow = languageKnow;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getIdProof() {
		return idProof;
	}

	public void setIdProof(String idProof) {
		this.idProof = idProof;
	}

	public String getIdProofNumber() {
		return idProofNumber;
	}

	public void setIdProofNumber(String idProofNumber) {
		this.idProofNumber = idProofNumber;
	}

	public byte[] getIdProofDocImage() {
		return idProofDocImage;
	}

	public void setIdProofDocImage(byte[] idProofDocImage) {
		this.idProofDocImage = idProofDocImage;
	}

	public String getAddrProof() {
		return addrProof;
	}

	public void setAddrProof(String addrProof) {
		this.addrProof = addrProof;
	}

	public String getAddrProofNumber() {
		return addrProofNumber;
	}

	public void setAddrProofNumber(String addrProofNumber) {
		this.addrProofNumber = addrProofNumber;
	}

	public byte[] getAddrProofDocImage() {
		return addrProofDocImage;
	}

	public void setAddrProofDocImage(byte[] addrProofDocImage) {
		this.addrProofDocImage = addrProofDocImage;
	}

	public byte[] getPatientImage() {
		return patientImage;
	}

	public void setPatientImage(byte[] patientImage) {
		this.patientImage = patientImage;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<InsuranceMaster> getInsuranceMasters() {
		return insuranceMasters;
	}

	public void setInsuranceMasters(List<InsuranceMaster> insuranceMasters) {
		this.insuranceMasters = insuranceMasters;
	}

}
