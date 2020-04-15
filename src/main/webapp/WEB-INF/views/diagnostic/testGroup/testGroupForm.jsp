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
	<input type="hidden" value="${testGroup.id == null ? 0 : testGroup.id}" id="testGroupId">
	<input type="hidden" value="${flag}" id="testGroupFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="javascript:;">Diagnostic</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Test Group' : 'Update Test Group'}</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Test Group' : 'Update Test Group'}</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 formCancelBtn">
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
			</button>
		</div>
	</div>
	<div data-label="Test Group Form" class="df-example testGroupForm-div">
		<form id="testGroupForm">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">Test Group Name</label>
				<div class="col-sm-10">
					<input type="text" id="groupName" class="form-control groupName mandatory" placeholder="Enter test group Name" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label mandlabel">Test Group Code</label>
						<div class="col-sm-8">
							<input type="text" id="groupCode" class="form-control groupCode mandatory" placeholder="Enter test code" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
						</div>
					</div>
				</div>
				<div class="col">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Test Group Type</label>
						<div class="col-sm-8">
							<select id="groupType" class="form-control groupType">
								<option value="1">Type 1</option>
								<option value="2">Type 2</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Select Group Status</label>
						<div class="col-sm-8">
							<select id="groupStatus" class="form-control statusSelect select2" data-parsley-trigger="keyup" data-parsley-trigger="change" data-parsley-trigger="input">
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Test Short Description</label>
						<div class="col-sm-8">
							<textarea id="groupDesc" class="form-control groupDesc" rows="2" placeholder="Write some short description about this test group"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary testGroupSave" onclick="saveTestGroup(this)" disabled>Save Test Group</button>
					<button type="button" class="btn btn-warning" onclick="clearTestGroupForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">


    $(function() {
	    
	    $('.formCancelBtn').on('click', function() {
			reloadPage();
		});

	    $('#testGroupForm').parsley();

	    $('#testGroupForm').parsley().on('field:validated', function() {
		    var parsleyFieldLength = $('#testGroupForm').find('.mandatory').length;
		    if ($('#testGroupForm').find('.parsley-success').length == parsleyFieldLength) {
		    	$('.testGroupSave').prop('disabled', false);
		    } else {
		    	 $('.testGroupSave').prop('disabled', true);
		    }
	    }).on('form:submit', function() {
		    return false; // Don't submit form for this demo
	    });
	    
	    setFormData();
    });

    function setFormData() {
		if($('#testGroupFlag').val()!='N'){
			var testGroupJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("testGroup"))%>));
			console.log('testGroupJsonObj::', testGroupJsonObj);
			Object.keys(testGroupJsonObj).forEach(function(key) {
				$('#testGroupForm').find('#'+key).val(testGroupJsonObj[key]).trigger('keyup');
			});
			$('#testGroupForm').parsley().validate();
		}
	}
    
   

    function saveTestGroup(btnObj) {
	    var flag = $('#testGroupFlag').val();
	    var testGroupId = null;

	    if (flag == 'N') {
		    testGroupId = 0;
	    } else {
		    testGroupId = $('#testGroupId').val();
	    }

	    var formData = formToJson($('#testGroupForm'));
		formData["flag"] = flag;
		formData["testGroupId"] = testGroupId;

	    $.ajax({
	        url : '${pageContext.request.contextPath }/app/diagnostic/testGroup/saveUpdateDeleteTestGroup',
	        method : 'POST',
	        data : formData,
	        async : false,
	        success : function(resp) {
		        console.log('resp', resp);
		        if (resp.status == "success") {
			        clearTestGroupForm($('#testGroupForm'));
			        $('.testGroupForm-div').find('.alert').remove();
			        $('.testGroupForm-div').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		        } else {
			        $('.testGroupForm-div').find('.alert').remove();
			        $('.testGroupForm-div').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		        }
	        }
	    });
    }

    function clearTestGroupForm(formObj) {
	    console.log('clearTestGroupForm')
	    $('#testGroupForm').find('input').val('');
	    $('#testGroupForm').find('select').val('');
	    $('#testGroupForm').find('.select2-hidden-accessible').val(null).trigger('change');
	    $('#testGroupForm').find('textarea').val('');
	    $('#testGroupForm').find('.alert').remove();
	    $('#testGroupForm').find('.select2-hidden-accessible').removeClass('parsley-error');
	    $('#testGroupForm').find('.parsley-error').removeClass('.parsley-error');
	    $('#testGroupForm').find('.parsley-success').removeClass('.parsley-success');
	    $('#testGroupForm').find('.select2-selection').removeClass('.parsley-error');
	    $('#patientForm').find('select').find('option:first').prop('selected',true).trigger('change');

	    $('#testGroupId').val(0);
	    $('#testGroupFlag').val('N');
	    $('#testGroupForm').parsley().reset();
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