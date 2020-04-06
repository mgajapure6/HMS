<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="com.fasterxml.jackson.databind.SerializationFeature"%>
<%
	ObjectMapper mapper = new ObjectMapper();
	mapper.disable(SerializationFeature.FAIL_ON_EMPTY_BEANS);
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.alert {
	margin-top: 10px;
}

.stepFormSectionDiv {
	display: none;
}

.current {
	display: block;
}

.wizard .content {
	border-top: 1px solid rgba(72, 94, 144, 0.16);
	border-bottom: 1px solid rgba(72, 94, 144, 0.16);
}
</style>
<link href="assets/css/avatarSquare.css" rel="stylesheet">
</head>
<body>
	<input type="hidden" value="${patient.id == null ? 0 : patient.id}" id="patientId">
	<input type="hidden" value="${flag}" id="patientFlag">
	<div id="fixed-header" class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="javascript:;">Patient</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Patient' : 'Update Patient'}</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Patient' : 'Update Patient'}</h4>
		</div>
		<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 formCancelBtn">
			<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
		</button>
	</div>
	<div class="main-container wizard clearfix">
		<form id="patientForm">
			<ul class="steps steps-lg steps-justified pd-t-15 pd-b-15 pd-r-20 pd-l-20">
				<li class="step-item active">
					<a href="javascript:;" class="step-link">
						<span class="step-icon"><i data-feather="user"></i></span> <span class="step-title"> 1. Patient Information</span>
					</a>
				</li>
				<li class="step-item">
					<a href="javascript:;" class="step-link">
						<span class="step-icon"><i data-feather="users"></i></span> <span class="step-title"> 2. Gardian Information</span>
					</a>
				</li>
				<li class="step-item">
					<a href="javascript:;" class="step-link">
						<span class="step-icon"><i data-feather="credit-card"></i></span> <span class="step-title"> 3. Insurance Information</span>
					</a>
				</li>
				<li class="step-item">
					<a href="javascript:;" class="step-link">
						<span class="step-icon"><i data-feather="save"></i></span> <span class="step-title"> 4. Confirm & Save</span>
					</a>
				</li>
			</ul>
			<div class="form-div pd-20 content clearfix">
				<div id="personalInfoDiv" class="stepFormSectionDiv">
					<h4 class="">Personal Information</h4>
					<hr>
					<div data-label="Patient Personal Information" class="">
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="patientFName" class="mandlabel">First Name</label>
									<input type="text" id="patientFName" name="" class="form-control patientFName mandatory" placeholder="Enter Patient First Name" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="patientLName" class="mandlabel">Last Name</label>
									<input type="text" id="patientLName" name="" class="form-control patientLName mandatory" placeholder="Enter Patient Last Name" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="patientMName" class="">Middle Name</label>
									<input type="text" id="patientMName" name="" class="form-control patientMName" placeholder="Enter Patient Middle Name">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="patientGender" class="">Gender</label>
									<select id="patientGender" name="" class="form-control" required>
										<option selected value="Male">Male</option>
										<option value="Female">Female</option>
										<option value="Other">Other</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="patientDob" class="mandlabel">Date Of Birth</label>
									<input type="text" name="" class="form-control mandatory dobDateCleave1" id="patientDob" placeholder="Date Of Birth" required data-parsley-trigger="keyup" data-parsley-trigger="change" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-message="Enter Valid Date. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="patientMob" class="mandlabel">Mobile No.</label>
									<input type="text" name="" class="form-control mandatory mobileCleave1" id="patientMob" placeholder="Mobile Number" required data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-message="Enter Valid Mobile No. ">
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="patientAltMob" class="">Alternate Mobile No.</label>
									<input type="text" name="" class="form-control mobileCleave2" id="patientAltMob" placeholder="Alternate Mobile Number" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-message="Enter Valid Mobile No. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="patientLLNo" class="">Land Line No.</label>
									<input type="text" name="" class="form-control" id="patientLLNo" placeholder="Land Line Number" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="15" data-parsley-minlength-message="Enter Valid Land Line No. ">
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="patientAddr1" class="mandlabel">Address Line 1</label>
									<input type="text" name="" class="form-control mandatory" id="patientAddr1" placeholder="1234 Main St" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="400" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="patientAddr2">Address Line 2</label>
									<input type="text" name="" class="form-control" id="patientAddr2" placeholder="Apartment, studio, or floor">
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="patientCity" class="mandlabel">City</label>
									<input type="text" name="" class="form-control mandatory" id="patientCity" placeholder="City / Town name" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="50" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="patientState" class="mandlabel">State</label>
									<select id="patientState" name="" class="form-control mandatory" required data-parsley-trigger="keyup" data-parsley-trigger="change">
										<c:forEach items="${stateList}" var="state">
											<option value="${state.stateCode }" data-alpha-code="${state.alphaCode }">${state.stateCode } - ${state.stateName }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="patientZip" class="">Zip Code</label>
									<input type="text" class="form-control zipCleave1" id="patientZip" placeholder="Zip / Pin code">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="patientEdu" class="">Education</label>
									<select id="patientEdu" class="form-control">
										<option selected>Choose Education</option>
										<option>...</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="patientOccup" class="">Occupation</label>
									<select id="patientOccup" class="form-control">
										<option selected>Choose Occupation</option>
										<option>...</option>
									</select>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="patientMStatus" class="mandlabel">Marital Status</label>
									<select id="patientMStatus" class="form-control mandatory" required>
										<option selected>Choose Marital Status</option>
										<option>...</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="gardianInfoDiv" class="stepFormSectionDiv">
					<h4 class="">Gardian Information</h4>
					<hr>
					<div data-label="Patient Parent / Gradian Detail" class="">
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="gardFName" class="">First Name</label>
									<input type="text" id="gardFName" class="form-control gardianFName" placeholder="Enter Gardian First Name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="gardLName" class="">Last Name</label>
									<input type="text" id="gardLName" class="form-control gardianLName" placeholder="Enter Gardian Last Name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="gardMName" class="">Middle Name</label>
									<input type="text" id="gardMName" class="form-control gardianMName" placeholder="Enter Gardian Middle Name">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="gardGender" class="">Gender</label>
									<select id="gardGender" class="form-control">
										<option selected value="Male">Male</option>
										<option value="Female">Female</option>
										<option value="Other">Other</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="gardDob" class="">Date Of Birth</label>
									<input type="text" class="form-control dobDateCleave2" id="gardDob" placeholder="Date Of Birth">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="gardMob" class="">Mobile No.</label>
									<input type="text" class="form-control mobileCleave3" id="gardMob" placeholder="Mobile Number" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter valid mobile number. ">
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="gardAltMob" class="">Alternate Mobile No.</label>
									<input type="text" class="form-control mobileCleave4" id="gardAltMob" placeholder="Alternate Mobile Number" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter valid mobile number. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="gardLLNo" class="">Land Line No.</label>
									<input type="text" class="form-control" id="gardLLNo" placeholder="Land Line Number">
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="gardAddr1" class="">Address Line 1</label>
									<input type="text" class="form-control" id="gardAddr1" placeholder="1234 Main St" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="400" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="gardAddr2">Address Line 2</label>
									<input type="text" class="form-control" id="gardAddr2" placeholder="Apartment, studio, or floor">
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="gardCity" class="">City / Town</label>
									<input type="text" class="form-control" id="gardCity" placeholder="City / Town name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="gardState" class="">State</label>
									<select id="gardState" class="form-control" data-parsley-trigger="keyup" data-parsley-trigger="change">
										<c:forEach items="${stateList}" var="state">
											<option value="${state.stateCode } - ${state.stateName }" data-alpha-code="${state.alphaCode }">${state.stateCode } - ${state.stateName }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="gardZip" class="">Zip Code</label>
									<input type="text" class="form-control zipCleave2" id="gardZip" placeholder="Zip / Pin code">
								</div>
							</div>
							<div class="col">
								<div class="form-group" style="text-align: center;">
									<div class="avatar-upload" style="margin: auto;">
										<button type="button" class="btn btn-default avatar-edit" id="avatar-edit-btn">
											<i class="fa fa-pencil-alt"></i>
										</button>
										<input type='file' class="hide" id="avatarImageUpload" accept=".png, .jpg, .jpeg" />
										<div class="avatar-preview">
											<div id="avatarImagePreview" style="background-image: url(img/avatar.png);"></div>
											<%-- <c:choose>
									<c:when test="${loan.customer.imageString()==''}">
										<div id="avatarImagePreview" style="background-image: url(img/avatar.png);"></div>
									</c:when>
									<c:otherwise>
										<div id="avatarImagePreview" style="background-image: url(${loan.customer.imageString()});"></div>
									</c:otherwise>
									</c:choose> --%>
										</div>
									</div>
									<label for="" class="mg-t-15">Gardian Image</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="insuranceInfoDiv" class="stepFormSectionDiv">
					<h4 class="">Insurance Information</h4>
					<hr>
					<div class="row row-sm mg-t-20">
						<div class="col-sm-3">
							<b>Patient have insurance ? </b>
						</div>
						<div class="col-sm-9">
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="inputInsuranceYes" name="inputInsuranceYesNo" class="custom-control-input" value="Y" checked>
								<label class="custom-control-label" for="inputInsuranceYes">Yes</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="inputInsuranceNo" name="inputInsuranceYesNo" class="custom-control-input" value="N">
								<label class="custom-control-label" for="inputInsuranceNo">No</label>
							</div>
						</div>
					</div>
					<div class="insurance-form-div">
						<hr>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="insurType" class="mandlabel">Insurance Type</label>
									<select id="insurType" class="form-control mandatory" required data-parsley-trigger="keyup" data-parsley-trigger="change">
										<option selected value="1"> Type 1</option>
										<option value="2">Type 2</option>
									</select>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="insurHolderName" class="mandlabel">Insurance Holder Name</label>
									<input type="text" id="insurHolderName" class="form-control insurHolderName mandatory" placeholder="Enter Insurance Holder Name" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="insurPlanName" class="mandlabel">Insurance Plan Name</label>
									<input type="text" id="insurPlanName" class="form-control gardianFName mandatory" placeholder="Enter Insurance Plan Name" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="insurName" class="mandlabel">Insured Name</label>
									<input type="text" id="insurName" class="form-control insurName mandatory" placeholder="Enter Insured Name" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="insurAddr1" class="mandlabel">Insured Address Line 1</label>
									<input type="text" id="insurAddr1" class="form-control insurAddr1 mandatory" placeholder="Enter Insured Address Line 1" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="insurAddr2" class="">Insured Address Line 2</label>
									<input type="text" id="insurAddr2" class="form-control insurAddr2" placeholder="Enter Insured Address Line 2" >
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="insurSocialSecurityNo" class="mandlabel">Insured Social Security No</label>
									<input type="text" id="insurSocialSecurityNo" class="form-control insurSSN mandatory" placeholder="Enter Insured Social Security No" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="insurPolicyId" class="">Policy Id</label>
									<input type="text" id="insurPolicyId" class="form-control insurPolicyId" placeholder="Enter Policy Id" >
								</div>
							</div>
						</div>
						<div class="row row-sm">
							<div class="col">
								<div class="form-group">
									<label for="insurPolicyNo" class="mandlabel">Policy Number</label>
									<input type="text" id="insurPolicyNo" class="form-control insurPolicyNo mandatory" placeholder="Enter Policy Number" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="insurGroupNo" class="">Policy Group No</label>
									<input type="text" id="insurGroupNo" class="form-control insurPolicyGroupNo" placeholder="Enter Policy Group No">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="confirmDiv" class="stepFormSectionDiv hide">
					<h4 class="">Confirm Patient Information</h4>
					<div class="confirm-personalInfo mg-t-20">
						<table class="table">
							<tr>
								<th colspan="4">
									<div class="tx-bold tx-pink tx-14 pd-b-10 pd-t-10">
										<i data-feather="minus"></i> Patient Personal Information
									</div>
								</th>
							</tr>
							<tr>
								<th><b>Patient name : </b></th>
								<td class="valueTd">
									<span class="avalue patientFName"></span> 
									<span class="avalue patientMName"></span> 
									<span class="avalue patientLName"></span>
								</td>
								<th><b>Gender : </b></th>
								<td class="valueTd avalue patientGender"></td>
							</tr>
							<tr>
								<th><b>Date Of Birth : </b></th>
								<td class="valueTd avalue patientDob"></td>
								<th><b>Mobile Number : </b></th>
								<td class="valueTd avalue patientMob"></td>
							</tr>
							<tr>
								<th><b>Alternate Mobile Number : </b></th>
								<td class="valueTd avalue patientAltMob"></td>
								<th><b>Land Line Number : </b></th>
								<td class="valueTd avalue patientLLNo"></td>
							</tr>
							<tr>
								<th><b>Address Line 1 : </b></th>
								<td class="valueTd avalue patientAddr1"></td>
								<th><b>Address Line 2 : </b></th>
								<td class="valueTd  ">
									<span class="avalue patientAddr2"></span>
									<span class="avalue patientCity"></span>
									<span class="avalue patientState"></span>
									<span class="avalue patientZip"></span>
								</td>
							</tr>
							<tr>
								<th><b>Education : </b></th>
								<td class="valueTd avalue patientEdu"></td>
								<th><b>Occupation : </b></th>
								<td class="valueTd avalue patientOccup"></td>
							</tr>
							<tr>
								<th><b>Marital Status : </b></th>
								<td class="valueTd avalue patientMStatus"></td>
								<th><b></b></th>
								<td class="valueTd avalue "></td>
							</tr>
							<tr>
								<th colspan="4">
									<div class="tx-bold tx-pink tx-14 pd-b-10 pd-t-10">
										<i data-feather="minus"></i> Patient Gardian Information
									</div>
								</th>
							</tr>
							<tr>
								<th><b>Gardian name : </b></th>
								<td class="valueTd">
								`	<span class="avalue gardFName"></span> 
									<span class="avalue gardMName"></span> 
									<span class="avalue gardLName"></span>
								</td>
								<th><b>Gender : </b></th>
								<td class="valueTd avalue gardGender"></td>
							</tr>
							<tr>
								<th><b>Date Of Birth : </b></th>
								<td class="valueTd avalue gardDob"></td>
								<th><b>Mobile Number : </b></th>
								<td class="valueTd avalue gardMob"></td>
							</tr>
							<tr>
								<th><b>Alternate Mobile Number : </b></th>
								<td class="valueTd avalue gardAltMob"></td>
								<th><b>Land Line Number : </b></th>
								<td class="valueTd avalue gardLLNo"></td>
							</tr>
							<tr>
								<th><b>Address Line 1 : </b></th>
								<td class="valueTd avalue gardAddr1"></td>
								<th><b>Address Line 2 : </b></th>
								<td class="valueTd avalue ">
									<span class="avalue gardAddr2"></span>
									<span class="avalue gardCity"></span>
									<span class="avalue gardState"></span>
									<span class="avalue gardZip"></span>
								</td>
							</tr>
							<tr>
								<th><b>Education : </b></th>
								<td class="valueTd avalue gardEdu"></td>
								<th><b>Occupation : </b></th>
								<td class="valueTd avalue gardOccup"></td>
							</tr>
							<tr>
								<th><b>Marital Status : </b></th>
								<td class="valueTd avalue gardMStatus"></td>
								<th><b></b></th>
								<td class="valueTd avalue "></td>
							</tr>
							<tr>
								<th colspan="4">
									<div class="tx-bold tx-pink tx-14 pd-b-10 pd-t-10">
										<i data-feather="minus"></i> Patient Insurance Information
									</div>
								</th>
							</tr>
							<tr>
								<th><b>Insurance Type : </b></th>
								<td class="valueTd avalue insurType"></td>
								<th><b>Holder Name : </b></th>
								<td class="valueTd avalue insurHolderName"></td>
							</tr>
							<tr>
								<th><b>Plan Name : </b></th>
								<td class="valueTd avalue insurPlanName"></td>
								<th><b>Insured Name : </b></th>
								<td class="valueTd avalue insurName"></td>
							</tr>
							<tr>
								<th><b>Insured Address Line 1 : </b></th>
								<td class="valueTd avalue insurAddr1"></td>
								<th><b>Insured Address Line 2 : </b></th>
								<td class="valueTd avalue insurAddr2"></td>
							</tr>
							<tr>
								<th><b>Insured Social Security Number : </b></th>
								<td class="valueTd avalue insurSocialSecurityNo"></td>
								<th><b>Insured Mobile Number : </b></th>
								<td class="valueTd avalue insurMobile"></td>
							</tr>
							<tr>
								<th><b>Policy Id : </b></th>
								<td class="valueTd avalue insurPolicyId"></td>
								<th><b>Policy Number : </b></th>
								<td class="valueTd avalue insurPolicyNo"></td>
							</tr>
							<tr>
								<th><b>Policy Group Number : </b></th>
								<td class="valueTd avalue insurGroupNo"></td>
								<th><b> </b></th>
								<td class="valueTd avalue "></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="form-navigation actions clearfix pd-t-15 pd-b-15 pd-r-20 pd-l-20">
				<button type="button" class="previous btn btn-primary float-left">
					<i data-feather="arrow-left-circle"></i> Previous
				</button>
				<button type="button" class="next btn btn-primary float-right">
					Next <i data-feather="arrow-right-circle"></i>
				</button>
				<button type="button" class="savePatientBtn btn btn-success float-right" onclick="savePatient(this)">
					<i data-feather="save"></i> Save Patient
				</button>
				<span class="clearfix"></span>
			</div>
		</form>
	</div>
	<div class="webcamModalDiv" id="webcamModalDiv"></div>
	<script type="text/javascript">

		var $sections = $('.stepFormSectionDiv');
		var $list = $('li.step-item');

		$('#patientForm').parsley();

		$(function(){
			
			$('#patientDob').datepicker({
				  dateFormat: 'dd-mm-yy',
				  showOtherMonths: true,
				  selectOtherMonths: true,
				  changeMonth: true,
				  changeYear: true,
			});

			$('#patientDob').datepicker().on('changeDate', function(e) {
				$('#patientDob').parsley().validate();
		    });

			$('#gardDob').datepicker({
				  dateFormat: 'dd-mm-yy',
				  showOtherMonths: true,
				  selectOtherMonths: true,
				  changeMonth: true,
				  changeYear: true,
			});

			new Cleave('.dobDateCleave1', {
				 date: true,
				 delimiter: '-',
				 datePattern: ['d', 'm', 'Y']
			});

			new Cleave('.dobDateCleave2', {
				 date: true,
				 delimiter: '-',
				 datePattern: ['d', 'm', 'Y']
			});
			
			new Cleave('.mobileCleave1', {
	        	numeral: true,
	        	numeralIntegerScale: 10,
	        	numeralPositiveOnly: true,
	        	delimiter: ''
	        });

			new Cleave('.mobileCleave2', {
	        	numeral: true,
	        	numeralIntegerScale: 10,
	        	numeralPositiveOnly: true,
	        	delimiter: ''
	        });

			new Cleave('.mobileCleave3', {
	        	numeral: true,
	        	numeralIntegerScale: 10,
	        	numeralPositiveOnly: true,
	        	delimiter: ''
	        });

			new Cleave('.mobileCleave4', {
	        	numeral: true,
	        	numeralIntegerScale: 10,
	        	numeralPositiveOnly: true,
	        	delimiter: ''
	        });

			new Cleave('.zipCleave1', {
	        	numeral: true,
	        	numeralIntegerScale: 6,
	        	numeralPositiveOnly: true,
	        	delimiter: ''
	        });

			new Cleave('.zipCleave2', {
	        	numeral: true,
	        	numeralIntegerScale: 6,
	        	numeralPositiveOnly: true,
	        	delimiter: ''
	        });

		});
		 
		$(function() {

			$('input[type="radio"][name="inputInsuranceYesNo"]').change(function(){
				if($(this).val()=='Y'){
					$('#insuranceInfoDiv').find('div.insurance-form-div').toggle(true);
					$('#confirmDiv').find('div.confirm-insuranceInfo').toggle(true);
					$('#insuranceInfoDiv').find('.form-control.mandatory').prop('required',true);
				}else if($(this).val()=='N'){
					$('#insuranceInfoDiv').find('div.insurance-form-div').toggle(false);
					$('#confirmDiv').find('div.confirm-insuranceInfo').toggle(false);
					$('#insuranceInfoDiv').find('.form-control.mandatory').prop('required',false);
				}
			});

			$('.form-navigation .previous').click(function() {
				navigateTo(curIndex() - 1);
			});

			// Next button goes forward iff current block validates
			$('.form-navigation .next').click(function() {
				$('#patientForm').parsley().whenValidate({
					group : 'block-' + curIndex()
				}).done(function() {
					navigateTo(curIndex() + 1);
				});
			});

			$sections.each(function(index, section) {
				$(section).find('.form-control.mandatory').attr('data-parsley-group', 'block-' + index);
			});

			navigateTo(0);

			$('.formCancelBtn').on('click', function() {
				reloadPage();
			});

			setFormData();
		});

		function navigateTo(index) {
			// Mark the current section with the class 'current'
			$('.form-navigation').find('.alert').remove();
			$sections.removeClass('current').removeClass('active')
					.eq(index).addClass('current').addClass('active');
			$list.removeClass('current').removeClass('active').eq(index)
					.addClass('current').addClass('active');
			if (index > 0) {
				$list.eq(index).removeClass('complete');
				$list.eq(index - 1).addClass('complete');
			}
			// Show only the navigation buttons that make sense for the current section:
			$('.form-navigation .previous').toggle(index > 0);
			var atTheEnd = index >= $sections.length - 1;
			$('.form-navigation .next').toggle(!atTheEnd);

			if(atTheEnd){
				var po = formToJson($('#patientForm'));
				console.log("patientForm", po);
				
				Object.keys(po).forEach(function(key) {
					//console.log(key, po[key]);
					$('#confirmDiv').find('.avalue.'+key).text(po[key]);
				});
			}

			$('.form-navigation .savePatientBtn').toggle(atTheEnd);
		}

		function curIndex() {
			// Return the current index by looking at which section has the class 'current'
			return $sections.index($sections.filter('.current.active'));
		}

		function setFormData() {
			if ($('#patientFlag').val() != 'N') {
				var patientJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("patient"))%>));
				console.log('patientJsonObj::', patientJsonObj);
				Object.keys(patientJsonObj).forEach(function(key) {
					$('#patientForm').find('#'+key).val(patientJsonObj[key]).trigger('input');
				});
				//$('#patientForm').find('input.patientName').val(catJsonObj.patientName);
				//$('#patientForm').find('select.statusSelect').val(catJsonObj.status);
				//$('#patientForm').find('textarea.patientDesc').val(catJsonObj.desc);
				//$('#patientForm').find('input.patientId').val(catJsonObj.id);
				$('#patientForm').parsley().validate();
			}
		}

		function savePatient(btnObj) {
			var flag = $('#patientFlag').val();
			var patientId = null;

			if (flag == 'N') {
				patientId = 0;
			} else {
				patientId = $('#patientId').val();
			}

			
			var formData = formToJson($('#patientForm'));
			formData["flag"] = flag;
			formData["patientId"] = patientId;

			$.ajax({
				url : '/app/patient/patientMaster/saveUpdateDeletePatient',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					console.log('resp', resp);
					if (resp.status == "success") {
						clearPatientForm($('#patientForm'));
						$.confirm({
							icon: 'fa fa-check-circle',
						    title: 'Success !',
						    columnClass: 'medium',
						    content: resp.msg,
						    type: 'green',
						    theme: 'bootstrap',
						    animationSpeed: 100,
						    typeAnimated: true,
						    buttons: {
						        Ok: {
						            text: 'Ok',
						            btnClass: 'btn-green',
						            keys: ['enter'],
						            action: function(){
						            	$list.removeClass('complete');
						            	navigateTo(0);
						            }
						        }
						    }
						});
					} else {
						alert(resp.msg,'E')
					}
				}
			});
		}

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					saveImageDataToserver(e.target.result);
					$/* ('#avatarImagePreview').css('background-image','url(' + e.target.result + ')');
									$('#avatarImagePreview').hide();
									$('#avatarImagePreview').fadeIn(650); */
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		function loadWebcamModal() {
			//var loanid = $('#giraviDetailId').val();
			$.ajax({
				url : '/app/patient/patientMaster/getWebcamModal',
				method : 'GET',
				success : function(resp) {
					$('#webcamModalDiv').empty();
					$('#webcamModalDiv').html(resp);
					setTimeout(function() {
						$('#webcamModal').modal('toggle');
					}, 500);
				}
			});
		}

		function saveImageData(dataURI) {
			/* $.ajax({
				url : '/app/patient/patientMaster/saveWebcamImage',
				method : 'POST',
				data : {
					//'customerId' : $('#giraviDetailDiv').find('input.customerId').val(),
					//'dataURI' : dataURI.split('base64,')[1]
				},
				success : function(resp) {
					if(resp.status=="success"){
						$('#avatarImagePreview').css('background-image','url(data:image/png;base64,' + resp.respBytes + ')');
						$('#avatarImagePreview').hide();
						$('#avatarImagePreview').fadeIn(650);
						$('#webcamModal').modal('toggle');
					}else{
						alert('Unable to save image.','e');
					}
				}
			}); */

			$('#avatarImagePreview').css('background-image','url(' + dataURI + ')');
			$('#avatarImagePreview').hide();
			$('#avatarImagePreview').fadeIn(650);
			$('#webcamModal').modal('toggle');
		}

		$('#avatarImageUpload').change(function() {
			readURL(this);
		});

		$("#avatar-edit-btn").click(function() {
			var jc = $.confirm({
				icon : 'fa fa-check-circle',
				title : 'Please select source of upload !',
				columnClass : 'medium',
				content : "Upload image from file system or from webcam.",
				type : 'dark',
				theme : 'bootstrap',
				animationSpeed : 100,
				typeAnimated : true,
				autoClose : false,
				buttons : {
					file : {
						text : 'File',
						btnClass : [ 'btn-success',
								'file' ],
						keys : [ 'f' ],
						action : function() {
							$('#avatarImageUpload').click()
						}
					},
					webcam : {
						text : 'Webcam',
						btnClass : [ 'btn-success',
								'webcam' ],
						keys : [ 'w' ],
						action : function(btn) {
							$('.jconfirm-buttons').find('button.webcam').prepend('&nbsp;<span class="spinner-border spinner-border-sm spinIcon"></span>&nbsp;&nbsp;')
							//startWebcam();
							loadWebcamModal();
							setTimeout(function() {
								$('.jconfirm-buttons').find('button.webcam').find('.spinIcon').remove();
								jc.close();
							}, 2000);
							return false;
						}
					},
					close : {
						text : 'close',
						btnClass : [ 'btn-default',
								'close' ],
						keys : [ 'c' ],
						action : function() {
							//alert('c')
						}
					}
				}
			});
		});

		function clearPatientForm(formObj) {
			console.log('clearPatientForm')
			$('#patientForm').find('input').val('');
			$('#patientForm').find('select').find('option:first').prop('selected',true);
			$('#patientForm').find('.select2-hidden-accessible').val(null).trigger('change');
			$('#patientForm').find('textarea').val('');
			$('#patientForm').find('.select2-hidden-accessible').removeClass('parsley-error');
			$('#patientForm').find('.parsley-error').removeClass('.parsley-error');
			$('#patientForm').find('.parsley-success').removeClass('.parsley-success');
			$('#patientForm').find('.select2-selection').removeClass('.parsley-error');
			$('#patientForm').find('select').find('option:first').prop('selected',true).trigger('change');
			$('#patientForm').find('input[type="radio"][name="inputInsuranceYesNo"]').val('Y').trigger('change');
			$('#patientForm').parsley().reset();
		}

		function formToJson(formObj){
			var json = {};
			$(formObj).find('.form-control').each(function(i,o){
				json[$(o).attr('id')] = $(o).val();
			});
			return json;
		}
	</script>
</body>
</html>