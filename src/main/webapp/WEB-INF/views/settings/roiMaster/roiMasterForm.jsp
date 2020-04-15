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
	<input type="hidden" value="${roi.id == null ? 0 : roi.id}" id="roiId">
	<input type="hidden" value="${flag}" id="roiFlag">
	<div class="roiFormTopDiv">
		<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
			<div>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-style1 mg-b-10">
						<li class="breadcrumb-item">
							<a href="#">Settings</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New ROI' : 'Update ROI' }</li>
					</ol>
				</nav>
				<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New ROI' : 'Update ROI' }</h4>
			</div>
			<div class="d-md-block">
				<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 cancelFormBtn">
					<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
				</button>
			</div>
		</div>
		<div data-label="ROI Form" class="df-example roiForm-div">
			<form id="roiForm">
				<div class="form-group row">
					<label class="col-sm-3 col-form-label mandlabel"> Rate Of Interest </label>
					<div class="col-sm-8">
						<input type="text" id="roi" class="form-control roi mandatory" placeholder="Enter Rate Of Interest" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0">
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
						<button type="button" class="btn btn-primary roiSaveBtn" data-flag="N" onclick="saveROI(this)" disabled>Save ROI</button>
						<button type="button" class="btn btn-warning" onclick="clearROIForm()">Clear</button>
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
	
	  $('#roiForm').on('focus change paste cut keyup keypress', function() {
		  $('#roiFormTopDiv').find('.alert').remove();
	  });
	  
	  $('.statusSelect').select2({
	    width : '100%',
	    placeholder : 'Select Status',
	    allowClear : true
	  }).val(null).trigger('change');
	  
	  $('#roiForm').parsley().on('field:validated', function() {
		  var parsleyFieldLength = $('#roiForm').find('.mandatory').length;
		  if ($('#roiForm').find('.parsley-success').length == parsleyFieldLength) {
			  $('.roiSave').prop('disabled', false);
		  } else {
			  $('.roiSave').prop('disabled', true);
		  }
	  }).on('form:submit', function() {
		  return false; // Don't submit form for this demo
	  });

	  setFormData();
	  
  });

  function setFormData() {
		if($('#roiFlag').val()!='N'){
			var roiJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("roi"))%>));
			console.log('roiJsonObj::',roiJsonObj);
			$('#roiFormTopDiv').find('.alert').remove();
			$('#roi').val(roiJsonObj.roi);
			$('#statusSelect').val(roiJsonObj.status);
			$('#roiForm').parsley().validate();
		}
	}
  
  function saveROI(btnObj) {
	  var flag = $('#roiFlag').val();
	  var roiId = null;
	  if (flag == 'N') {
		  roiId = 0;
	  } else {
		  roiId = $('#roiId').val();
	  }
	  var formData = {
	    'roiName' 		: $('#roiForm').find('input.roi').val(),
	    'status' 		: $('#roiForm').find('select.statusSelect').val(),
	    'flag' 			: flag,
	    'roiId' 		: roiId
	  }
	  
	  $.ajax({
	    url : '${pageContext.request.contextPath }/app/setting/roiMaster/saveUpdateDeleteROI',
	    method : 'POST',
	    data : formData,
	    async : false,
	    success : function(resp) {
		    console.log('resp', resp);
		    if (resp.status == "success") {
		    	needPageReload = true;
			    clearROIForm();
			    $('#roiFormTopDiv').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    } else {
		    	needPageReload = false;
			    $('#roiFormTopDiv').find('.alert').remove();
			    $('#roiFormTopDiv').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    }
	    }
	  });
  }

  function clearROIForm() {
	  $('#roiForm').find('input').val('').trigger('keyup');
	  $('#roiForm').find('select').val('').trigger('change');
	  $('#roiForm').find('.select2-hidden-accessible').val(null).trigger('change');
	  $('#roiForm').find('textarea').val('');
	  $('#roiForm').find('.alert').remove();
	  $('#roiForm').find('.select2-hidden-accessible').removeClass('parsley-error');
	  $('#roiForm').find('.parsley-error').removeClass('.parsley-error');
	  $('#roiForm').find('.parsley-success').removeClass('.parsley-success');
	  $('#roiForm').find('.select2-selection').removeClass('.parsley-error');
	  $('#roiForm').find('.roiSaveBtn').text('Save ROI');
	  $('#roiForm').find('.roiSaveBtn').prop('disabled', true);
	  $('#roiForm').parsley().reset();
  }
</script>
</body>
</html>