<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/dual-table.css">
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
					<li class="breadcrumb-item active" aria-current="page">Role Setting</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Role Setting</h4>
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
				<span>All Roles</span>
			</button>
		</div>
	</div>
	<div data-label="Role Form" class="df-example demo-form">
		<form>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">User Name</label>
				<div class="col-sm-10">
					<select id="userId" class="form-control" placeholder="Select User Name">
						<c:forEach items="${allUsers}" var="user">
							<option>${user.userName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<!-- -------------------Dual Table------------------ -->
			<div class="container">
				<br />
				<div class="row">
					<div class="dual-list list-left col-md-5">
						<div class="well text-right">
							<div class="row">
								<div class="col-md-10">
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-search"></span>
										<input type="text" name="SearchDualList" class="form-control" placeholder="search" />
									</div>
								</div>
								<div class="col-md-2">
									<div class="btn-group">
										<a class="btn btn-default selector" title="select all">
											<i class="glyphicon glyphicon-unchecked"></i>
										</a>
									</div>
								</div>
							</div>
							<ul class="list-group">
								<c:forEach items="${allMenus}" var="menu">
									<li class="list-group-item">${menu.menuName}</li>
								</c:forEach>
								<!-- <li class="list-group-item">bootstrap-duallist <a href="https://github.com/bbilginn/bootstrap-duallist" target="_blank">github</a></li>
			                    <li class="list-group-item">Dapibus ac facilisis in</li>
			                    <li class="list-group-item">Morbi leo risus</li>
			                    <li class="list-group-item">Porta ac consectetur ac</li>
			                    <li class="list-group-item">Vestibulum at eros</li> -->
							</ul>
						</div>
					</div>
					<div class="list-arrows col-md-1 text-center">
						<button type="button" class="btn btn-primary btn-icon btn-sm move-right">
							<i data-feather="arrow-right"></i>
						</button>
						<button type="button" class="btn btn-primary btn-icon btn-sm move-left">
							<i data-feather="arrow-left"></i>
						</button>
					</div>
					<div class="dual-list list-right col-md-5">
						<div class="well">
							<div class="row">
								<div class="col-md-2">
									<div class="btn-group">
										<a class="btn btn-default selector" title="select all">
											<i class="glyphicon glyphicon-unchecked"></i>
										</a>
									</div>
								</div>
								<div class="col-md-10">
									<div class="input-group">
										<input type="text" name="SearchDualList" class="form-control" placeholder="search" />
										<span class="input-group-addon glyphicon glyphicon-search"></span>
									</div>
								</div>
							</div>
							<ul class="list-group">
								<!-- <li class="list-group-item">Cras justo odio</li>
			                    <li class="list-group-item">Dapibus ac facilisis in</li>
			                    <li class="list-group-item">Morbi leo risus</li>
			                    <li class="list-group-item">Porta ac consectetur ac</li>
			                    <li class="list-group-item">Vestibulum at eros</li> -->
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- -------------------Dual Table------------------ -->
			<div class="form-group row mg-b-0">
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary userSaveBtn" data-flag="N" data-userid="" onclick="saveUser(this)" disabled>Save Menu</button>
					<button type="button" class="btn btn-warning" onclick="clearForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	<div data-label="Example" class="df-example demo-table hide">
		<div class="table-responsive">
			<table class="table mg-b-0">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Job Title</th>
						<th scope="col">Degree</th>
						<th scope="col">Salary</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Adrian Monino</td>
						<td>Front-End Engineer</td>
						<td>Computer Science</td>
						<td>$120,000</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Socrates Itumay</td>
						<td>Software Engineer</td>
						<td>Computer Engineering</td>
						<td>$150,000</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Reynante Labares</td>
						<td>Product Manager</td>
						<td>Business Management</td>
						<td>$250,000</td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td>Hamza Macasindil</td>
						<td>Software Engineer</td>
						<td>Computer Engineering</td>
						<td>$140,000</td>
					</tr>
					<tr>
						<th scope="row">5</th>
						<td>Roven Galeon</td>
						<td>Project Manager</td>
						<td>Accountancy</td>
						<td>$160,000</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- table-responsive -->
	</div>
	<script src="${pageContext.request.contextPath }/assets/js/dual-table.js"></script>
	<script type="text/javascript">
	
		$('.listToFormBtn').on('click',function(){
			if($('.demo-table').hasClass('hide')){
				$('.demo-table').removeClass('hide');
				$('.demo-form').addClass('hide');
				$(this).find('span').text('Add new Role')
			}else{
				$('.demo-table').addClass('hide');
				$('.demo-form').removeClass('hide');
				$(this).find('span').text('All Roles')
			}
		})
	</script>
</body>
</html>