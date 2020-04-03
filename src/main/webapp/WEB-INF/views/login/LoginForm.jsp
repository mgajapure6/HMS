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
.alert {
	margin-top: 10px;
}
</style>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Twitter -->
<meta name="twitter:site" content="@themepixels">
<meta name="twitter:creator" content="@themepixels">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="DashForge">
<meta name="twitter:description" content="Responsive Bootstrap 4 Dashboard Template">
<!-- Meta -->
<meta name="description" content="Responsive Bootstrap 4 Dashboard Template">
<meta name="author" content="ThemePixels">
<title>Login Page</title>
</head>
<body>
	<div class="content content-fixed content-auth">
		<div class="container">
			<div class="media align-items-stretch justify-content-center ht-100p pos-relative">
				<div class="media-body align-items-center d-none d-lg-flex">
					<div class="mx-wd-600">
						<img src="../../assets/img/img15.png" class="img-fluid" alt="">
					</div>
				</div>
				<!-- media-body -->
				<div class="sign-wrapper mg-lg-l-50 mg-xl-l-60 login-div">
					<div class="wd-100p">
						<h3 class="tx-color-01 mg-b-5">Login</h3>
						<p class="tx-color-03 tx-16 mg-b-40">Welcome back! Please login to continue.</p>
						<div class="form-group">
							<label>Login Name</label>
							<input type="text" class="form-control" placeholder="Enter Login User Name" id="loginName">
						</div>
						<div class="form-group">
							<div class="d-flex justify-content-between mg-b-5">
								<label class="mg-b-0-f">Password</label>
								<a href="#" class="tx-13">Forgot password?</a>
							</div>
							<input type="password" class="form-control" placeholder="Enter your password" id="loginPassword">
						</div>
						<button class="btn btn-brand-02 btn-block" onClick="checkLogin(this)">Login</button>
						<div class="tx-13 mg-t-20 tx-center">
							Don't have an account?
							<a href="page-signup.html">Create an Account</a>
						</div>
					</div>
				</div>
				<!-- sign-wrapper -->
			</div>
			<!-- media -->
		</div>
		<!-- container -->
	</div>
	<!-- content -->
	<script type="text/javascript">
var needPageReload = false;
function checkLogin(btnObj) {
	
	var formData = {
		'loginName' : $('#loginName').val(),
		'loginPassword' : $('#loginPassword').val(),
	}

	$.ajax({
		url : '/app/login/checkUserLogin',
		method : 'POST',
		data : formData,
		async : false,
		success : function(resp) {
			//console.log('resp', resp);
			if (resp.status == "success") {
				needPageReload = true;
				$('.login-div').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'
										+ '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '
										+ resp.msg + '</div>')
				
			} else {
				needPageReload = false;
				$('.login-div').find('.alert').remove();
				$('.login-div').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'
										+ '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '
										+ resp.msg + '</div>')
			}
		}
	});
}
</script>
</body>
</html>
