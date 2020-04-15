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
	<input type="hidden" value="${test.id == null ? 0 : test.id}" id="testId">
	<input type="hidden" value="${flag}" id="testFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="javascript:;">Diagnostic</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Test' : 'Update Test'}</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Test' : 'Update Test'}</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 formCancelBtn">
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
			</button>
		</div>
	</div>
	<div data-label="Test Form" class="df-example testForm-div">
		<form id="testForm">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">Test Name</label>
				<div class="col-sm-10">
					<input type="text" id="testName" class="form-control testName mandatory" placeholder="Enter test Name" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Test Title</label>
				<div class="col-sm-10">
					<input type="text" id="testTitle" class="form-control testTitle" placeholder="Enter test title">
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label mandlabel">Test Code</label>
						<div class="col-sm-8">
							<input type="text" id="testCode" class="form-control testCode mandatory" placeholder="Enter test code" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
						</div>
					</div>
				</div>
				<div class="col">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Test Group</label>
						<div class="col-sm-8">
							<select id="testGroupId" class="form-control testGroup">
								<c:choose>
									<c:when test="${fn:length(testGroups) > 0}">
										<c:forEach items="${testGroups}" var="tg">
											<option value="${tg.id }">${tg.groupCode }- ${tg.groupName }</option>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<option value="">Test Group Not Found</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label mandlabel">Test Normal Rate</label>
						<div class="col-sm-8">
							<input type="text" id="testNormalRate" class="form-control testNormalRateCleave mandatory right" placeholder="Enter test normal rate" required data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10">
						</div>
					</div>
				</div>
				<div class="col">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label mandlabel">Test Urgent Rate</label>
						<div class="col-sm-8">
							<input type="text" id="testUrgentRate" class="form-control testUrgentRateCleave mandatory right" placeholder="Enter test urgent rate" required data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label mandlabel">Select Status</label>
						<div class="col-sm-8">
							<select id="testStatus" class="form-control statusSelect select2" required data-parsley-trigger="keyup" data-parsley-trigger="change" data-parsley-trigger="input">
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
							<textarea id="testDesc" class="form-control testDesc" rows="2" placeholder="Write some short description about this test"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary testSave" onclick="saveTest(this)" disabled>Save Test</button>
					<button type="button" class="btn btn-warning" onclick="clearTestForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">

	new Cleave('.testNormalRateCleave', {
        numeral: true,
        numeralDecimalScale: 2,
        numeralThousandsGroupStyle: null,
        numeralPositiveOnly: true,
        delimiter: '',
    });

	new Cleave('.testUrgentRateCleave', {
        numeral: true,
        numeralDecimalScale: 2,
        numeralThousandsGroupStyle: null,
        numeralPositiveOnly: true,
        delimiter: '',
    });

    $(function() {
	    
	    $('.formCancelBtn').on('click', function() {
			reloadPage();
		});

	    $('#testForm').parsley();

	    $('#testForm').parsley().on('field:validated', function() {
		    var parsleyFieldLength = $('#testForm').find('.mandatory').length;
		    var isValidForm = false;
		    if ($('#testForm').find('.parsley-success').length == parsleyFieldLength) {
			    isValidForm = true;
		    } else {
			    isValidForm = false;
		    }
		    if (isValidForm) {
			    $('.testSave').prop('disabled', false);
		    } else {
			    $('.testSave').prop('disabled', true);
		    }
	    }).on('form:submit', function() {
		    return false; // Don't submit form for this demo
	    });
	    
	    setFormData();
    });

    function setFormData() {
		if($('#testFlag').val()!='N'){
			var testJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("test"))%>));
			console.log('testJsonObj::', testJsonObj);
			Object.keys(testJsonObj).forEach(function(key) {
				$('#testForm').find('#'+key).val(testJsonObj[key]).trigger('keyup');
			});
			$('#testForm').parsley().validate();
		}
	}
    
   

    function saveTest(btnObj) {
	    var flag = $('#testFlag').val();
	    var testId = null;

	    if (flag == 'N') {
		    testId = 0;
	    } else {
		    testId = $('#testId').val();
	    }

	    var formData = formToJson($('#testForm'));
		formData["flag"] = flag;
		formData["testId"] = testId;

	    $.ajax({
	        url : '${pageContext.request.contextPath }/app/diagnostic/testMaster/saveUpdateDeleteTest',
	        method : 'POST',
	        data : formData,
	        async : false,
	        success : function(resp) {
		        console.log('resp', resp);
		        if (resp.status == "success") {
			        clearTestForm($('#testForm'));
			        $('.testForm-div').find('.alert').remove();
			        $('.testForm-div').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		        } else {
			        $('.testForm-div').find('.alert').remove();
			        $('.testForm-div').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		        }
	        }
	    });
    }

    function clearTestForm(formObj) {
	    console.log('clearTestForm')
	    $('#testForm').find('input').val('');
	    $('#testForm').find('select').val('');
	    $('#testForm').find('.select2-hidden-accessible').val(null).trigger('change');
	    $('#testForm').find('textarea').val('');
	    $('#testForm').find('.alert').remove();
	    $('#testForm').find('.select2-hidden-accessible').removeClass('parsley-error');
	    $('#testForm').find('.parsley-error').removeClass('.parsley-error');
	    $('#testForm').find('.parsley-success').removeClass('.parsley-success');
	    $('#testForm').find('.select2-selection').removeClass('.parsley-error');
	    $('#testForm').find('select').find('option:first').prop('selected',true).trigger('change');

	    $('#testId').val(0);
	    $('#testFlag').val('N');
	    $('#testForm').parsley().reset();
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