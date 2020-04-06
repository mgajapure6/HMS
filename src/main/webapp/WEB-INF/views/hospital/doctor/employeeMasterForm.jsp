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
	<input type="hidden" value="${employee.id == null ? 0 : employee.id}" id="employeeId">
	<input type="hidden" value="${flag}" id="employeeFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="#">Admin</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Employee' : 'Update Employee'}</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Employee' : 'Update Employee'}</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 formCancelBtn">
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
			</button>
		</div>
	</div>
	<div data-label="Employee Form" class="df-example employeeForm-div">
		<form id="employeeForm">
			<input type="hidden" class="employeeId" value="0">
			<div class="form-group row">
				<label for="name" class="col-sm-2 col-form-label mandlabel">Employee Name </label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="name" placeholder="Employee Name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character. ">
				</div>
			</div>
			<div class="form-group row">
				<label for="nameOl" class="col-sm-2 col-form-label">Employee Name Ol </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="nameOl" placeholder="Employee name other language">
				</div>
			</div>
			<div class="form-group row">
				<label for="address" class="col-sm-2 col-form-label mandlabel">Employee Address </label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="address" placeholder="Employee Address"  data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character. ">
				</div>
			</div>
			<div class="form-group row">
				<label for="contact" class="col-sm-2 col-form-label mandlabel">Employee Contact </label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="contact" placeholder="Employee Contact"  data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character. ">
				</div>
			</div>
			<div class="form-group row">
				<label for="email" class="col-sm-2 col-form-label mandlabel">Employee E-mail </label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="email" placeholder="Employee E-Mail"  data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character. ">
				</div>
			</div>
			<div class="form-group row">
				<label for="email" class="col-sm-2 col-form-label">Employee Type </label>
				<div class="col-sm-10">
					<select id="type" class="form-control">
						<c:forEach items="${employeeType}" var="empType">
							<option value="${empType.id}">${empType.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0">Status</label>
				<div class="col-sm-10">
					<div class="custom-control custom-radio">
						<input type="radio" id="mStatusE" value="E" name="mStatus" class="custom-control-input" checked>
						<label class="custom-control-label" for="mStatusE">Enable</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="mStatusD" value="D" name="mStatus" class="custom-control-input">
						<label class="custom-control-label" for="mStatusD">Disable</label>
					</div>
				</div>
			</div>
			<div class="form-group row mg-b-0">
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary employeeSaveBtn" data-flag="N" onclick="saveEmployee(this)" disabled>Save Employee</button>
					<button type="button" class="btn btn-warning" onclick="clearForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">

		$('.formCancelBtn').on('click', function() {
			reloadPage();
		});

		$('#employeeForm').parsley();

		$('#employeeForm').parsley().on('field:validated',function() {
			var parsleyFieldLength = $('#employeeForm').find('.mandatory').length;
			var isValidForm = false;
			if ($('#employeeForm').find('.parsley-success').length == parsleyFieldLength) {
				isValidForm = true;
			} else {
				isValidForm = false;
			}
			if (isValidForm) {
				$('.employeeSaveBtn').prop('disabled', false);
			} else {
				$('.employeeSaveBtn').prop('disabled', true);
			}
		}).on('form:submit', function() {
			return false; // Don't submit form 
		});

		setFormData();

		function setFormData() {
			if($('#employeeFlag').val()!='N'){
				var employeeJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("employee"))%>));
				console.log('employeeJsonObj::',employeeJsonObj);
				$('.employeeForm-div').find('.alert').remove();
				$('#name').val(employeeJsonObj.name);
				$('#nameOl').val(employeeJsonObj.nameOl);
				$('#address').val(employeeJsonObj.address);
				$('#contact').val(employeeJsonObj.contact);
				$('#email').val(employeeJsonObj.email);
				$("#type").val(employeeJsonObj.typeId);
				if (employeeJsonObj.status == "E") {
					$('#mStatusE').prop("checked", true);
				} else {
					$('#mStatusD').prop("checked", true);
				}
				$('#employeeForm').find('input.employeeId').val(employeeJsonObj.id);
				$('#employeeForm').find('.employeeSaveBtn').attr('data-flag', $('#employeeFlag').val());
				$('#employeeForm').parsley().validate();
			}
		}

		function saveEmployee(btnObj) {
			var flag = $('#employeeFlag').val();
			var employeeId = null;

			if (flag == 'N') {
				employeeId = 0;
			} else {
				employeeId = $('#employeeId').val();
			}

			var formData = {
				'name' 		: $('#name').val(),
				'nameOl' 	: $('#nameOl').val(),
				'address' 	: $('#address').val(),
				'contact' 	: $('#contact').val(),
				'email' 	: $('#email').val(),
				'typeId' 	: $('#type').val(),
				'typeName' 	: $("#type").find("option:selected").text(),
				'status' 	: $('#employeeForm').find('input[name="mStatus"]:checked').val(),
				'employeeId': employeeId,
				'flag' : flag
			}

			$.ajax({
				url : '/app/doctor/doctorMaster/saveUpdateDeleteEmployee',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					console.log('resp', resp);
					if (resp.status == "success") {
						needPageReload = true;
						clearForm($('#employeeForm'));
						$('.employeeForm-div').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'
												+ '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '
												+ resp.msg + '</div>')
					} else {
						needPageReload = false;
						$('.employeeForm-div').find('.alert').remove();
						$('.employeeForm-div').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'
												+ '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '
												+ resp.msg + '</div>')
					}
				}
			});
		}

		function clearForm(formObje) {
			var formObj = formObje ? formObje : $('#employeeForm');
			console.log('clearForm');
			$('.employeeForm-div').find('.alert').remove();
			$('#employeeForm').find('input').val('');
			$('#employeeForm').find('select').val('');
			$('#employeeForm').find('.select2-hidden-accessible').val(null)
					.trigger('change');
			$('#employeeForm').find('textarea').val('');
			$('#mStatusE').val('E');
			$('#mStatusD').val('D');
			$('#employeeForm').find('input[type="radio"]:first').prop('checked',
					true);
			$('#employeeForm').find('.alert').remove();
			$('#employeeForm').find('.select2-hidden-accessible').removeClass(
					'parsley-error');
			$('#employeeForm').find('.parsley-error').removeClass(
					'.parsley-error');
			$('#employeeForm').find('.parsley-success').removeClass(
					'.parsley-success');
			$('#employeeForm').find('.select2-selection').removeClass(
					'.parsley-error');
			$('#employeeForm').find('input.employeeId').val("0"), $('#employeeForm')
					.find('.employeeSaveBtn').attr('data-flag', "N");
			$('#employeeForm').find('.employeeSaveBtn').removeClass('btn-danger')
					.addClass('btn-primary');
			$('#employeeForm').find('.employeeSaveBtn').text('Save Employee');
			$('#employeeForm').find('.employeeSaveBtn').prop('disabled', true);
			$('#employeeForm').parsley().reset();
		}
	</script>
</body>
</html>