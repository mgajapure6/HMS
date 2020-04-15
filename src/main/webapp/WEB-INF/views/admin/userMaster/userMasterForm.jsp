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
	<input type="hidden" value="${user.id == null ? 0 : user.id}" id="userId">
	<input type="hidden" value="${flag}" id="userFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="#">Admin</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New User' : 'Update User'}</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New User' : 'Update User'}</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 formCancelBtn">
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
			</button>
		</div>
	</div>
	<div data-label="User Form" class="df-example userForm-div">
		<form id="userForm">
			<div class="form-group row">
				<label for="userName" class="col-sm-2 col-form-label mandlabel">User Name </label>
				<div class="col-sm-10">
					<input type="text" id="userName" class="form-control mandatory userName"  placeholder="Enter User Name" required data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character. ">
				</div>
			</div>
			<div class="form-group row">
				<label for="userNameOl" class="col-sm-2 col-form-label">User Name ol </label>
				<div class="col-sm-10">
					<input type="text" id="userNameOl" class="form-control userNameOl"  placeholder="Enter User Name In Other Language">
				</div>
			</div>
			<div class="form-group row">
				<label for="userNameOl" class="col-sm-2 col-form-label">Mobile No </label>
				<div class="col-sm-10">
					<input type="text" id="userContact" class="form-control userContact"  placeholder="Enter Mobile No">
				</div>
			</div>
			<div class="form-group row">
				<label for="userNameOl" class="col-sm-2 col-form-label">Email </label>
				<div class="col-sm-10">
					<input type="text" id="userEmail" class="form-control userEmail"  placeholder="Enter Email Address">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Address</label>
				<div class="col-sm-10">
					<textarea id="userAddress" class="form-control userAddress" rows="2" placeholder="Enter Full Address"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label for="userNameOl" class="col-sm-2 col-form-label mandlabel">Login Name </label>
				<div class="col-sm-10">
					<input type="text" id="userLoginName" class="form-control userLoginName mandatory"  placeholder="Enter Login Username" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="20" data-parsley-minlength-message="please enter at least 3 character. ">
				</div>
			</div>
			<div class="form-group row">
				<label for="userNameOl" class="col-sm-2 col-form-label mandlabel">Login Password</label>
				<div class="col-sm-10">
					<input type="password" id="userLoginPassword" class="form-control userEmail mandatory"  placeholder="Enter Login Password" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="20" data-parsley-minlength-message="please enter at least 3 character. ">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0 mandlabel">Select User Role</label>
				<div class="col-sm-10">
					<select id="userRoles" class="form-control userStatus select2 mandatory" multiple required data-parsley-trigger="keyup" data-parsley-trigger="input" data-parsley-trigger="change">
						<c:forEach items="${roleList}" var="role">
							<option value="${role.id }">${role.roleName }</option>
						</c:forEach>
					</select>
					<small>A User can have multiple roles also.</small>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0">Status</label>
				<div class="col-sm-10">
					<select id="userStatus" class="form-control userStatus select2">
						<option value="Active">Active</option>
						<option value="Inactive">Inactive</option>
					</select>
				</div>
			</div>
			<div class="form-group row mg-b-0">
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary userSaveBtn" onclick="saveUser(this)" disabled>Save User</button>
					<button type="button" class="btn btn-warning" onclick="clearForm()">Clear</button>
				</div>
			</div>
			<div class="form-group row mg-b-0">
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10 alertDiv">
					
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">

		$('.formCancelBtn').on('click', function() {
			reloadPage();
		});

		$('#userRoles').on('change',function(){
			$('#userRoles').parsley().validate();
			$('#userForm').parsley().validate();
		});

		$('#userForm').parsley();

		$('#userForm').on('change input keyup copy paste',function() {
			var parsleyFieldLength = $('#userForm').find('.mandatory').length;
			if ($('#userForm').find('.parsley-success').length == parsleyFieldLength) {
				$('.userSaveBtn').prop('disabled', false);
			} else {
				$('.userSaveBtn').prop('disabled', true);
			}
		}).on('form:submit', function() {
			return false; // Don't submit form 
		});

		setFormData();

		function setFormData() {
			if($('#userFlag').val()!='N'){
				var userJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("user"))%>));
				Object.keys(userJsonObj).forEach(function(key) {
					$('#userForm').find('#'+key).val(userJsonObj[key]).trigger('input');
				});
				$('#userForm').parsley().validate();
			}
		}

		function saveUser(btnObj) {
			var flag = $('#userFlag').val();
			var userId = null;

			if (flag == 'N') {
				userId = 0;
			} else {
				userId = $('#userId').val();
			}

			var formData = formToJson($('#userForm'));
			formData["flag"] = flag;
			formData["userId"] = userId;

			$.ajax({
				url : '${pageContext.request.contextPath }/app/admin/userMaster/saveUpdateDeleteUser',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					console.log('resp', resp);
					if (resp.status == "success") {
						clearForm($('#userForm'));
						$('.alertDiv').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" user="alert">'
												+ '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '
												+ resp.msg + '</div>')
					} else {
						$('.alertDiv').find('.alert').remove();
						$('.alertDiv').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" user="alert">'
												+ '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '
												+ resp.msg + '</div>')
					}
				}
			});
		}

		function clearForm(formObje) {
			var formObj = formObje ? formObje : $('#userForm');
			console.log('clearForm');
			$('.alertDiv').find('.alert').remove();
			$('#userForm').find('input').val('');
			$('#userForm').find('select').val('');
			$('#userForm').find('.select2-hidden-accessible').val(null)
					.trigger('change');
			$('#userForm').find('textarea').val('');
			$('#mStatusE').val('E');
			$('#mStatusD').val('D');
			$('#userForm').find('input[type="radio"]:first').prop('checked',
					true);
			$('#userForm').find('.alert').remove();
			$('#userForm').find('.select2-hidden-accessible').removeClass(
					'parsley-error');
			$('#userForm').find('.parsley-error').removeClass(
					'.parsley-error');
			$('#userForm').find('.parsley-success').removeClass(
					'.parsley-success');
			$('#userForm').find('.select2-selection').removeClass(
					'.parsley-error');
			$('#userForm').find('input.userId').val("0"), $('#userForm')
					.find('.userSaveBtn').attr('data-flag', "N");
			$('#userForm').find('.userSaveBtn').removeClass('btn-danger')
					.addClass('btn-primary');
			$('#userForm').find('.userSaveBtn').text('Save User');
			$('#userForm').find('.userSaveBtn').prop('disabled', true);
			$('#userForm').parsley().reset();
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