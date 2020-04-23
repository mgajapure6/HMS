package com.mgsoft.module.appointment.beans;

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
public class AppointmentLine {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column
	private Long lineTrno;
	
	@Column
	private Long srno;
	
	@Column
	private String patientName;
	
	@Column
	private String doctorName;
	
	@Column
	private Long doctorId;
	
	@Column
	private String visitTime;
	
	@Column
	private Long statusId;

	@ManyToOne
	@JsonIgnore
	private AppointmentHead head;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getSrno() {
		return srno;
	}

	public void setSrno(Long srno) {
		this.srno = srno;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public Long getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Long doctorId) {
		this.doctorId = doctorId;
	}

	public String getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(String visitTime) {
		this.visitTime = visitTime;
	}

	public Long getStatusId() {
		return statusId;
	}

	public void setStatusId(Long statusId) {
		this.statusId = statusId;
	}

	public Long getLineTrno() {
		return lineTrno;
	}

	public void setLineTrno(Long lineTrno) {
		this.lineTrno = lineTrno;
	}

	public AppointmentHead getHead() {
		return head;
	}

	public void setHead(AppointmentHead head) {
		this.head = head;
	}
	
	@Override
	public String toString() {
		return "AppointmentLine [srno=" + srno + ", patientName=" + patientName + ", doctorName=" + doctorName
				+ ", doctorId=" + doctorId + ", visitTime=" + visitTime + ", statusId=" + statusId + ", lineTrno="
				+ lineTrno + "]";
	}	
	
	
}
