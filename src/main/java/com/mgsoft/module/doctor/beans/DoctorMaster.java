package com.mgsoft.module.doctor.beans;

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
public class DoctorMaster implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	private Date doctRegDate;

	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	private Date doctJoinDate;

	@Column
	private String doctStartLatter;

	@Column
	private String doctType;

	@Column
	private String doctCode;

	@Column
	private String doctFName;

	@Column
	private String doctMName;

	@Column
	private String doctLName;

	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	private Date doctDob;

	@Column
	private String doctGender;

	@Column
	private String doctMob;

	@Column
	private String doctAltMob;

	@Column
	private String doctHomeMob;

	@Column
	private String doctHomeLLNo;

	@Column
	private String doctWorkLLNo;

	@Column
	private String doctEmailPersonal;

	@Column
	private String doctEmailOfficial;

	@Column
	private String doctCompany;

	@Column
	private String doctJobPost;

	@Column
	private String doctEducation1;

	@Column
	private String doctEducation2;

	@Column
	private String doctEducation3;

	@Column
	private String doctEducation4;

	@Column
	private String doctEducation5;

	@Column
	private String doctEducation6;

	@Column
	private String doctEducation7;

	@Column
	private String doctEducation8;

	@Column
	private String doctEducation9;

	@Column
	private String doctEducation10;

	@Column
	private String doctHomeAddr1;

	@Column
	private String doctHomeAddr2;

	@Column
	private String doctCity;

	@Column
	private String doctState;

	@Column
	private String doctZip;

	@Column
	private String doctLangKnow;

	@Column
	private String doctPersonalWeb;

	@Column
	private String doctMaritalStatus;

	@Column
	private String doctNationality;

	@Column
	private String department;

	@Column
	private String doctNotes;

	@Column
	private String doctStatus;

	@Column
	private String doctIdProof;

	@Column
	private String doctIdProofNum;

	@Lob
	private byte[] doctIdProofDocImg;

	@Column
	private String doctAddrProof;

	@Column
	private String doctAddrProofNum;

	@Lob
	private byte[] doctAddrProofDocImg;

	@Lob
	private byte[] doctImage;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDoctRegDate() {
		return doctRegDate;
	}

	public void setDoctRegDate(Date doctRegDate) {
		this.doctRegDate = doctRegDate;
	}

	public Date getDoctJoinDate() {
		return doctJoinDate;
	}

	public void setDoctJoinDate(Date doctJoinDate) {
		this.doctJoinDate = doctJoinDate;
	}

	public String getDoctStartLatter() {
		return doctStartLatter;
	}

	public void setDoctStartLatter(String doctStartLatter) {
		this.doctStartLatter = doctStartLatter;
	}

	public String getDoctType() {
		return doctType;
	}

	public void setDoctType(String doctType) {
		this.doctType = doctType;
	}

	public String getDoctCode() {
		return doctCode;
	}

	public void setDoctCode(String doctCode) {
		this.doctCode = doctCode;
	}

	public String getDoctFName() {
		return doctFName;
	}

	public void setDoctFName(String doctFName) {
		this.doctFName = doctFName;
	}

	public String getDoctMName() {
		return doctMName;
	}

	public void setDoctMName(String doctMName) {
		this.doctMName = doctMName;
	}

	public String getDoctLName() {
		return doctLName;
	}

	public void setDoctLName(String doctLName) {
		this.doctLName = doctLName;
	}

	public Date getDoctDob() {
		return doctDob;
	}

	public void setDoctDob(Date doctDob) {
		this.doctDob = doctDob;
	}

	public String getDoctGender() {
		return doctGender;
	}

	public void setDoctGender(String doctGender) {
		this.doctGender = doctGender;
	}

	public String getDoctMob() {
		return doctMob;
	}

	public void setDoctMob(String doctMob) {
		this.doctMob = doctMob;
	}

	public String getDoctAltMob() {
		return doctAltMob;
	}

	public void setDoctAltMob(String doctAltMob) {
		this.doctAltMob = doctAltMob;
	}

	public String getDoctHomeMob() {
		return doctHomeMob;
	}

	public void setDoctHomeMob(String doctHomeMob) {
		this.doctHomeMob = doctHomeMob;
	}

	public String getDoctHomeLLNo() {
		return doctHomeLLNo;
	}

	public void setDoctHomeLLNo(String doctHomeLLNo) {
		this.doctHomeLLNo = doctHomeLLNo;
	}

	public String getDoctWorkLLNo() {
		return doctWorkLLNo;
	}

	public void setDoctWorkLLNo(String doctWorkLLNo) {
		this.doctWorkLLNo = doctWorkLLNo;
	}

	public String getDoctEmailPersonal() {
		return doctEmailPersonal;
	}

	public void setDoctEmailPersonal(String doctEmailPersonal) {
		this.doctEmailPersonal = doctEmailPersonal;
	}

	public String getDoctEmailOfficial() {
		return doctEmailOfficial;
	}

	public void setDoctEmailOfficial(String doctEmailOfficial) {
		this.doctEmailOfficial = doctEmailOfficial;
	}

	public String getDoctCompany() {
		return doctCompany;
	}

	public void setDoctCompany(String doctCompany) {
		this.doctCompany = doctCompany;
	}

	public String getDoctJobPost() {
		return doctJobPost;
	}

	public void setDoctJobPost(String doctJobPost) {
		this.doctJobPost = doctJobPost;
	}

	public String getDoctEducation1() {
		return doctEducation1;
	}

	public void setDoctEducation1(String doctEducation1) {
		this.doctEducation1 = doctEducation1;
	}

	public String getDoctEducation2() {
		return doctEducation2;
	}

	public void setDoctEducation2(String doctEducation2) {
		this.doctEducation2 = doctEducation2;
	}

	public String getDoctEducation3() {
		return doctEducation3;
	}

	public void setDoctEducation3(String doctEducation3) {
		this.doctEducation3 = doctEducation3;
	}

	public String getDoctEducation4() {
		return doctEducation4;
	}

	public void setDoctEducation4(String doctEducation4) {
		this.doctEducation4 = doctEducation4;
	}

	public String getDoctEducation5() {
		return doctEducation5;
	}

	public void setDoctEducation5(String doctEducation5) {
		this.doctEducation5 = doctEducation5;
	}

	public String getDoctEducation6() {
		return doctEducation6;
	}

	public void setDoctEducation6(String doctEducation6) {
		this.doctEducation6 = doctEducation6;
	}

	public String getDoctEducation7() {
		return doctEducation7;
	}

	public void setDoctEducation7(String doctEducation7) {
		this.doctEducation7 = doctEducation7;
	}

	public String getDoctEducation8() {
		return doctEducation8;
	}

	public void setDoctEducation8(String doctEducation8) {
		this.doctEducation8 = doctEducation8;
	}

	public String getDoctEducation9() {
		return doctEducation9;
	}

	public void setDoctEducation9(String doctEducation9) {
		this.doctEducation9 = doctEducation9;
	}

	public String getDoctEducation10() {
		return doctEducation10;
	}

	public void setDoctEducation10(String doctEducation10) {
		this.doctEducation10 = doctEducation10;
	}

	public String getDoctHomeAddr1() {
		return doctHomeAddr1;
	}

	public void setDoctHomeAddr1(String doctHomeAddr1) {
		this.doctHomeAddr1 = doctHomeAddr1;
	}

	public String getDoctHomeAddr2() {
		return doctHomeAddr2;
	}

	public void setDoctHomeAddr2(String doctHomeAddr2) {
		this.doctHomeAddr2 = doctHomeAddr2;
	}

	public String getDoctCity() {
		return doctCity;
	}

	public void setDoctCity(String doctCity) {
		this.doctCity = doctCity;
	}

	public String getDoctState() {
		return doctState;
	}

	public void setDoctState(String doctState) {
		this.doctState = doctState;
	}

	public String getDoctZip() {
		return doctZip;
	}

	public void setDoctZip(String doctZip) {
		this.doctZip = doctZip;
	}

	public String getDoctLangKnow() {
		return doctLangKnow;
	}

	public void setDoctLangKnow(String doctLangKnow) {
		this.doctLangKnow = doctLangKnow;
	}

	public String getDoctPersonalWeb() {
		return doctPersonalWeb;
	}

	public void setDoctPersonalWeb(String doctPersonalWeb) {
		this.doctPersonalWeb = doctPersonalWeb;
	}

	public String getDoctMaritalStatus() {
		return doctMaritalStatus;
	}

	public void setDoctMaritalStatus(String doctMaritalStatus) {
		this.doctMaritalStatus = doctMaritalStatus;
	}

	public String getDoctNationality() {
		return doctNationality;
	}

	public void setDoctNationality(String doctNationality) {
		this.doctNationality = doctNationality;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDoctNotes() {
		return doctNotes;
	}

	public void setDoctNotes(String doctNotes) {
		this.doctNotes = doctNotes;
	}

	public String getDoctStatus() {
		return doctStatus;
	}

	public void setDoctStatus(String doctStatus) {
		this.doctStatus = doctStatus;
	}

	public String getDoctIdProof() {
		return doctIdProof;
	}

	public void setDoctIdProof(String doctIdProof) {
		this.doctIdProof = doctIdProof;
	}

	public String getDoctIdProofNum() {
		return doctIdProofNum;
	}

	public void setDoctIdProofNum(String doctIdProofNum) {
		this.doctIdProofNum = doctIdProofNum;
	}

	public byte[] getDoctIdProofDocImg() {
		return doctIdProofDocImg;
	}

	public void setDoctIdProofDocImg(byte[] doctIdProofDocImg) {
		this.doctIdProofDocImg = doctIdProofDocImg;
	}

	public String getDoctAddrProof() {
		return doctAddrProof;
	}

	public void setDoctAddrProof(String doctAddrProof) {
		this.doctAddrProof = doctAddrProof;
	}

	public String getDoctAddrProofNum() {
		return doctAddrProofNum;
	}

	public void setDoctAddrProofNum(String doctAddrProofNum) {
		this.doctAddrProofNum = doctAddrProofNum;
	}

	public byte[] getDoctAddrProofDocImg() {
		return doctAddrProofDocImg;
	}

	public void setDoctAddrProofDocImg(byte[] doctAddrProofDocImg) {
		this.doctAddrProofDocImg = doctAddrProofDocImg;
	}

	public byte[] getDoctImage() {
		return doctImage;
	}

	public void setDoctImage(byte[] doctImage) {
		this.doctImage = doctImage;
	}

}
