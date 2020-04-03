package com.mgsoft.module.giravi.beans;

import java.io.Serializable;
import java.util.Collection;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mgsoft.module.customer.beans.Customer;

@Entity
@Table
public class Loan implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Integer id;
	
	@Column(unique = true)
	String loanNumber;
	
	@Column
	@JsonFormat(pattern = "dd-MM-yyyy", shape = JsonFormat.Shape.STRING)
	Date loanDate;

	@Column
	Float loanAmount;
	
	@Column
	Float tenurePeriod;
	
	@Column
	String tenureType;

	@Column
	Float intrestRate;
	
	@Column
	Float intrestAmount;
	
	@Column
	Float netPayableAmount;
	
	@Column
	String description;
	
	@Column
	String status;
	
	@Column
	String closeStatus;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinTable(name="loan_giraviitem", joinColumns = {@JoinColumn(name="loan_id")}, inverseJoinColumns = {@JoinColumn(name="giraviitem_id")})
	Collection<GiraviItem> giraviItems;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinTable(name="loan_loantransaction", joinColumns = {@JoinColumn(name="loan_id")}, inverseJoinColumns = {@JoinColumn(name="tran_id")})
	Collection<LoanTransaction> loanTransactions;

	@ManyToOne
	@JsonIgnore
	Customer customer;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Float getLoanAmount() {
		return loanAmount;
	}

	public void setLoanAmount(Float loanAmount) {
		this.loanAmount = loanAmount;
	}

	public Float getIntrestRate() {
		return intrestRate;
	}

	public void setIntrestRate(Float intrestRate) {
		this.intrestRate = intrestRate;
	}

	public Collection<GiraviItem> getGiraviItems() {
		return giraviItems;
	}

	public void setGiraviItems(List<GiraviItem> giraviItems) {
		this.giraviItems = giraviItems;
	}

	public Collection<LoanTransaction> getLoanTransactions() {
		return loanTransactions;
	}

	public void setLoanTransactions(List<LoanTransaction> loanTransactions) {
		this.loanTransactions = loanTransactions;
	}
	
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public void setGiraviItems(Collection<GiraviItem> giraviItems) {
		this.giraviItems = giraviItems;
	}

	public void setLoanTransactions(Collection<LoanTransaction> loanTransactions) {
		this.loanTransactions = loanTransactions;
	}

	public String getLoanNumber() {
		return loanNumber;
	}

	public void setLoanNumber(String loanNumber) {
		this.loanNumber = loanNumber;
	}

	public Date getLoanDate() {
		return loanDate;
	}

	public void setLoanDate(Date loanDate) {
		this.loanDate = loanDate;
	}

	public Float getTenurePeriod() {
		return tenurePeriod;
	}

	public void setTenurePeriod(Float tenurePeriod) {
		this.tenurePeriod = tenurePeriod;
	}

	public String getTenureType() {
		return tenureType;
	}

	public void setTenureType(String tenureType) {
		this.tenureType = tenureType;
	}

	public Float getIntrestAmount() {
		return intrestAmount;
	}

	public void setIntrestAmount(Float intrestAmount) {
		this.intrestAmount = intrestAmount;
	}

	public Float getNetPayableAmount() {
		return netPayableAmount;
	}

	public void setNetPayableAmount(Float netPayableAmount) {
		this.netPayableAmount = netPayableAmount;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCloseStatus() {
		return closeStatus;
	}

	public void setCloseStatus(String closeStatus) {
		this.closeStatus = closeStatus;
	}

	public Loan() {
		super();
	}

	@Override
	public String toString() {
		return "Loan [id=" + id + ", loanNumber=" + loanNumber + ", loanDate=" + loanDate + ", loanAmount=" + loanAmount
				+ ", tenurePeriod=" + tenurePeriod + ", tenureType=" + tenureType + ", intrestRate=" + intrestRate
				+ ", intrestAmount=" + intrestAmount + ", netPayableAmount=" + netPayableAmount + "]";
	}

	
}
