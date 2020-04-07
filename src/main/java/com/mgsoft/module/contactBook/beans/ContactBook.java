package com.mgsoft.module.contactBook.beans;

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
public class ContactBook implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	private Date contRegDate;

	@Column
	private String contStartLatter;

	@Column
	private String contFName;

	@Column
	private String contMName;

	@Column
	private String contLName;

	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	private Date contDob;

	@Column
	private String contGender;

	@Column
	private String contMob;

	@Column
	private String contWhatsupMob;

	@Column
	private String contAltMob;

	@Column
	private String contHomeMob;

	@Column
	private String contHomeLLNo;

	@Column
	private String contWorkLLNo;

	@Column
	private String contEmail;

	@Column
	private String contCompany;

	@Column
	private String contJobPost;

	@Column
	private String contEducation;

	@Column
	private String contOccupation;

	@Column
	private String contHomeAddr;

	@Column
	private String contWorkAddr;

	@Column
	private String contWorkWeb;

	@Column
	private String contPersonalWeb;

	@Column
	private String contFbLink;

	@Column
	private String contTwitLink;

	@Column
	private String contInstaLink;

	@Column
	private String contOtherLink;

	@Column
	private String contNotes;

	@Column
	private String contStatus;

	@Column
	private String contFavoriteFlag;

	@Column
	private String contFamilyFlag;

	@Column
	private String contFriendFlag;

	@Column
	private String contOfficematesFlag;

	@Lob
	private byte[] image;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContStartLatter() {
		return contStartLatter;
	}

	public void setContStartLatter(String contStartLatter) {
		this.contStartLatter = contStartLatter;
	}

	public Date getContRegDate() {
		return contRegDate;
	}

	public void setContRegDate(Date contRegDate) {
		this.contRegDate = contRegDate;
	}

	public String getContFName() {
		return contFName;
	}

	public void setContFName(String contFName) {
		this.contFName = contFName;
	}

	public String getContMName() {
		return contMName;
	}

	public void setContMName(String contMName) {
		this.contMName = contMName;
	}

	public String getContLName() {
		return contLName;
	}

	public void setContLName(String contLName) {
		this.contLName = contLName;
	}

	public Date getContDob() {
		return contDob;
	}

	public void setContDob(Date contDob) {
		this.contDob = contDob;
	}

	public String getContGender() {
		return contGender;
	}

	public void setContGender(String contGender) {
		this.contGender = contGender;
	}

	public String getContMob() {
		return contMob;
	}

	public void setContMob(String contMob) {
		this.contMob = contMob;
	}

	public String getContWhatsupMob() {
		return contWhatsupMob;
	}

	public void setContWhatsupMob(String contWhatsupMob) {
		this.contWhatsupMob = contWhatsupMob;
	}

	public String getContAltMob() {
		return contAltMob;
	}

	public void setContAltMob(String contAltMob) {
		this.contAltMob = contAltMob;
	}

	public String getContHomeMob() {
		return contHomeMob;
	}

	public void setContHomeMob(String contHomeMob) {
		this.contHomeMob = contHomeMob;
	}

	public String getContHomeLLNo() {
		return contHomeLLNo;
	}

	public void setContHomeLLNo(String contHomeLLNo) {
		this.contHomeLLNo = contHomeLLNo;
	}

	public String getContWorkLLNo() {
		return contWorkLLNo;
	}

	public void setContWorkLLNo(String contWorkLLNo) {
		this.contWorkLLNo = contWorkLLNo;
	}

	public String getContEmail() {
		return contEmail;
	}

	public void setContEmail(String contEmail) {
		this.contEmail = contEmail;
	}

	public String getContCompany() {
		return contCompany;
	}

	public void setContCompany(String contCompany) {
		this.contCompany = contCompany;
	}

	public String getContJobPost() {
		return contJobPost;
	}

	public void setContJobPost(String contJobPost) {
		this.contJobPost = contJobPost;
	}

	public String getContEducation() {
		return contEducation;
	}

	public void setContEducation(String contEducation) {
		this.contEducation = contEducation;
	}

	public String getContOccupation() {
		return contOccupation;
	}

	public void setContOccupation(String contOccupation) {
		this.contOccupation = contOccupation;
	}

	public String getContHomeAddr() {
		return contHomeAddr;
	}

	public void setContHomeAddr(String contHomeAddr) {
		this.contHomeAddr = contHomeAddr;
	}

	public String getContWorkAddr() {
		return contWorkAddr;
	}

	public void setContWorkAddr(String contWorkAddr) {
		this.contWorkAddr = contWorkAddr;
	}

	public String getContWorkWeb() {
		return contWorkWeb;
	}

	public void setContWorkWeb(String contWorkWeb) {
		this.contWorkWeb = contWorkWeb;
	}

	public String getContPersonalWeb() {
		return contPersonalWeb;
	}

	public void setContPersonalWeb(String contPersonalWeb) {
		this.contPersonalWeb = contPersonalWeb;
	}

	public String getContFbLink() {
		return contFbLink;
	}

	public void setContFbLink(String contFbLink) {
		this.contFbLink = contFbLink;
	}

	public String getContTwitLink() {
		return contTwitLink;
	}

	public void setContTwitLink(String contTwitLink) {
		this.contTwitLink = contTwitLink;
	}

	public String getContInstaLink() {
		return contInstaLink;
	}

	public void setContInstaLink(String contInstaLink) {
		this.contInstaLink = contInstaLink;
	}

	public String getContOtherLink() {
		return contOtherLink;
	}

	public void setContOtherLink(String contOtherLink) {
		this.contOtherLink = contOtherLink;
	}

	public String getContNotes() {
		return contNotes;
	}

	public void setContNotes(String contNotes) {
		this.contNotes = contNotes;
	}

	public String getContStatus() {
		return contStatus;
	}

	public void setContStatus(String contStatus) {
		this.contStatus = contStatus;
	}

	public String getContFavoriteFlag() {
		return contFavoriteFlag;
	}

	public void setContFavoriteFlag(String contFavoriteFlag) {
		this.contFavoriteFlag = contFavoriteFlag;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getContFamilyFlag() {
		return contFamilyFlag;
	}

	public void setContFamilyFlag(String contFamilyFlag) {
		this.contFamilyFlag = contFamilyFlag;
	}

	public String getContFriendFlag() {
		return contFriendFlag;
	}

	public void setContFriendFlag(String contFriendFlag) {
		this.contFriendFlag = contFriendFlag;
	}

	public String getContOfficematesFlag() {
		return contOfficematesFlag;
	}

	public void setContOfficematesFlag(String contOfficematesFlag) {
		this.contOfficematesFlag = contOfficematesFlag;
	}

}
