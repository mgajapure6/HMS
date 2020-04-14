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
</style>
</head>
<body>
	<div class="taxTableTopDiv">
		<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
			<div>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb breadcrumb-style1 mg-b-10">
						<li class="breadcrumb-item">
							<a href="#">Settings</a>
						</li>
						<li class="breadcrumb-item active" aria-current="page">Tax Master</li>
					</ol>
				</nav>
				<h4 class="mg-b-0 tx-spacing--1">Tax Master</h4>
			</div>
			<div class="d-md-block">
				<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 addNewBtn" data-taxid="0" onclick="loadTaxForm(this,'N')">
					<i class="fa fa-plus"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Add New Tax</span>
				</button>
			</div>
		</div>
		<div data-label="Tax List" class="taxTable-div df-example">
			<div class="table-responsive">
				<table class="table mg-b-0" id="taxListTable">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Tax Name</th>
							<th scope="col" class="center">Tax Rate %</th>
							<th scope="col">Reg. No</th>
							<th scope="col">Auth. Name</th>
							<th scope="col">Tax Code</th>
							<th scope="col" class="center">Status</th>
							<th scope="col" class="center">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:set value="0" var="rCount"></c:set>
						<c:forEach items="${allTax}" var="tax">
							<c:set value="${rCount + 1}" var="rCount"></c:set>
							<tr>
								<td class="modCount">${rCount}</td>
								<td class="modName">${tax.taxName}</td>
								<td class="modNameOl bold center">${tax.taxRate}%</td>
								<td class="modStatus">${tax.taxRegNo}</td>
								<td class="modNameOl">${tax.authName}</td>
								<td class="modNameOl">${tax.taxCode}</td>
								<td class="modTotMenu center">${tax.status}</td>
								<td class="center">
									<div class="text-center">
										<button type="button" onclick="loadTaxForm(this,'M')" data-taxid="${tax.id}" class="btn btn-success btn-icon btn-sm editRecordBtn">
											<i class="fa fa-pencil-alt" aria-hidden="true"></i>
										</button>
										<button type="button" onclick="loadTaxForm(this,'D')" data-taxid="${tax.id}" class="btn btn-danger btn-icon btn-sm deleteRecordBtn">
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
	</div>
	<script type="text/javascript">
$('#taxListTable').DataTable({
	language : {
		searchPlaceholder : 'Search...',
		sSearch : '',
		lengthMenu : '_MENU_ items/page',
	}
});

function loadTaxForm(btnObj,flag){

	$('.loading').removeClass('hide');
	$('.mainContainer').addClass('hide');
	$('.footer').addClass('hide');
	var taxid = $(btnObj).attr('data-taxid');
	$.ajax({
		  url : "/app/setting/taxMaster/taxFrom",
		  async : true,
		  data : {
			  'flag' : flag,
			  'taxid' : taxid
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