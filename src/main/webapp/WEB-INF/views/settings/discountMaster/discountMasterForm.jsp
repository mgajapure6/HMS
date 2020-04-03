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
	<input type="hidden" value="${discount.id == null ? 0 : discount.id}" id="discountId">
	<input type="hidden" value="${flag}" id="discountFlag">
	<div class="discountFormTopDiv">
		<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
			<div>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-style1 mg-b-10">
						<li class="breadcrumb-item">
							<a href="#">Settings</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Discount' : 'Update Discount' }</li>
					</ol>
				</nav>
				<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Discount' : 'Update Discount' }</h4>
			</div>
			<div class="d-md-block">
				<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 cancelFormBtn">
					<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
				</button>
			</div>
		</div>
		<div data-label="Discount Form" class="df-example discountForm-div">
			<form id="discountForm">
				<div class="form-group row">
					<label class="col-sm-3 col-form-label mandlabel"> Discount Name </label>
					<div class="col-sm-8">
						<input type="text" id="discountName" class="form-control discountName mandatory" placeholder="Enter Discount Name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="1" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 2 charachter ">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Discount Short Code</label>
					<div class="col-sm-8">
						<input type="text" id="discountShortCode" class="form-control discountShortCode" placeholder="Eneter Discount Code">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Discount Percentage</label>
					<div class="col-sm-8">
						<input type="text" id="discountPercentage" class="form-control discountPercentage" placeholder="Enter Discount Percentage" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Status</label>
					<div class="col-sm-8">
						<select id="statusSelect" class="form-control statusSelect select2">
							<option value="Active">Active</option>
							<option value="Inactive">Inactive</option>
						</select>
					</div>
				</div>
				<div class="form-group row mg-b-0">
					<label class="col-form-label col-sm-3 pt-0"></label>
					<div class="col-sm-8 ">
						<button type="button" class="btn btn-primary discountSaveBtn" onclick="saveDiscount(this)" disabled>Save Discount</button>
						<button type="button" class="btn btn-warning" onclick="clearDiscountForm()">Clear</button>
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
	
	  $('#discountForm').on('focus change paste cut keyup keypress', function() {
		  $('#discountFormTopDiv').find('.alert').remove();
	  });
	  
	  $('.statusSelect').select2({
	    width : '100%',
	    placeholder : 'Select Status',
	    allowClear : true
	  }).val(null).trigger('change');
	  
	  $('#discountForm').parsley().on('field:validated', function() {
		  var parsleyFieldLength = $('#discountForm').find('.mandatory').length;
		  if ($('#discountForm').find('.parsley-success').length == parsleyFieldLength) {
			  $('.discountSave').prop('disabled', false);
		  } else {
			  $('.discountSave').prop('disabled', true);
		  }
	  }).on('form:submit', function() {
		  return false; // Don't submit form for this demo
	  });
	  setFormData();
  });

  function setFormData() {
		if($('#discountFlag').val()!='N'){
			var discountJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("discount"))%>));
			console.log('discountJsonObj::',discountJsonObj);
			$('#discountFormTopDiv').find('.alert').remove();
			$('#discountName').val(discountJsonObj.disName);
			$('#discountShortCode').val(discountJsonObj.disShortCode);
			$('#discountPercentage').val(discountJsonObj.disPercentage);
			$('#statusSelect').val(discountJsonObj.status);
			$('#discountForm').parsley().validate();
		}
	}
  
  function saveDiscount(btnObj) {
	  var flag = $('#discountFlag').val();
	  var discountId = null;
	  if (flag == 'N') {
		  discountId = 0;
	  } else {
		  discountId = $('#discountId').val();
	  }
	  var formData = {
	    'discountName' 			: $('#discountForm').find('.discountName').val(),
	    'discountShortCode' 	: $('#discountForm').find('.discountShortCode').val(),
	    'discountPercentage' 	: $('#discountForm').find('.discountPercentage').val(),
	    'status' 				: $('#discountForm').find('.statusSelect').val(),
	    'flag' 					: flag,
	    'discountId' 			: discountId
	  }
	  
	  $.ajax({
	    url : '/app/setting/discountMaster/saveUpdateDeleteDiscount',
	    method : 'POST',
	    data : formData,
	    async : false,
	    success : function(resp) {
		    console.log('resp', resp);
		    if (resp.status == "success") {
		    	needPageReload = true;
			    clearDiscountForm();
			    $('#discountFormTopDiv').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    } else {
		    	needPageReload = false;
			    $('#discountFormTopDiv').find('.alert').remove();
			    $('#discountFormTopDiv').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    }
	    }
	  });
  }

  function clearDiscountForm() {
	  $('#discountForm').find('input').val('').trigger('keyup');
	  $('#discountForm').find('select').val('').trigger('change');
	  $('#discountForm').find('.select2-hidden-accessible').val(null).trigger('change');
	  $('#discountForm').find('textarea').val('');
	  $('#discountForm').find('.alert').remove();
	  $('#discountForm').find('.select2-hidden-accessible').removeClass('parsley-error');
	  $('#discountForm').find('.parsley-error').removeClass('.parsley-error');
	  $('#discountForm').find('.parsley-success').removeClass('.parsley-success');
	  $('#discountForm').find('.select2-selection').removeClass('.parsley-error');
	  $('#discountForm').find('.discountSave').text('Save Discount');
	  $('#discountForm').find('.discountSaveBtn').prop('disabled', true);
	  $('#discountForm').parsley().reset();
  }
</script>
</body>
</html>