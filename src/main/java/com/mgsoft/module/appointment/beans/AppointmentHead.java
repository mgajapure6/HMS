package com.mgsoft.module.appointment.beans;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class AppointmentHead {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long headTrno;
	
	@Column
	private Date appointment_date;
	
	@Column
	private String from_time;
	
	@Column
	private String to_time;
	
	@Column
	private Long enter_by;
	
	@Column
	private Long enter_date;

	@Column
	private String status;

	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinTable(name="apointmentHead_appointmentLine", 
			   joinColumns = {@JoinColumn(name="headTrno")},
			   inverseJoinColumns = {@JoinColumn(name="lineTrno")})
	private Collection<AppointmentLine> allLineDtls = new ArrayList<AppointmentLine>();
	
	public Long getHeadTrno() {
		return headTrno;
	}

	public void setHeadTrno(Long headTrno) {
		this.headTrno = headTrno;
	}

	public Date getAppointment_date() {
		return appointment_date;
	}

	public void setAppointment_date(Date appointment_date) {
		this.appointment_date = appointment_date;
	}

	public String getFrom_time() {
		return from_time;
	}

	public void setFrom_time(String from_time) {
		this.from_time = from_time;
	}

	public String getTo_time() {
		return to_time;
	}

	public void setTo_time(String to_time) {
		this.to_time = to_time;
	}

	public Long getEnter_by() {
		return enter_by;
	}

	public void setEnter_by(Long enter_by) {
		this.enter_by = enter_by;
	}

	public Long getEnter_date() {
		return enter_date;
	}

	public void setEnter_date(Long enter_date) {
		this.enter_date = enter_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public Collection<AppointmentLine> getAllLineDtls() {
		return allLineDtls;
	}

	public void setAllLineDtls(Collection<AppointmentLine> allLineDtls) {
		this.allLineDtls = allLineDtls;
	}

	@Override
	public String toString() {
		return "AppointmentHead [headTrno=" + headTrno + ", appointment_date=" + appointment_date + ", from_time=" + from_time
				+ ", to_time=" + to_time + ", enter_by=" + enter_by + ", enter_date=" + enter_date + "]";
	}
	
}
