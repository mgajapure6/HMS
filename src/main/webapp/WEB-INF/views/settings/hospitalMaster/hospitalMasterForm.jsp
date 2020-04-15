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
<html lang="en">
<head>
<style type="text/css">
</style>
</head>
<body>
	<input type="hidden" value="${hospital.id == null ? 0 : hospital.id}" id="hospitalId">
	<input type="hidden" value="${flag}" id="hospitalFlag">
	<div class="hospitalFormTopDiv">
		<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
			<div>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-style1 mg-b-10">
						<li class="breadcrumb-item">
							<a href="#">Settings</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">Edit Hospital</li>
					</ol>
				</nav>
				<h4 class="mg-b-0 tx-spacing--1">Edit Hospital General Information</h4>
			</div>
			<div class="d-md-block">
				<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 cancelFormBtn">
					<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
				</button>
			</div>
		</div>
		<div data-label="Hospital General Information" class="df-example hospitalForm-div">
			<form id="hospitalForm">
				<div class="form-group row">
					<label class="col-sm-2 col-form-label mandlabel"> Hospital Name </label>
					<div class="col-sm-10">
						<input type="text" id="hospitalName" class="form-control hospitalName mandatory" placeholder="Enter Hospital Name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="1" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 2 charachter ">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label mandlabel"> Hospital Address </label>
					<div class="col-sm-10">
						<textarea id="hospitalAddr" rows="2" class="form-control hospitalAddr mandatory" placeholder="Enter Hospital Address" data-parsley-trigger="keyup" data-parsley-minlength="5" data-parsley-validation-threshold="1" data-parsley-maxlength="300" data-parsley-minlength-message="Enter at least 5 charachter "></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Hospital Code</label>
							<div class="col-sm-8">
								<input type="text" id="hospitalCode" class="form-control hospitalCode" placeholder="Eneter Hospital Code">
							</div>
						</div>
					</div>
					<div class="col">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Hospital Phone</label>
							<div class="col-sm-8">
								<input type="text" id="hospitalPhone" class="form-control hospitalPhone" placeholder="Enter Hospital Percentage" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Hospital Email</label>
							<div class="col-sm-8">
								<input type="text" id="hospitalEmail" class="form-control hospitalCode" placeholder="Eneter Hospital Code">
							</div>
						</div>
					</div>
					<div class="col">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Hospital Website</label>
							<div class="col-sm-8">
								<input type="text" id="hospitalWebsite" class="form-control hospitalWebsite" placeholder="Enter Hospital Percentage" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Currency</label>
							<div class="col-sm-8">
								<input type="text" id="hospitalCurrency" class="form-control hospitalCurrency" placeholder="Eneter Hospital Code">
							</div>
						</div>
					</div>
					<div class="col">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Currency Symbol</label>
							<div class="col-sm-8">
								<input type="text" id="hospitalCurrencySymb" class="form-control hospitalCurrencySymb" placeholder="Enter Hospital Percentage" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Date Format</label>
							<div class="col-sm-8">
								<input type="text" id="hospitalDateFormat" class="form-control hospitalDateFormat" placeholder="Eneter Hospital Code">
							</div>
						</div>
					</div>
					<div class="col">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Time Format</label>
							<div class="col-sm-8">
								<input type="text" id="hospitalTimeFormat" class="form-control hospitalTimeFormat" placeholder="Enter Hospital Percentage" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0">
							</div>
						</div>
					</div>
				</div>
				
				<div class="form-group row mg-b-0">
					<label class="col-form-label col-sm-2 pt-0"></label>
					<div class="col-sm-10 ">
						<button type="button" class="btn btn-primary hospitalSaveBtn" onclick="saveHospital(this)" disabled>Update Hospital</button>
						<button type="button" class="btn btn-warning" onclick="clearHospitalForm()">Clear</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
  var needPageReload = false;

  $('button.cancelFormBtn').on('click', function() {
		reloadPage();
	});
  
  $(function() {
	
	  $('#hospitalForm').on('focus change paste cut keyup keypress', function() {
		  $('#hospitalFormTopDiv').find('.alert').remove();
	  });
	  
	  $('.statusSelect').select2({
	    width : '100%',
	    placeholder : 'Select Status',
	    allowClear : true
	  }).val(null).trigger('change');
	  
	  $('#hospitalForm').parsley().on('field:validated', function() {
		  var parsleyFieldLength = $('#hospitalForm').find('.mandatory').length;
		  if ($('#hospitalForm').find('.parsley-success').length == parsleyFieldLength) {
			  $('.hospitalSave').prop('disabled', false);
		  } else {
			  $('.hospitalSave').prop('disabled', true);
		  }
	  }).on('form:submit', function() {
		  return false; // Don't submit form for this demo
	  });
	  setFormData();
  });

  function setFormData() {
		if($('#hospitalFlag').val()!='N'){
			var hospitalJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("hospital"))%>));
			console.log('hospitalJsonObj::',hospitalJsonObj);
			$('#hospitalFormTopDiv').find('.alert').remove();
			$('#hospitalName').val(hospitalJsonObj.disName);
			$('#hospitalShortCode').val(hospitalJsonObj.disShortCode);
			$('#hospitalPercentage').val(hospitalJsonObj.disPercentage);
			$('#statusSelect').val(hospitalJsonObj.status);
			$('#hospitalForm').parsley().validate();
		}
	}
  
  function saveHospital(btnObj) {
	  var flag = $('#hospitalFlag').val();
	  var hospitalId = null;
	  if (flag == 'N') {
		  hospitalId = 0;
	  } else {
		  hospitalId = $('#hospitalId').val();
	  }
	  var formData = {
	    'hospitalName' 			: $('#hospitalForm').find('.hospitalName').val(),
	    'hospitalShortCode' 	: $('#hospitalForm').find('.hospitalShortCode').val(),
	    'hospitalPercentage' 	: $('#hospitalForm').find('.hospitalPercentage').val(),
	    'status' 				: $('#hospitalForm').find('.statusSelect').val(),
	    'flag' 					: flag,
	    'hospitalId' 			: hospitalId
	  }
	  
	  $.ajax({
	    url : '${pageContext.request.contextPath }/app/setting/hospitalMaster/saveUpdateDeleteHospital',
	    method : 'POST',
	    data : formData,
	    async : false,
	    success : function(resp) {
		    console.log('resp', resp);
		    if (resp.status == "success") {
		    	needPageReload = true;
			    clearHospitalForm();
			    $('#hospitalFormTopDiv').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    } else {
		    	needPageReload = false;
			    $('#hospitalFormTopDiv').find('.alert').remove();
			    $('#hospitalFormTopDiv').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    }
	    }
	  });
  }

  function clearHospitalForm() {
	  $('#hospitalForm').find('input').val('').trigger('keyup');
	  $('#hospitalForm').find('select').val('').trigger('change');
	  $('#hospitalForm').find('.select2-hidden-accessible').val(null).trigger('change');
	  $('#hospitalForm').find('textarea').val('');
	  $('#hospitalForm').find('.alert').remove();
	  $('#hospitalForm').find('.select2-hidden-accessible').removeClass('parsley-error');
	  $('#hospitalForm').find('.parsley-error').removeClass('.parsley-error');
	  $('#hospitalForm').find('.parsley-success').removeClass('.parsley-success');
	  $('#hospitalForm').find('.select2-selection').removeClass('.parsley-error');
	  $('#hospitalForm').find('.hospitalSave').text('Save Hospital');
	  $('#hospitalForm').find('.hospitalSaveBtn').prop('disabled', true);
	  $('#hospitalForm').parsley().reset();
  }
</script>
</body>
</html>