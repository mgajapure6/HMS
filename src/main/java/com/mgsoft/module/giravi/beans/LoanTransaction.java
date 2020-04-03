package com.mgsoft.module.giravi.beans;

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
public class LoanTransaction implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Integer id;

	@Column
	Float tranAmount;

	@Column
	String tranDesc;

	@Column
	String tranMethod;

	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	Date tranDate;

	@ManyToOne
	@JsonIgnore
	Loan loan;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Float getTranAmount() {
		return tranAmount;
	}

	public void setTranAmount(Float tranAmount) {
		this.tranAmount = tranAmount;
	}

	public String getTranDesc() {
		return tranDesc;
	}

	public void setTranDesc(String tranDesc) {
		this.tranDesc = tranDesc;
	}

	public String getTranMethod() {
		return tranMethod;
	}

	public void setTranMethod(String tranMethod) {
		this.tranMethod = tranMethod;
	}

	public Date getTranDate() {
		return tranDate;
	}

	public void setTranDate(Date tranDate) {
		this.tranDate = tranDate;
	}

	public Loan getLoan() {
		return loan;
	}

	public void setLoan(Loan loan) {
		this.loan = loan;
	}

	public LoanTransaction(Integer id, Float tranAmount, String tranDesc, Loan loan) {
		super();
		this.id = id;
		this.tranAmount = tranAmount;
		this.tranDesc = tranDesc;
		this.loan = loan;
	}

	public LoanTransaction() {
		super();
	}

}
