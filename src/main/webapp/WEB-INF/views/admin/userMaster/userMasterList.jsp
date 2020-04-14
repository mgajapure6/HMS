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
</head>
<body>
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="#">Admin</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">User Master</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">User Master</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 addNewBtn" onclick="loadUserForm(this,'N')">
				<i class="fa fa-plus"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Add New User</span>
			</button>
		</div>
	</div>
	<div data-label="user List" class="userTable-div df-example">
		<div class="table-responsive">
			<table class="table mg-b-0" id="userListTable">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">User Name</th>
						<th scope="col">Login Name</th>
						<th scope="col">Contact</th>
						<th scope="col">Role</th>
						<th scope="col" class="center">Status</th>
						<th scope="col" class="center">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:set value="0" var="rCount"></c:set>
					<c:forEach items="${allUsers}" var="user">
						<c:set value="${rCount + 1}" var="rCount"></c:set>
						<tr>
							<td class="mCount">${rCount}</td>
							<td class="mName">${user.userName}</td>
							<td class="mLName">${user.userLoginName}</td>
							<td class="mContact">${user.userContact}<br>${user.userEmail}</td>
							<td class="mRoles">
								<c:forEach items="${user.roles }" var="rol">
									${rol.roleName}<br>
								</c:forEach>
							</td>
							<td class="mStatus" class="center">${user.userStatus}<span class="modStatus hide">${user.userStatus}</span></td>
							<td class="center">
								<div class="text-center">
									<button type="button" onclick="loadUserForm(this,'M')" data-userid="${user.id}" class="btn btn-success btn-icon btn-sm editRecordBtn">
										<i class="fa fa-pencil-alt" aria-hidden="true"></i>
									</button>
									<button type="button" onclick="loadUserForm(this,'D')" data-userid="${user.id}" class="btn btn-danger btn-icon btn-sm deleteRecordBtn">
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
		$('#userListTable').DataTable({
			language : {
				searchPlaceholder : 'Search...',
				sSearch : '',
				lengthMenu : '_MENU_ items/page',
			}
		});

		function loadUserForm(btnObj, flag) {
			$('.loading').removeClass('hide');
			$('.mainContainer').addClass('hide');
			$('.footer').addClass('hide');
			var userid = $(btnObj).attr('data-userid');
			$.ajax({
				url : "/app/admin/userMaster/userMasterFrom",
				async : true,
				data : {
					'flag' : flag,
					'userid' : userid
				},
				success : function(resp) {
					$('.mainContainer').empty().html(resp);
					$('#ui-datepicker-div').remove();
					setTimeout(function() {
						$('.loading').addClass('hide');
						$('.mainContainer').removeClass('hide');
						$('.footer').removeClass('hide');
					}, 1000);
					$('html,body').animate({
						scrollTop : parseInt($('body').offset().top)
					}, 1000);
				}
			});
		}
	</script>
</body>
</html>