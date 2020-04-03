package com.mgsoft.module.giravi.beans;

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
public class GiraviItem implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Integer id;

	@Column
	String itmName;
	
	@Column
	String itmMetalType;
	

	@Column
	String itmDesc;

	@Column
	Float itmQty;

	@Column
	Float itmGrossWeight;

	@Column
	String itmGrossWeightUom;

	@Column
	Float itmNetWeight;

	@Column
	String itmNetWeightUom;

	@Column
	Float itmValuation;

	@Column
	Float itmEligibleAmount;
	
	@ManyToOne
	@JsonIgnore
	Loan loan;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getItmName() {
		return itmName;
	}

	public void setItmName(String itmName) {
		this.itmName = itmName;
	}

	public String getItmDesc() {
		return itmDesc;
	}

	public void setItmDesc(String itmDesc) {
		this.itmDesc = itmDesc;
	}

	public Float getItmQty() {
		return itmQty;
	}

	public void setItmQty(Float itmQty) {
		this.itmQty = itmQty;
	}

	public Float getItmGrossWeight() {
		return itmGrossWeight;
	}

	public void setItmGrossWeight(Float itmGrossWeight) {
		this.itmGrossWeight = itmGrossWeight;
	}

	public String getItmGrossWeightUom() {
		return itmGrossWeightUom;
	}

	public void setItmGrossWeightUom(String itmGrossWeightUom) {
		this.itmGrossWeightUom = itmGrossWeightUom;
	}

	public Float getItmNetWeight() {
		return itmNetWeight;
	}

	public void setItmNetWeight(Float itmNetWeight) {
		this.itmNetWeight = itmNetWeight;
	}

	public String getItmNetWeightUom() {
		return itmNetWeightUom;
	}

	public void setItmNetWeightUom(String itmNetWeightUom) {
		this.itmNetWeightUom = itmNetWeightUom;
	}

	public Float getItmValuation() {
		return itmValuation;
	}

	public void setItmValuation(Float itmValuation) {
		this.itmValuation = itmValuation;
	}

	public Float getItmEligibleAmount() {
		return itmEligibleAmount;
	}

	public void setItmEligibleAmount(Float itmEligibleAmount) {
		this.itmEligibleAmount = itmEligibleAmount;
	}
	
	public Loan getLoan() {
		return loan;
	}

	public void setLoan(Loan loan) {
		this.loan = loan;
	}

	public String getItmMetalType() {
		return itmMetalType;
	}

	public void setItmMetalType(String itmMetalType) {
		this.itmMetalType = itmMetalType;
	}

	public GiraviItem() {
		super();
	}
	

	public GiraviItem(Integer id, String itmName, String itmDesc, Float itmQty, Float itmGrossWeight,
			String itmGrossWeightUom, Float itmNetWeight, String itmNetWeightUom, Float itmValuation,
			Float itmEligibleAmount) {
		super();
		this.id = id;
		this.itmName = itmName;
		this.itmDesc = itmDesc;
		this.itmQty = itmQty;
		this.itmGrossWeight = itmGrossWeight;
		this.itmGrossWeightUom = itmGrossWeightUom;
		this.itmNetWeight = itmNetWeight;
		this.itmNetWeightUom = itmNetWeightUom;
		this.itmValuation = itmValuation;
		this.itmEligibleAmount = itmEligibleAmount;
	}

	@Override
	public String toString() {
		return "GiraviItem [id=" + id + ", itmName=" + itmName + ", itmDesc=" + itmDesc + ", itmQty=" + itmQty
				+ ", itmGrossWeight=" + itmGrossWeight + ", itmGrossWeightUom=" + itmGrossWeightUom + ", itmNetWeight="
				+ itmNetWeight + ", itmNetWeightUom=" + itmNetWeightUom + ", itmValuation=" + itmValuation
				+ ", itmEligibleAmount=" + itmEligibleAmount + "]";
	}

	
}
