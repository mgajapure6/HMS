<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalGiraviTransactionModal" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog" role="document" style="max-width: 850px;">
		<div class="modal-content">
			<div class="modal-header pd-x-20 pd-sm-x-30">
				<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</a>
				<div class="media align-items-center">
					<span class="tx-color-03 d-none d-sm-block"> <i class="fa fa-credit-card" style="font-size: 2rem;"></i>
					</span>
					<div class="media-body mg-sm-l-20 mg-l-0">
						<h4 class="tx-18 tx-sm-20 mg-b-2">
							Transactions For Giravi No : <i class="giraviNo">${giraviNumber }</i>
						</h4>
					</div>
				</div>
			</div>
			<div class="modal-body pd-10">
				<c:set var="totAmt" value="0"></c:set>
				<div class="d-sm-flex mg-t-10 mg-b-20" style="justify-content: center;">
					<div class="media">
						<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-teal tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-6">
							<i data-feather="bar-chart-2"></i>
						</div>
						<div class="media-body">
							<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold tx-nowrap mg-b-5 mg-md-b-8">Principle Amount</h6>
							<h4 class="tx-20 tx-sm-18 tx-md-18 tx-normal tx-rubik mg-b-0">
								<small>Rs:</small>
								<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${loan.loanAmount}" />
							</h4>
						</div>
					</div>
					<div class="media mg-t-20 mg-sm-t-0 mg-sm-l-15 mg-md-l-40">
						<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-pink tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-5">
							<i data-feather="bar-chart-2"></i>
						</div>
						<div class="media-body">
							<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Rate Of Interest</h6>
							<h4 class="tx-20 tx-sm-18 tx-md-18 tx-normal tx-rubik mg-b-0">
								<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${loan.intrestRate}" />
								<small> %</small>
							</h4>
						</div>
					</div>
					<div class="media mg-t-20 mg-sm-t-0 mg-sm-l-15 mg-md-l-40">
						<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-success tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-5">
							<i data-feather="bar-chart-2"></i>
						</div>
						<div class="media-body">
							<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Start Date</h6>
							<h4 class="tx-20 tx-sm-18 tx-md-18 tx-normal tx-rubik mg-b-0">
								<fmt:formatDate pattern="dd-MM-yyyy" value="${loan.loanDate}" />
							</h4>
						</div>
					</div>
				</div>
				<div class="">
					<hr>
					<table class="table giraviTransactionTable" id="giraviTransactionTable">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Date</th>
								<th scope="col" class="center">Paid Amount</th>
								<th scope="col" class="center">Pay Method</th>
								<th scope="col">Description</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="rCount" value="0"></c:set>
							<c:forEach items="${giraviTransactions}" var="tran">
								<c:set var="rCount" value="${rCount+1 }"></c:set>
								<c:set var="totAmt" value="${totAmt +  tran.tranAmount}"></c:set>
								<tr>
									<td scope="col" class="">${rCount}</td>
									<td scope="col" class=""><fmt:formatDate pattern="dd-MM-yyyy" value="${tran.tranDate}" /></td>
									<td scope="col" class="right bold"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${tran.tranAmount}" /></td>
									<td scope="col" class="center"><c:choose>
											<c:when test="${tran.tranMethod == 'C'}">
												<span class="badge badge-success">Cash</span>
											</c:when>
											<c:when test="${tran.tranMethod == 'B'}">
												<span class="badge badge-secondary">Bank Transfer</span>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose></td>
									<td scope="col" class="">Transaction made of Rs. <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${tran.tranAmount}" /></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th scope="col" colspan="2" class="right">Total Amount Paid:</th>
								<th scope="col" class="right"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${totAmt}" /></th>
								<th scope="col"></th>
								<th scope="col"></th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
			<div class="modal-footer" style="justify-content: center;">
				<div class="d-sm-flex mg-t-10 mg-b-20">
					<div class="media mg-t-20 mg-sm-t-0 mg-sm-l-15 mg-md-l-40">
						<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-primary tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-4">
							<i data-feather="bar-chart-2"></i>
						</div>
						<div class="media-body">
							<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Paid Amount</h6>
							<h4 class="tx-20 tx-sm-18 tx-md-18 tx-normal tx-rubik mg-b-0">
								<small>Rs:</small>
								<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${totAmt}" />
							</h4>
						</div>
					</div>
					<div class="media mg-t-20 mg-sm-t-0 mg-sm-l-15 mg-md-l-40">
						<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-dark tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-4">
							<i data-feather="bar-chart-2"></i>
						</div>
						<div class="media-body">
							<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Interest Amount</h6>
							<h4 class="tx-20 tx-sm-18 tx-md-18 tx-normal tx-rubik mg-b-0">
								<small>Rs:</small>
								<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${balanceAmt}" />
							</h4>
						</div>
					</div>
					<div class="media mg-t-20 mg-sm-t-0 mg-sm-l-15 mg-md-l-40">
						<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-dark tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-4">
							<i data-feather="bar-chart-2"></i>
						</div>
						<div class="media-body">
							<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Balance Amount</h6>
							<h4 class="tx-20 tx-sm-18 tx-md-18 tx-normal tx-rubik mg-b-0">
								<small>Rs:</small>
								<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${balanceAmt}" />
							</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$('#giraviTransactionTable')
				.DataTable(
						{
							responsive : true,
							language : {
								searchPlaceholder : 'Search transaction...',
								sSearch : '',
								lengthMenu : '_MENU_ per/page',
							},
							"initComplete" : function() {

								$('#modalGiraviTransactionModal')
										.find('.dataTables_filter')
										.append(
												'<div class="input-group" style="float: left;width: auto;    margin-right: 10px;">'
														+ '<input type="text" class="fromDateFilter" placeholder="From Date" style="width: 115px;">'
														+ '<div class="input-group-append">'
														+ '<span class="input-group-text" style="background-color: #fff;"><i class="fa fa-calendar"></i></span></div></div>'
														+ '<div class="input-group" style="float: left;width: auto;    margin-right: 10px;">'
														+ '<input type="text" class="toDateFilter" placeholder="To Date" style="width: 115px;">'
														+ '<div class="input-group-append">'
														+ '<span class="input-group-text" style="background-color: #fff;"><i class="fa fa-calendar"></i></span></div></div>');
								feather.replace();
								$('.dataTables_length').find('select').select2(
										{
											minimumResultsForSearch : -1
										});
								$('table.dataTable').css("padding", "0px");
								$('table.dataTable tfoot th').css(
										"border-color", "#e2e2e2");
							}
						});

		$('.fromDateFilter').datepicker({
			dateFormat : 'dd-mm-yy',
			showOtherMonths : true,
			selectOtherMonths : true,
			changeMonth : true,
			changeYear : true,
			"onSelect" : function(date) {
				minDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(date).getTime();
				allGiraviTable.draw();
			}
		}).keyup(function() {
			minDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(this.value).getTime();
			allGiraviTable.draw();
		});

		$('.toDateFilter').datepicker({
			dateFormat : 'dd-mm-yy',
			showOtherMonths : true,
			selectOtherMonths : true,
			changeMonth : true,
			changeYear : true,
			"onSelect" : function(date) {
				maxDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(date).getTime();
				allGiraviTable.draw();
			}
		}).keyup(function() {
			maxDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(this.value).getTime();
			allGiraviTable.draw();
		});
	});
</script>