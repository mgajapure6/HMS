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
</style>
</head>
<body>
	<input type="hidden" value="${location.id == null ? 0 : location.id}" id="locationId">
	<input type="hidden" value="${flag}" id="locationFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="javascript:;">Inventory</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Location' : 'Update Location'}</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Location' : 'Update Location'}</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 formCancelBtn">
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
			</button>
		</div>
	</div>
	<div data-label="Location Form" class="df-example locationForm-div">
		<form id="locationForm">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">Location Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control locationName mandatory" placeholder="Enter location Name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
					<input type="hidden" class="locationId" value="0">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">Address Line 1</label>
				<div class="col-sm-10">
					<input type="text" class="form-control locationAddr1 mandatory" placeholder="Enter Address Line 1" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">Address Line 2</label>
				<div class="col-sm-10">
					<input type="text" class="form-control locationAddr2 mandatory" placeholder="Enter Address Line 2" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">City/ Town Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control locationCity mandatory" placeholder="Enter City / Town / Village Name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">State</label>
				<div class="col-sm-10">
					<input type="text" class="form-control locationState mandatory" placeholder="Enter State Name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">Pincode</label>
				<div class="col-sm-10">
					<input type="text" class="form-control locationPin mandatory" placeholder="Enter Pincode" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">Select Status</label>
				<div class="col-sm-10">
					<select class="form-control statusSelect select2">
						<option value="Active">Active</option>
						<option value="Inactive">Inactive</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Short Description</label>
				<div class="col-sm-10">
					<textarea class="form-control locationDesc" rows="2" placeholder="Write some short description about this location"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary locationSave" onclick="saveLocation(this)" disabled>Save Location</button>
					<button type="button" class="btn btn-warning" onclick="clearLocationForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">

    $(function() {
	    'use strict'
	    
	    $('.formCancelBtn').on('click', function() {
			reloadPage();
		});

	    $('#locationForm').parsley();

	    $('#locationForm').parsley().on('field:validated', function() {
		    var parsleyFieldLength = $('#locationForm').find('.mandatory').length;
		    var isValidForm = false;
		    if ($('#locationForm').find('.parsley-success').length == parsleyFieldLength) {
			    isValidForm = true;
		    } else {
			    isValidForm = false;
		    }
		    if (isValidForm) {
			    $('.locationSave').prop('disabled', false);
		    } else {
			    $('.locationSave').prop('disabled', true);
		    }
	    }).on('form:submit', function() {
		    return false; // Don't submit form for this demo
	    });
	    
	    setFormData();
    });

    function setFormData() {
		if($('#locationFlag').val()!='N'){
			var locJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("location"))%>));
			console.log('locJsonObj::',locJsonObj);
			$('.locationForm-div').find('.alert').remove();
			$('#locationForm').find('input.locationName').val(locJsonObj.locationName);
			$('#locationForm').find('select.statusSelect').val(locJsonObj.status);
			$('#locationForm').find('textarea.locationDesc').val(locJsonObj.desc);
			if (locJsonObj.status == "E") {
				$('#mStatusE').prop("checked", true);
			} else {
				$('#mStatusD').prop("checked", true);
			}
			$('#locationForm').find('input.locationId').val(locJsonObj.id);
			$('#locationForm').parsley().validate();
		}
	}
    
   

    function saveLocation(btnObj) {
	    var flag = $('#locationFlag').val();
	    var locationId = null;

	    if (flag == 'N') {
		    locationId = 0;
	    } else {
		    locationId = $('#locationId').val();
	    }

	    var formData = {
	        'flag'      : flag,
	        'name'      : $('#locationForm').find('.locationName').val(),
	        'desc'      : $('#locationForm').find('.locationDesc').val(),
	        'status'    : $('#locationForm').find('.statusSelect').val(),
	        'addrL1'    : locationId,
            'addrL2'    : null,
            'city'      : null,
            'state'     : null,
            'pincode'   : null,
			'locationId': null,
	    }

	    $.ajax({
	        url : '${pageContext.request.contextPath }/app/inventory/locationMaster/saveUpdateDeleteLocation',
	        method : 'POST',
	        data : formData,
	        async : false,
	        success : function(resp) {
		        console.log('resp', resp);
		        if (resp.status == "success") {
			        clearLocationForm($('#locationForm'));
			        $('.locationForm-div').find('.alert').remove();
			        $('.locationForm-div').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		        } else {
			        $('.locationForm-div').find('.alert').remove();
			        $('.locationForm-div').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		        }
	        }
	    });
    }

    function clearLocationForm(formObj) {
	    console.log('clearLocationForm')
	    $('#locationForm').find('input').val('');
	    $('#locationForm').find('select').val('');
	    $('#locationForm').find('.select2-hidden-accessible').val(null).trigger('change');
	    $('#locationForm').find('textarea').val('');
	    $('#locationForm').find('.alert').remove();

	    $('#locationForm').find('.select2-hidden-accessible').removeClass('parsley-error');
	    $('#locationForm').find('.parsley-error').removeClass('.parsley-error');
	    $('#locationForm').find('.parsley-success').removeClass('.parsley-success');
	    $('#locationForm').find('.select2-selection').removeClass('.parsley-error');
	    $('#locationForm').find('.locationId').val("0"), $('#locationForm').find('.locationSave').attr('onclick', "saveLocation(this,'N')");
	    $('#locationForm').find('.locationSave').removeClass('btn-danger').addClass('btn-primary');
	    $('#locationForm').find('.locationSave').text('Save Info');
	    $('#locationForm').find('.locationSave').prop('disabled', true);
	    $('#locationForm').parsley().reset();
    }
</script>
</body>
</html>