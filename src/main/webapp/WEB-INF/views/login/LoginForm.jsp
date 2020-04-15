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

.img-fluid {
	max-width: 100%;
	height: 480px;
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
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/assets/img/favicon.png">
<title>DashForge Responsive Bootstrap 4 Dashboard Template</title>
<!-- vendor css -->
<link href="${pageContext.request.contextPath }/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<!-- DashForge CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/dashforge.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/dashforge.auth.css">
<style type="text/css">
.hide {
	display: none !important;
}

.img-fluid {
	max-width: 100%;
	height: 480px !important;
}
</style>
</head>
<body>
	<div class="content content-fixed content-auth">
		<div class="container">
			<div class="media align-items-stretch justify-content-center ht-100p pos-relative">
				<div class="media-body align-items-center d-none d-lg-flex">
					<div class="mx-wd-600">
						<img src="${pageContext.request.contextPath }/img/login.png" class="img-fluid" alt="">
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
								<a href="#" class="tx-13" tabindex="-1">Forgot password?</a>
							</div>
							<input type="password" class="form-control" placeholder="Enter your password" id="loginPassword">
						</div>
						<button type="button" id="checkLoginBtn" class="btn btn-brand-02 btn-block" onClick="checkLogin(this)">Login</button>
						<div class="tx-13 mg-t-20 tx-center hide">
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
	<footer class="footer">
		<div>
			<span>&copy; 2019 DashForge v1.0.0. </span> <span>Created by <a href="http://themepixels.me">ThemePixels</a></span>
		</div>
		<div>
			<nav class="nav">
				<a href="javascript:;" class="nav-link">Licenses</a>
				<a href="javascript:;" class="nav-link">Change Log</a>
				<a href="javascript:;" class="nav-link">Get Help</a>
			</nav>
		</div>
	</footer>
	<script src="${pageContext.request.contextPath }/lib/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/lib/feather-icons/feather.min.js"></script>
	<script src="${pageContext.request.contextPath }/lib/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/dashforge.js"></script>
	<!-- append theme customizer -->
	<script src="${pageContext.request.contextPath }/lib/js-cookie/js.cookie.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/dashforge.settings.js"></script>
	<script type="text/javascript">
		function checkLogin(btnObj) {

			var formData = {
				'loginName' : $('#loginName').val(),
				'loginPassword' : $('#loginPassword').val(),
			}

			$.ajax({
				url : '${pageContext.request.contextPath }/login/doLogin',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					if (resp.status == "success") {
						$('.login-div').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0 mg-t-15 wd-100p" role="alert">'
												+ '<i class="fa fa-check-circle close" data-dismiss="alert" style="font-size: 22px;margin-right: 15px;color: #fff;"></i> '
												+ resp.msg + '</div>');
						
						window.location.replace('${pageContext.request.contextPath }/app/index');
					} else {
						$('.login-div').find('.alert').remove();
						$('.login-div').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0 mg-t-15 wd-100p" role="alert">'
												+ '<i class="fa fa-times-circle close" data-dismiss="alert" style="font-size: 22px;margin-right: 15px;color: #fff;"></i> '
												+ resp.msg + '</div>');
					}

					setTimeout(function() {
						$('.alert').remove();
					}, 2000)
				}
			});
		}

		$('body').on('keypress', function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				$('#checkLoginBtn').click();
			}
		});

		function contextPath() {
			return "${pageContext.request.contextPath}";
		}
	</script>
</body>
</html>
