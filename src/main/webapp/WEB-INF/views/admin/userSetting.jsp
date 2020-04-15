<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="#">Admin</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">User Setting</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">User Setting</h4>
		</div>
		<div class="d-none d-md-block">
			<button class="btn btn-sm pd-x-15 btn-white btn-uppercase hide">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail wd-10 mg-r-5">
					<path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
					<polyline points="22,6 12,13 2,6"></polyline></svg>
				Email
			</button>
			<button class="btn btn-sm pd-x-15 btn-white btn-uppercase mg-l-5 hide">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-printer wd-10 mg-r-5">
					<polyline points="6 9 6 2 18 2 18 9"></polyline>
					<path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path>
					<rect x="6" y="14" width="12" height="8"></rect></svg>
				Print
			</button>
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 listToFormBtn">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file wd-10 mg-r-5">
					<path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
					<polyline points="13 2 13 9 20 9"></polyline></svg>
				<span>Add New User</span>
			</button>
		</div>
	</div>
	<div data-label="User Form" class="df-example userForm-div hide">
		<form id="userForm">
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label mandlabel">User Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="userName" placeholder="User Name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character.">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">User Name Ol</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="userNameOl" placeholder="User Name Ol">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Address</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="address" placeholder="Address">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="email" placeholder="Email">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label mandlabel">Contact</label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="contact" placeholder="Contact" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character.">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label mandlabel">Login Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="loginName" placeholder="Login Name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character.">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label mandlabel">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control mandatory" id="loginPassword" placeholder="Password" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character.">
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
					<button type="button" class="btn btn-primary userSaveBtn" data-flag="N" data-userid="" onclick="saveUser(this)" disabled>Save Menu</button>
					<button type="button" class="btn btn-warning" onclick="clearForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	<div data-label="user List" class="userTable-div df-example">
		<div class="table-responsive">
			<table class="table mg-b-0" id="userListTable">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">User Name</th>
						<th scope="col">User Name Ol</th>
						<th scope="col">Address</th>
						<th scope="col">Email</th>
						<th scope="col">Contact</th>
						<th scope="col">User Login Name</th>
						<th scope="col">User Password</th>
						<th scope="col">Status</th>
						<th scope="col" class="center">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:set value="0" var="rCount"></c:set>
					<c:forEach items="${allUsers}" var="user">
						<c:set value="${rCount + 1}" var="rCount"></c:set>
						<tr>
							<td class="userCount">${rCount}</td>
							<td class="userName">${user.userName}</td>
							<td class="userNameOl">${user.userNameOl}</td>
							<td class="userAddress">${user.address}</td>
							<td class="userAddress">${user.email}</td>
							<td class="userContact">${user.contact}</td>
							<td class="loginName">${user.loginName}</td>
							<td class="userPassword">${user.loginPassword}</td>
							<td class="userStatus">${user.status}<span class="userStatus hide">${user.status}</span></td>
							<td class="">
								<div class="text-center">
									<button type="button" onclick="setFormData(this,'M')" data-menuid="${user.id}" class="btn btn-success btn-icon btn-sm editRecordBtn">
										<i class="fa fa-pencil-alt" aria-hidden="true"></i>
									</button>
									<button type="button" onclick="setFormData(this,'D')" data-menuid="${user.id}" class="btn btn-danger btn-icon btn-sm deleteRecordBtn">
										<i class="fa fa-trash-alt" aria-hidden="true"></i>
									</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- table-responsive -->
	</div>
	<script type="text/javascript">

	var needPageReload = false;
	
	$('.listToFormBtn').on('click',function(){
		if($('.userTable-div').hasClass('hide')){
			if(needPageReload){
				reloadPage();
			}else{
				needPageReload = false;
				$('.userTable-div').removeClass('hide');
				$('.userForm-div').addClass('hide');
				$(this).find('span').text('Add New User');
			}
		}else{
			clearForm();
			$('.userTable-div').addClass('hide');
			$('.userForm-div').removeClass('hide');
			$(this).find('span').text('All Users');
		}
	});

	function clearForm(formObje){
		var formObj = formObje ? formObje : $('#userForm');
		$('.userForm-div').find('.alert').remove();
		$('#userForm').find('input').val('');
		$('#userForm').find('select').val('');
		$('#userForm').find('.select2-hidden-accessible').val(null).trigger('change');
		$('#userForm').find('textarea').val('');
		$('#mStatusE').val('E');
		$('#mStatusD').val('D');
		$('#userForm').find('input[type="radio"]:first').prop('checked',true);
		$('#userForm').find('.alert').remove();
		$('#userForm').find('.select2-hidden-accessible').removeClass('parsley-error');
		$('#userForm').find('.parsley-error').removeClass('.parsley-error');
		$('#userForm').find('.parsley-success').removeClass('.parsley-success');
		$('#userForm').find('.select2-selection').removeClass('.parsley-error');
		$('#userForm').find('input.userId').val("0"),  
		$('#userForm').find('.userSaveBtn').attr('data-flag',"N");
		$('#userForm').find('.userSaveBtn').removeClass('btn-danger').addClass('btn-primary');
		$('#userForm').find('.userSaveBtn').text('Save User');
		$('#userForm').find('.userSaveBtn').prop('disabled',true);
		$('#userForm').parsley().reset();
	}

	$('#userForm').parsley().on('field:validated', function() {
		var parsleyFieldLength = $('#userForm').find('.mandatory').length;
	    var isValidForm = false;
		if($('#userForm').find('.parsley-success').length==parsleyFieldLength){
			isValidForm = true;
		}else{
			isValidForm = false;
		}
		if(isValidForm){
			$('.userSaveBtn').prop('disabled',false);
		}else{
			$('.userSaveBtn').prop('disabled',true);
		}
	 }).on('form:submit', function() {
	    return false; // Don't submit form 
	 });
	
	
	function setFormData(btnObj,flg){
		$('.listToFormBtn').click();
		needPageReload = false;
		$('.user-form').find('.alert').remove();
		var tr = $(btnObj).closest('tr');
		var modId = $(btnObj).attr('data-userid');
		
		$('#userName').val($(tr).find('.userName').text().trim());                                           
		$('#userNameOl').val($(tr).find('.userNameOl').text().trim());
		$('#userList').val($(btnObj).attr('data-userid'));
		$('#address').val($(tr).find('.userAddress').text().trim());
		$('#email').val($(tr).find('.userEmail').text().trim());
		$('#contact').val($(tr).find('.userContact').text().trim());
		$('#loginName').val($(tr).find('.userLoginName').text().trim());
		$('#loginPassword').val($(tr).find('.userLoginPassword').text().trim());
		if($(tr).find('span.userStatus').text()=="E")  {
			$('#mStatusE').prop("checked",true);
		}else{
			$('#mStatusD').prop("checked",true);
		}                                     
		
		$('#userForm').find('input.userId').val(modId); 
		$('#userForm').find('.userSaveBtn').attr('data-flag',flg);
		$('#userForm').parsley().validate();
	}
	
	
	function saveUser(btnObj){
		var flag = $(btnObj).data('flag');
		var userId = null;
		
		if(flag=='N'){
			userId = 0;
		}else{
			userId = $("#userId").attr('data-parsley-id');
		}
		
		var formData = {
			'userName'   	:  $('#userName').val(),
			'userNameOl' 	:  $('#userNameOl').val(),
			'address'    	:  $('#address').val(),
			'email' 	 	:  $('#email').val(),
			'contact' 	 	:  $('#contact').val(),
			'loginName'  	:  $('#loginName').val(),
			'loginPassword' :  $('#loginPassword').val(),
			'status'     	:  $('#userForm').find('input[name="mStatus"]:checked').val(),
			'userId'     	:  userId,
			'flag'       	:  flag,
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath }/app/admin/userMaster/saveUpdateDeleteUser',
			method : 'POST',
			data : formData,
			async : false,
			success : function(resp) {
				
				if(resp.status=="success"){
					needPageReload=true;
					clearForm($('#userForm'));
					$('.userForm-div').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'+
				   '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
				}else{
					needPageReload=false;
					$('.userForm-div').find('.alert').remove();
					$('.userForm-div').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'+
		           '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
				}
			}
		});
	}
	</script>
</body>
</html>