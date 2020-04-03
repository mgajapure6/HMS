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
	<input type="hidden" value="${uom.id == null ? 0 : uom.id}" id="uomId">
	<input type="hidden" value="${flag}" id="uomFlag">
	<div class="uomFormTopDiv">
		<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
			<div>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-style1 mg-b-10">
						<li class="breadcrumb-item">
							<a href="#">Settings</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New UOM' : 'Update UOM' }</li>
					</ol>
				</nav>
				<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New UOM' : 'Update UOM' }</h4>
			</div>
			<div class="d-md-block">
				<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 cancelFormBtn">
					<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
				</button>
			</div>
		</div>
		<div data-label="UOM Form" class="df-example uomForm-div">
			<form id="uomForm">
				<div class="form-group row">
					<label class="col-sm-3 col-form-label mandlabel"> UOM Name </label>
					<div class="col-sm-8">
						<input type="text" id="uomName" class="form-control uomName mandatory" placeholder="Enter uom name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="1" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 2 charachter ">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label">UOM Short Code</label>
					<div class="col-sm-8">
						<input type="text" id="uomShortCode" class="form-control uomShortCode" placeholder="Create uom code">
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
						<button type="button" class="btn btn-primary uomSaveBtn" data-flag="N" onclick="saveUOM(this)" disabled>Save UOM</button>
						<button type="button" class="btn btn-warning" onclick="clearUOMForm()">Clear</button>
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
	
	  $('#uomForm').on('focus change paste cut keyup keypress', function() {
		  $('#uomFormTopDiv').find('.alert').remove();
	  });
	  
	  $('.statusSelect').select2({
	    width : '100%',
	    placeholder : 'Select Status',
	    allowClear : true
	  }).val(null).trigger('change');
	  
	  $('#uomForm').parsley().on('field:validated', function() {
		  var parsleyFieldLength = $('#uomForm').find('.mandatory').length;
		  if ($('#uomForm').find('.parsley-success').length == parsleyFieldLength) {
			  $('.uomSave').prop('disabled', false);
		  } else {
			  $('.uomSave').prop('disabled', true);
		  }
	  }).on('form:submit', function() {
		  return false; // Don't submit form for this demo
	  });

	  setFormData();
	  
  });

  function setFormData() {
		if($('#uomFlag').val()!='N'){
			var uomJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("uom"))%>));
			console.log('uomJsonObj::',uomJsonObj);
			$('#uomFormTopDiv').find('.alert').remove();
			$('#uomName').val(uomJsonObj.uomName);
			$('#uomShortCode').val(uomJsonObj.uomShortCode);
			$('#statusSelect').val(uomJsonObj.status);
			$('#uomForm').parsley().validate();
		}
	}
  
  function saveUOM(btnObj) {
	  var flag = $('#uomFlag').val();
	  var uomId = null;
	  if (flag == 'N') {
		  uomId = 0;
	  } else {
		  uomId = $('#uomId').val();
	  }
	  var formData = {
	    'uomName' 		: $('#uomForm').find('.uomName').val(),
	    'uomShortCode' 	: $('#uomForm').find('.uomCode').val(),
	    'status' 		: $('#uomForm').find('.statusSelect').val(),
	    'flag' 			: flag,
	    'uomId' 		: uomId
	  }
	  
	  $.ajax({
	    url : '/app/setting/uomMaster/saveUpdateDeleteUOM',
	    method : 'POST',
	    data : formData,
	    async : false,
	    success : function(resp) {
		    console.log('resp', resp);
		    if (resp.status == "success") {
		    	needPageReload = true;
			    clearUOMForm();
			    $('#uomFormTopDiv').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    } else {
		    	needPageReload = false;
			    $('#uomFormTopDiv').find('.alert').remove();
			    $('#uomFormTopDiv').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    }
	    }
	  });
  }

  function clearUOMForm() {
	  $('#uomForm').find('input').val('').trigger('keyup');
	  $('#uomForm').find('select').val('').trigger('change');
	  $('#uomForm').find('.select2-hidden-accessible').val(null).trigger('change');
	  $('#uomForm').find('textarea').val('');
	  $('#uomForm').find('.alert').remove();
	  $('#uomForm').find('.select2-hidden-accessible').removeClass('parsley-error');
	  $('#uomForm').find('.parsley-error').removeClass('.parsley-error');
	  $('#uomForm').find('.parsley-success').removeClass('.parsley-success');
	  $('#uomForm').find('.select2-selection').removeClass('.parsley-error');
	  $('#uomForm').find('.uomSave').text('Save UOM');
	  $('#uomForm').find('.uomSaveBtn').prop('disabled', true);
	  $('#uomForm').parsley().reset();
  }
</script>
</body>
</html>