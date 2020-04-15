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
	<div class="taxFormTopDiv">
		<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
			<div>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-style1 mg-b-10">
						<li class="breadcrumb-item">
							<a href="#">Settings</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Tax' : 'Update Tax' }</li>
					</ol>
				</nav>
				<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Tax' : 'Update Tax' }</h4>
			</div>
			<div class="d-md-block">
				<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 cancelFormBtn">
					<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
				</button>
			</div>
		</div>
		<div data-label="Tax Form" class="df-example taxForm-div">
			<form id="taxForm">
				<div class="form-group row">
					<label class="col-sm-3 col-form-label mandlabel"> Tax Name </label>
					<div class="col-sm-8">
						<input type="text" class="form-control taxName taxNameCleave mandatory" placeholder="Enter tax name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="1" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 2 charachter ">
						<input type="hidden" class="taxId" value="0">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label mandlabel"> Tax Rate in % </label>
					<div class="col-sm-8">
						<input type="text" maxlength="5" class="form-control taxPercent taxPercentCleave mandatory" placeholder="Enter tax in percent" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter at least 2 digit ">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label "> Tax Reg. Number </label>
					<div class="col-sm-8">
						<input type="text" maxlength="50" class="form-control taxRegNumber" placeholder="Enter tax reg number">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label "> Tax authorizer Name </label>
					<div class="col-sm-8">
						<input type="text" maxlength="5" class="form-control taxAuthorizerName" placeholder="Enter tax authorizer Name">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Tax Code</label>
					<div class="col-sm-8">
						<input type="text" class="form-control taxCode" placeholder="Create tax code">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Status</label>
					<div class="col-sm-8">
						<select class="form-control statusSelect select2">
							<option value="Active">Active</option>
							<option value="Inactive">Inactive</option>
						</select>
					</div>
				</div>
				<div class="form-group row mg-b-0">
					<label class="col-form-label col-sm-3 pt-0"></label>
					<div class="col-sm-8 ">
						<button type="button" class="btn btn-primary taxSaveBtn" data-flag="N" onclick="saveTax(this)" disabled>Save Tax</button>
						<button type="button" class="btn btn-warning" onclick="clearTaxForm()">Clear</button>
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
	  var taxPercentCleave = new Cleave('.taxPercentCleave', {
	  	 numericOnly: true,
 	     delimiter: '.',
 	     blocks: [2, 2],
 	     numeralPositiveOnly : true,
	  });
	
	  $('#taxForm').on('focus change paste cut keyup keypress', function() {
		  $('#taxFormTopDiv').find('.alert').remove();
	  });
	  
	  $('.statusSelect').select2({
	    width : '100%',
	    placeholder : 'Select Status',
	    allowClear : true
	  }).val(null).trigger('change');
	  
	  $('#taxForm').parsley().on('field:validated', function() {
		  var parsleyFieldLength = $('#taxForm').find('.mandatory').length;
		  console.log('mandatory length',parsleyFieldLength);
		  if ($('#taxForm').find('.parsley-success').length == parsleyFieldLength) {
			  $('.taxSave').prop('disabled', false);
		  } else {
			  $('.taxSave').prop('disabled', true);
		  }
	  }).on('form:submit', function() {
		  return false; // Don't submit form for this demo
	  });
	  
  });
  
  function saveTax(btnObj) {
	  var flag = $(btnObj).data('flag');
	  var taxId = null;
	  if (flag == 'N') {
		  taxId = 0;
	  } else {
		  taxId = $('#taxForm').find('.taxId').val();
	  }
	  var formData = {
	    'taxName' : $('#taxForm').find('.taxName').val(),
	    'taxPercent' : $('#taxForm').find('.taxPercent').val(),
	    'taxRegNumber' : $('#taxForm').find('.taxRegNumber').val(),
	    'taxAuthorizerName' : $('#taxForm').find('.taxAuthorizerName').val(),
	    'taxCode' : $('#taxForm').find('.taxCode').val(),
	    'statusSelect' : $('#taxForm').find('.statusSelect').val(),
	    'flag' : flag,
	    'taxId' : taxId
	  }
	  $.ajax({
	    url : '${pageContext.request.contextPath }/app/setting/taxMaster/saveUpdateDeleteTax',
	    method : 'POST',
	    data : formData,
	    async : false,
	    success : function(resp) {
		    console.log('resp', resp);
		    if (resp.status == "success") {
		    	needPageReload = true;
			    clearTaxForm($('#taxForm'));
			    $('#modalAddTax').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    } else {
		    	needPageReload = false;
			    $('#modalAddTax').find('.modal-content').find('.alert').remove();
			    $('#modalAddTax').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    }
	    }
	  });
  }
  
  function saveUpdateDeleteTax(obj, flag) {
	  clearTaxForm($('#taxForm'));
	  $('#taxForm').find('.taxId').val($(obj).closest('tr').find('.taxId').text()).trigger('keyup');
	  $('#taxForm').find('.taxName').val($(obj).closest('tr').find('.taxName').text()).trigger('keyup');
	  $('#taxForm').find('.statusSelect').val($(obj).closest('tr').find('.status').text()).trigger('change');
	  $('#taxForm').find('.taxPercent').val($(obj).closest('tr').find('.taxPercent').text()).trigger('keyup');
	  $('#taxForm').find('.taxRegNumber').val($(obj).closest('tr').find('.taxRegNumber').text()).trigger('keyup');
	  $('#taxForm').find('.taxAuthorizerName').val($(obj).closest('tr').find('.taxAuthorizerName').text()).trigger('keyup');
	  $('#taxForm').find('.taxCode').val($(obj).closest('tr').find('.taxCode').text()).trigger('keyup');
	  $('#taxForm').find('.taxSave').data('flag', flag);
	  if (flag == 'D') {
		  $('#taxForm').find('.taxSave').removeClass('btn-primary').addClass('btn-danger');
		  $('#taxForm').find('.taxSave').text('Delete Tax');
	  } else {
		  $('#taxForm').find('.taxSave').removeClass('btn-danger').addClass('btn-primary');
		  $('#taxForm').find('.taxSave').text('Save Tax');
	  }
  }
  function clearTaxForm(formObj) {
	  console.log('clearTaxForm')
	  $('#taxForm').find('input').val('').trigger('keyup');
	  $('#taxForm').find('select').val('').trigger('change');
	  $('#taxForm').find('.select2-hidden-accessible').val(null).trigger('change');
	  $('#taxForm').find('textarea').val('');
	  $('#taxForm').find('.alert').remove();
	  $('#taxForm').find('.select2-hidden-accessible').removeClass('parsley-error');
	  $('#taxForm').find('.parsley-error').removeClass('.parsley-error');
	  $('#taxForm').find('.parsley-success').removeClass('.parsley-success');
	  $('#taxForm').find('.select2-selection').removeClass('.parsley-error');
	  $('#taxForm').find('.taxId').val("0"), $('#taxForm').find('.taxSave').attr('onclick', "saveTax(this,'N')");
	  $('#taxForm').find('.taxSave').removeClass('btn-danger').addClass('btn-primary');
	  $('#taxForm').find('.taxSave').text('Save Tax');
	  $('#taxForm').find('.taxSave').prop('disabled', true);
	  $('#taxForm').parsley().reset();
  }
</script>
</body>
</html>