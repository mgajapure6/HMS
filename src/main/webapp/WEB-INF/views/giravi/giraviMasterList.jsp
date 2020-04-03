<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.dataTables_length {
	width: 16%;
}

.dataTables_filter {
	width: 84%;
}

.dataTables_wrapper .dataTables_filter label {
	display: unset !important;
}
</style>
</head>
<body>
	<div class="row giraviTable ">
		<div class="col-md-12">
			<ul class="nav nav-line" id="myTab6" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="allGiravi-tab5" data-toggle="tab" href="#allGiraviTabPane" role="tab" aria-controls="allGiravi" aria-selected="true">All Giravi</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="paidGiravi-tab5" data-toggle="tab" href="#paidGiraviTabPane" role="tab" aria-controls="paidGiravi" aria-selected="false">Paid Giravi</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="unpaidGiravi-tab5" data-toggle="tab" href="#unpaidGiraviTabPane" role="tab" aria-controls="unpaidGiravi" aria-selected="false">Unpaid Giravi</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="draftGiravi-tab5" data-toggle="tab" href="#draftGiraviTabPane" role="tab" aria-controls="draftGiravi" aria-selected="false">Draft Giravi</a>
				</li>
				<li class="float-right" style="margin-left: auto;">
					<a href="javascript:;" style="float: right;" data-flag="N" onclick="viewGiraviFormNew(this)" class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5">
						<i class="fa fa-plus"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> Add New Giravi
					</a>
				</li>
			</ul>
			<div class="tab-content mg-t-20" id="myTabContent6">
				<div class="tab-pane fade active show" id="allGiraviTabPane" role="tabpanel" aria-labelledby="allGiravi-tab6">
					<h6>All Giravi</h6>
					<div class="table-responsive">
						<table class="table allGiraviTable" id="allGiraviTable">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Giravi No</th>
									<th scope="col">Date</th>
									<th scope="col" class="center">Principle Amount</th>
									<th scope="col" class="center">RoI</th>
									<th scope="col" class="center">Intrest Amount</th>
									<th scope="col">Customer</th>
									<th scope="col" class="center">Status</th>
									<!-- <th scope="col" class="center">Pay Now</th> -->
									<th scope="col" class="center">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="rCount" value="0"></c:set>
								<c:forEach items="${giraviList}" var="lon">
									<c:set var="rCount" value="${rCount+1 }"></c:set>
									<tr class="tr-id-${lon.id}">
										<td scope="col" class="">${rCount}</td>
										<td scope="col" class="">${lon.loanNumber}</td>
										<td scope="col" class=""><fmt:formatDate pattern="dd-MM-yyyy" value="${lon.loanDate}" /></td>
										<td scope="col" class="right bold"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${lon.loanAmount}" /></td>
										<td scope="col" class="right"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${lon.intrestRate}" /> %</td>
										<td scope="col" class="right bold"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${lon.intrestAmount}" /></td>
										<td scope="col" class="">${lon.customer.cusName}<input type="hidden" class="customerId" value="${lon.customer.id}"></td>
										<td scope="col" class="center"><c:choose>
												<c:when test="${lon.status=='P'}">
													<span class="badge badge-success">Paid</span>
												</c:when>
												<c:otherwise>
													<span class="badge badge-danger">Unpaid</span>
												</c:otherwise>
											</c:choose></td>
										<%-- <td scope="col" class="center"><button type="button" onclick="openAddPaymentModal(this)" data-loanid="${lon.id}" data-customerId="${lon.customer.id}" class="btn btn-dark btn-icon btn-sm">
												<i class="fa fa-credit-card"></i>
											</button></td> --%>
										<td scope="col" class="center"><span class="loanId hide">${lon.id}</span>
											<div class="dropdown">
												<button type="button" class="btn btn-default btn-icon btn-sm actionIconBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													<i class="fa fa-ellipsis-h" style="font-size: 1.2rem;"></i><span class="spinner-border spinner-border-sm hide spinIcon"></span>
												</button>
												<div class="dropdown-menu dropdown-menu-right">
													<button class="dropdown-item giraviDetailBtn" onclick="viewGiraviDetail(this,'V')" data-loanid="${lon.id}" data-customerId="${lon.customer.id}" type="button">
														<i class="fa fa-eye"></i>&nbsp;&nbsp;View Detail
													</button>
													<button class="dropdown-item" data-flag="M" onclick="viewGiraviFormNew(this)" data-loanid="${lon.id}" data-customerId="${lon.customer.id}" type="button">
														<i class="fa fa-pencil-alt"></i>&nbsp;&nbsp;Edit
													</button>
													<div class="dropdown-divider"></div>
													<button class="dropdown-item" data-flag="D" onclick="viewGiraviFormNew(this)" data-loanid="${lon.id}" data-customerId="${lon.customer.id}" type="button">
														<i class="fa fa-trash-alt"></i>&nbsp;&nbsp;Delete
													</button>
												</div>
											</div>
											<div class="text-center hide">
												<button type="button" data-loanid="${lon.id}" data-customerId="${lon.customer.id}" class="btn btn-info btn-icon btn-sm">
													<i class="fa fa-eye"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span>
												</button>
												<button type="button" onclick="viewGiraviForm(this,'M')" data-loanid="${lon.id}" data-customerId="${lon.customer.id}" class="btn btn-success btn-icon btn-sm">
													<i class="fa fa-pencil-alt"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span>
												</button>
												<button type="button" onclick="viewGiraviForm(this,'D')" data-loanid="${lon.id}" data-customerId="${lon.customer.id}" class="btn btn-danger btn-icon btn-sm">
													<i class="fa fa-trash-alt"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span>
												</button>
											</div></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="paidGiraviTabPane" role="tabpanel" aria-labelledby="paidGiravi-tab6">
					<h6>Paid Giravi</h6>
				</div>
				<div class="tab-pane fade" id="unpaidGiraviTabPane" role="tabpanel" aria-labelledby="unpaidlGiravi-tab6">
					<h6>Unpaid Giravi</h6>
				</div>
				<div class="tab-pane fade" id="draftGiraviTabPane" role="tabpanel" aria-labelledby="draftlGiravi-tab6">
					<h6>Draft Giravi</h6>
				</div>
			</div>
		</div>
	</div>
	<script src="lib/datatable/js/jquery.dataTables.yadcf.0.9.2.js"></script>
	<script type="text/javascript">
	var allGiraviTable=null;
	var paidGiraviTable=null;
	var unpaidGiraviTable=null;
	var draftGiraviTable=null;
	var needReloadAllGiravi = false;
	var needReloadPaidGiravi = false;
	var needReloadUnpaidGiravi = false;
	var needReloadDraftGiravi = false;
	
	var minDateFilter = "";
	var maxDateFilter = "";
	
	$(function(){
        'use strict'
        
        //
        if ($.fn.dataTable.isDataTable( '.allGiraviTable' )){
        	allGiraviTable = $('.allGiraviTable').DataTable();
		}else{
			allGiraviTable = $('.allGiraviTable').DataTable({
				responsive: true,
		    	language : {
					searchPlaceholder : 'Search anything...',
					sSearch : '',
					lengthMenu : '_MENU_ giravi/page',
				},
				"initComplete":function(){
				
					$('#allGiraviTabPane').find('.dataTables_filter').append('<div class="input-group" style="float: left;width: auto;    margin-right: 10px;">'+
							  '<input type="text" class="fromDateFilter" placeholder="From Date" style="width: 115px;">'+
							  '<div class="input-group-append">'+
							  '<span class="input-group-text" style="background-color: #fff;"><i class="fa fa-calendar"></i></span></div></div>'+
							  '<div class="input-group" style="float: left;width: auto;    margin-right: 10px;">'+
							  '<input type="text" class="toDateFilter" placeholder="To Date" style="width: 115px;">'+
							  '<div class="input-group-append">'+
							  '<span class="input-group-text" style="background-color: #fff;"><i class="fa fa-calendar"></i></span></div></div>'+
							'<a href="javascript:;" style="float: right;" onclick="reloadPage()" class="btn btn-sm pd-x-15 btn-white btn-uppercase mg-l-5 float-right">'+
							'<i data-feather="refresh-cw"></i></a>');
					feather.replace();
					
				}
		    });
		}
        
		
		 $('.fromDateFilter').datepicker({
			  dateFormat: 'dd-mm-yy',
			  showOtherMonths: true,
			  selectOtherMonths: true,
			  changeMonth: true,
			  changeYear: true,
			  "onSelect": function(date) {
			      minDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(date).getTime();
			      allGiraviTable.draw();
			  }
		}).keyup(function() {
		    minDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(this.value).getTime();
		    allGiraviTable.draw();
		});
        
        $('.toDateFilter').datepicker({
			  dateFormat: 'dd-mm-yy',
			  showOtherMonths: true,
			  selectOtherMonths: true,
			  changeMonth: true,
			  changeYear: true,
			  "onSelect": function(date) {
				  maxDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(date).getTime();
			      allGiraviTable.draw();
			  }
		}).keyup(function() {
			maxDateFilter = moment($(this).val(), 'DD-MM-YYYY').toDate();//new Date(this.value).getTime();
		    allGiraviTable.draw();
		});
        
        $('.dataTables_length').find('select').select2({minimumResultsForSearch: -1});
        
       
	});

	function viewGiraviFormNew(btnObj){
		$('.loading').removeClass('hide');
		$('.mainContainer').addClass('hide');
		$('.footer').addClass('hide');
		var flag = $(btnObj).attr('data-flag');
		var loanid = $(btnObj).attr('data-loanid');
		$.ajax({
			  url : "/app/giravi/giraviMaster/giraviForm",
			  async : true,
			  data : {
				  'flag' : flag,
				  'loanid' : loanid
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
		
		/* $(btnObj).find('.fa').toggleClass('hide');
		$(btnObj).find('.spinIcon').toggleClass('hide');
		setTimeout(function() {
			$('.giraviTable').toggleClass('hide');
			$('.giraviForm').toggleClass('hide');
			$(btnObj).find('.fa').toggleClass('hide');
			$(btnObj).find('.spinIcon').toggleClass('hide');
		},500); */
		
	}
	
	/* function viewGiraviForm(btnObj, flg){
		$(btnObj).closest('tr').find('.actionIconBtn').find('.fa').toggleClass('hide');
		$(btnObj).closest('tr').find('.actionIconBtn').find('.spinIcon').toggleClass('hide');
		setTimeout(function() {
			if(flg =="M"){
				var loanid = $(btnObj).attr('data-loanid');
				var customerid = $(btnObj).attr('data-customerid');
				loadGiraviForUpdateByGiraviId(loanid,customerid);
			}else if(flg =="D"){

			}
			$(btnObj).closest('tr').find('.actionIconBtn').find('.fa').toggleClass('hide');
			$(btnObj).closest('tr').find('.actionIconBtn').find('.spinIcon').toggleClass('hide');
		},500);
	} */

	

	/* function loadGiraviForUpdateByGiraviId(loanid,customerid){
		$.ajax({
			url : '/app/giravi/giraviMaster/getGiraviById',
			method : 'POST',
			data : {
				'loanid' : loanid
			},
			async : false,
			success : function(resp) {
				console.log('loadGiraviForUpdateDeleteByGiraviId resp',resp);
				if(resp && resp.data){
					$('.giraviItemsTable tbody').find('.noDataTr').remove();

					$('#giraviId').val(resp.data.id);
					$('#giraviFlag').val("M");
					$('#mainForm').parsley().validate();
					$('.customer-form-group').find('.customerSelect').val(customerid).trigger('change');
					$('.giravi-detail-group').find('.giraviNum').val(resp.data.loanNumber).trigger('input');
					$('.giravi-detail-group').find('.giraviDate').val(resp.data.loanDate).trigger('input');
					$('.giravi-detail-group').find('select.roi').val(resp.data.intrestRate).trigger('change');
					$('.giravi-detail-group').find('.tenurePeriod').val(resp.data.tenurePeriod).trigger('input');
					$('.giravi-detail-group').find('select.tenurePeriodType').val(resp.data.tenureType).trigger('change');
					/* $('.bottom-total-group').find('.giraviMainTotAmt').text(resp.data.invVal);
					$('.bottom-total-group').find('.giraviMainDisAmt').text(0);
					$('.bottom-total-group').find('.giraviMainTaxableAmt').text(resp.data.taxableVal);
					$('.bottom-total-group').find('.giraviMainTaxAmt').text(resp.data.taxVal);
					$('.bottom-total-group').find('.giraviMainGrandAmt').text(0); */
					//$('.recipientDesc').text(resp.data.description);
					
					/*$.each(resp.data.giraviItems,function(i,itm){
						console.log('found itm::',itm);
						
						var rowCount = $('.giraviItemsTable tbody tr').length;
						//{"id":4,"itmName":"Men Ring","itmMetalType":"G","itmDesc":"Gold Men Ring","itmQty":1,
						//"itmGrossWeight":5,"itmGrossWeightUom":"gm","itmNetWeight":4.5,
						//"itmNetWeightUom":"gm","itmValuation":20000,"itmEligibleAmount":15000}
						
						var itemObj = {};
						itemObj.id = itm.id;
						itemObj.name = itm.itmName;
						itemObj.qty = itm.itmQty;
						itemObj.metalType = itm.itmMetalType;
						itemObj.grossWeight = itm.itmGrossWeight;
						itemObj.grossWeightUom = itm.itmGrossWeightUom;
						itemObj.netWeight = itm.itmNetWeight;
						itemObj.netWeightUom = itm.itmNetWeightUom;
						itemObj.valuationAmt = itm.itmValuation;
						itemObj.payableAmt = itm.itmEligibleAmount;
						itemObj.grandAmt = itm.itmEligibleAmount;
						
						var tr = ' <tr>' +
						' <td class="trCount">' + (rowCount + 1) + '</td>' +
						' <td class="itemNameTd">' + itm.itmName + ' '+(itm.itmMetalType=='G' ? '<span class="badge badge-warning">Gold</span>' : '<span class="badge badge-info">'+itm.itmMetalType+'</span>')+'</td>' +
						' <td class="itemQtyTd">' + itm.itmQty + '</td>' +
						' <td class="itemGrossWeightTd col-up"><span>' + itm.itmGrossWeight + '</span> <span>' + itm.itmGrossWeightUom + '</span></td>' +
						' <td class="itemNetWeightTd"><span>' + itm.itmNetWeight + '</span> <span>' + itm.itmNetWeightUom + '</span></td>' +
						' <td class="itemValuationTd">Rs: ' + itm.itmValuation + '</td>' +
						' <td class="itemPayableAmtTd">Rs: ' + itm.itmEligibleAmount + '</td>' +
						' <td class="">' +
						'<span class="rowItemObj hide">' + (JSON.stringify(itemObj)) + '</span>' +
						'<div class="text-center">' +
						'<button type="button" onclick=updateGiraviItm(this) class="btn btn-success btn-icon btn-sm editBtn">' +
						'<i class="fa fa-pencil-alt"></i>' +
						'</button>&nbsp;' +
						'<button type="button" onclick=deleteGiraviItm(this) class="btn btn-danger btn-icon btn-sm deleteBtn">' +
						'<i class="fa fa-trash-alt"></i>' +
						'</button>' +
						'</div>' +
						'</td></tr>';

						$('.giraviItemsTable>tbody').append(tr);
						
						
					});

					updateTfootTotal();

					$('.giraviTable').toggleClass('hide');
					$('.giraviForm').toggleClass('hide');
				}
			}
		});
	} */

	function viewGiraviDetail(btnObj,flg){

		$('.loading').removeClass('hide');
		$('.mainContainer').addClass('hide');
		$('.footer').addClass('hide');
		var flag = $(btnObj).attr('data-flag');
		var loanid = $(btnObj).attr('data-loanid');
		$.ajax({
			  url : '/app/giravi/giraviMaster/getGiraviDetail',
			  async : true,
			  data : {
				  'flag' : flag,
				  'loadId' : loanid
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
		
		/* $(btnObj).closest('tr').find('.actionIconBtn').find('.fa').toggleClass('hide');
		$(btnObj).closest('tr').find('.actionIconBtn').find('.spinIcon').toggleClass('hide');
		setTimeout(function() {
			var loanid = $(btnObj).attr('data-loanid');
			$.ajax({
				url : '/app/giravi/giraviMaster/getGiraviTransactions',
				method : 'GET',
				data : {
					'loadId' : loanid
				},
				success : function(resp) {
					$('.transactionPalceholder').empty();
					$('.transactionPalceholder').html(resp);
					setTimeout(function() {
						$('.giraviTable').toggleClass('hide');
						$('.transactionPalceholder').toggleClass('hide');
						$('#modalGiraviTransactionModal').modal('toggle');
						$(btnObj).closest('tr').find('.actionIconBtn').find('.fa').toggleClass('hide');
						$(btnObj).closest('tr').find('.actionIconBtn').find('.spinIcon').toggleClass('hide');
					},500);
				}
			});
		},200); */
	}
	
	
	$.fn.dataTableExt.afnFiltering.push(function(oSettings, aData, iDataIndex){
        if(oSettings.sTableId=="allGiraviTable"){
    		if (typeof aData._date == 'undefined') {
  		      aData._date = moment(aData[2], 'DD-MM-YYYY').toDate();//new Date(aData[2]).getTime();
  		    }
    	} 

	    if (minDateFilter && !isNaN(minDateFilter)) {
	      if (aData._date < minDateFilter) {
	        return false;
	      }
	    }

	    if (maxDateFilter && !isNaN(maxDateFilter)) {
	      if (aData._date > maxDateFilter){
	        return false;
	      }
	    }
	    return true;
  	});
	</script>
</body>
</html>