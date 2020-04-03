<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="com.fasterxml.jackson.databind.SerializationFeature"%>
<% ObjectMapper mapper = new ObjectMapper();
mapper.disable(SerializationFeature.FAIL_ON_EMPTY_BEANS); %>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.form-control-like-div {
	padding: 10px;
	display: block;
	border: 1px solid #c0ccda;
	border-radius: 0.25rem;
}

/* Bootstrap 4 text input with search icon */
.has-search .form-control {
	padding-left: 2.375rem;
}

.has-search .form-control-feedback {
	position: absolute;
	z-index: 2;
	display: block;
	width: 2.375rem;
	height: 2.375rem;
	line-height: 2.375rem;
	text-align: center;
	pointer-events: none;
	color: #aaa;
}

.select2-container--default .select2-search--dropdown .select2-search__field
	{
	padding-right: 35px;
	background: #fff url(img/search_1.png) no-repeat 99% 3px;
	background-size: 25px 25px;
}

.select2-container--default .select2-results__option--highlighted[aria-selected]
	{
	background-color: #e6e8ea;
}

.select2-results__option {
	padding: 6px;
}

.select2-container--default .select2-results__option--highlighted[aria-selected]
	{
	color: #464646;
}

.txt-fnt {
	color: #757575;
	font-size: 12px;
}

.fieldSuggestionTxt {
	float: right;
	font-size: 11px;
	line-height: 2;
	color: #2c2e9e;
	font-weight: 500;
}

.itemNameTd {
	max-width: 300px;
	word-break: break-word;
}

.itemTaxTd {
	/* word-break: break-all;
    max-width: 70px; */
	
}

.manageColumnsDropdown  .dropdown-menu {
	left: -30px !important;
	top: 5px !important;
}

.customer-form-group .select2-container {
	z-index: 1001 !important;
}

.containtStart {
	padding-top: 65px;
}

.fixed-header {
	width: 100%;
	position: fixed;
	top: 60px;
	bottom: auto;
	padding: 5px;
	background: #fff;
	z-index: 1040;
}
</style>
</head>
<body>
	<input type="hidden" value="${loan.id == null ? 0 : loan.id}" id="giraviId">
	<input type="hidden" value="${flag}" id="giraviFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-20 bd-b pd-b-10 fixed-header">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-5">
					<li class="breadcrumb-item active" aria-current="page">${flag == 'N' ? 'New Giravi' : 'Update Giravi' }</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag == 'N' ? 'Create New Giravi' : 'Update Giravi' }</h4>
		</div>
		<!-- <div class="d-none d-md-block"></div> -->
		<div style="margin: auto;">
			<button type="button" class="btn btn-white" onclick="cancelGiravi()">Cancel</button>
			<button type="button" data-flag="N" class="btn btn-primary giraviSave" id="giraviSaveBtn" onclick="saveGiravi(this)">Save Giravi</button>
		</div>
	</div>
	<form id="mainForm">
		<div class="row containtStart">
			<div class="col-md-6">
				<h5>Bill To</h5>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group mg-b-0 customer-form-group">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Select customer</label>
							<div class="parsley-select">
								<div class="form-group has-search">
									<span class="fa fa-search form-control-feedback newentry"></span>
									<select class="form-control mandatory customerSelect parsleyField" required data-parsley-trigger="input" data-parsley-validation-threshold="0">
										<c:forEach items="${customers}" var="cus">
											<c:set var="newCus" value="${cus }" />
											<option value="${cus.id}" data-obj='<%= mapper.writeValueAsString(pageContext.getAttribute("newCus"))%>'>${cus.cusName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="billToDetail"></div>
					</div>
				</div>
			</div>
			<!-- <div class="divider-text divider-vertical" data-text="and"></div> -->
			<div class="col-md-6 giravi-detail-group">
				<h5>Giravi Detail</h5>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group mg-b-5">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Giravi Number</label>
							<input type="text" class="form-control mandatory giraviNum parsleyField" placeholder="Enter giravi number" autocomplete="off" required data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="18" data-parsley-minlength-message="Enter at least 2 character. " data-parsley-maxlength-message="Cannot exist more than 18 character">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group mg-b-5">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Giravi Date</label>
							<input type="text" class="form-control mandatory giraviDate dateCleave parsleyField" placeholder="Select giravi date" autocomplete="off" required data-parsley-trigger="change" data-parsley-trigger="keyup" data-parsley-trigger="input" data-parsley-minlength="10" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Date is incorrect" data-parsley-maxlength-message="Date is incorrect">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group mg-b-5">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Rate Of Interest</label>
							<select class="form-control roi" onchange="calculateInterest()">
								<option value="1" selected>1 %</option>
								<option value="2">2 %</option>
								<option value="2.5">2.5 %</option>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Tenure Period</label>
							<div class="input-group mg-b-5">
								<input type="text" onkeyup="calculateInterest()" placeholder="Enter Tenure Period" class="form-control tenurePeriod mandatory tenurePeriodCleave" required data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-minlength-message="Enter valid period. " data-parsley-errors-container="#errMsgFortenurePeriod">
								<select class="form-control tenurePeriodType">
									<option value="M" selected>Monthly</option>
									<option value="Y">Yearly</option>
								</select>
							</div>
							<div id="errMsgFortenurePeriod"></div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="col-md-12">
				<hr>
				<div class="d-flex" style="align-items: center;">
					<div class="pd-10 flex-grow-1">
						<h5 class="mandlabel">Giravi Items</h5>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table giraviItemsTable border-b">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Item</th>
								<th scope="col">Quantity</th>
								<th scope="col">Gross Weight</th>
								<th scope="col">Net Weight</th>
								<th scope="col">Valuation</th>
								<th scope="col">Payable Amount</th>
								<th scope="col" style="text-align: center;">Action</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr class="totalTr hide">
								<th class="right" colspan="2" style="text-align: right;"><b>Total :</b></th>
								<th class="qtyTotTfoot"><span>0</span> items</th>
								<th class="gwTotTfoot col-up">Rs: <span>0</span>
								</th>
								<th class="nwTotTfoot col-up">Rs: <span>0</span>
								</th>
								<th class="vTotTfoot">Rs: <span>0</span>
								</th>
								<th class="payAmtTotTfoot">Rs: <span>0</span>
								</th>
								<th class=""></th>
							</tr>
						</tfoot>
					</table>
				</div>
				<div style="text-align: right; padding: 20px 0px;">
					<a href="javascript:;" onclick="openAddGiraviItemModal()" class="btn btn-outline-primary">
						<i class="fa fa-plus"></i> &nbsp; &nbsp; Add Item
					</a>
				</div>
				<hr style="margin-top: 0;">
			</div>
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-7">
						<div class="accordion accordion-style1">
							<h6 class="recipientDescCollapse">Write a description to the recipient (will be printed at the footer of an giravi).......</h6>
							<div style="padding: 0;">
								<textarea class="form-control recipientDesc" style="border: 0; border-top: 1px solid #e6e6e6;" rows="5" placeholder="Write a description to the recipient..."></textarea>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-control-like-div bottom-total-group">
							<div class="d-flex" style="align-items: center;">
								<div class=" flex-grow-1">
									<b>Total Giravi / Loan Amount</b>
								</div>
								<!-- <div class="pd-10">Flex item</div> -->
								<div class="mg-l-auto">
									<b>Rs :</b> <b class="giraviMainTotAmt">0.00</b>
								</div>
							</div>
							<hr style="margin: 3px">
							<div class="d-flex" style="align-items: center;">
								<div class=" flex-grow-1">
									<b>Interest Amount</b>
								</div>
								<!-- <div class="pd-10">Flex item</div> -->
								<div class="mg-l-auto">
									<b>Rs :</b> <b class="giraviMainTaxAmt">0.00</b>
								</div>
							</div>
							<hr style="margin: 3px">
							<div class="d-flex" style="align-items: center;">
								<div class=" flex-grow-1">
									<b>Grand Payable Amount</b>
								</div>
								<!-- <div class="pd-10">Flex item</div> -->
								<div class=" mg-l-auto">
									<b>Rs :</b> <b class="giraviMainGrandAmt">0.00</b>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="AddGiraviItemFormModal.jsp"></jsp:include>
	<jsp:include page="AddGiraviCustomerFormModal.jsp"></jsp:include>
	<script type="text/javascript">

	$(function(){

		$('#mainForm').parsley();
		
		$('.accordion').accordion({
		  heightStyle: 'content',
		  collapsible: true
		});
		
		$('.recipientDescCollapse').click();
		$('.recipientDesc').val('1.\n2.\n3.\n4.')
		
		$('.giraviDate').datepicker({
			  dateFormat: 'dd-mm-yy',
			  showOtherMonths: true,
			  selectOtherMonths: true,
			  changeMonth: true,
			  changeYear: true,
		});

		$('.giraviDate').datepicker().on('changeDate', function(e) {
			//$('.giraviDate').parsley();
			//$('.giraviDate').change();
			//$('#mainForm').find('input.giraviDate').keyup();
	    });
		
		$('.paymentDueDate').datepicker({
			  dateFormat: 'dd-mm-yy',
			  showOtherMonths: true,
			  selectOtherMonths: true,
			  changeMonth: true,
			  changeYear: true
		});


		new Cleave('.dateCleave', {
			 date: true,
			 delimiter: '-',
			 datePattern: ['d', 'm', 'Y']
		});

		new Cleave('.tenurePeriodCleave', {
			numeral: true,
        	numeralIntegerScale: 2,
        	numeralPositiveOnly: true,
        	delimiter: ''
		});
		 
		
		
		$('.customerSelect').select2({
			width:'100%',
			placeholder: 'Select customer...',
			allowClear: true
		}).on('select2:open', () => { 
			var nn= '<div class="row"><div class="col-sm"><div class="pd-y-10 pd-x-20 bg-ui-01"><a href="javascript:;" onclick="openAddCustomerModal()"><i class="icon ion-md-add"></i> Add new customer</a></div></div></div>';
	        $(".select2-results:not(:has(a))").append(nn);
		}).on('change', function(){
			if($(this).val()!=null && $(this).val()!=""){
				var cusOb = $(this).find('option:selected').data('obj');
				console.log('cusOb',cusOb)
				var cus = '<h4 style="color: #717171;">'+cusOb.cusName+'</h4><div> '+cusOb.mobile+'</div><div>'+cusOb.cusAddrL1+',</div><div>'+cusOb.cusAddrL2+' '+cusOb.city+'</div><div> Pin '+cusOb.pincode+'</div><div>'+cusOb.state+'</div><div> <span><a href="javascript:;" onclick="editCustomer()">Edit Customer</a></span></div>';
				$('.billToDetail').empty().append(cus);
				$('.billToDetail').siblings('.form-group').addClass('hide');
			}else{
				$('.billToDetail').siblings('.form-group').removeClass('hide');
				$('.billToDetail').empty();
			}
		}).val(null).trigger('change');
		
		
		if($('.giraviItemsTable tbody tr').length<=0){
			$('.giraviItemsTable tbody').append('<tr class="noDataTr">'+
					'<th colspan="10" style="text-align: center; padding: 20px 0px;"><i class="fa fa-plus hide"></i>&nbsp; &nbsp; No item found</th></tr>')
		}
		
		setFormData();
	});

	function setFormData(){
		if($('#giraviFlag').val()!='N'){
			var loanJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("loan"))%>));
			var customerJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("customer"))%>));
			console.log('loanJsonObj::',loanJsonObj);
			$('.giraviItemsTable tbody').find('.noDataTr').remove();
			$('#mainForm').parsley().validate();
			$('.customer-form-group').find('.customerSelect').val(customerJsonObj.id).trigger('change');
			$('.giravi-detail-group').find('.giraviNum').val(loanJsonObj.loanNumber).trigger('input');
			$('.giravi-detail-group').find('.giraviDate').val(loanJsonObj.loanDate).trigger('input');
			$('.giravi-detail-group').find('select.roi').val(loanJsonObj.intrestRate).trigger('change');
			$('.giravi-detail-group').find('.tenurePeriod').val(loanJsonObj.tenurePeriod).trigger('input');
			$('.giravi-detail-group').find('select.tenurePeriodType').val(loanJsonObj.tenureType).trigger('change');
			$('.recipientDesc').text(loanJsonObj.description);
			
			$.each(loanJsonObj.giraviItems,function(i,itm){
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
		 }
	}
		
	function openAddGiraviItemModal() {
		clearGiraviItemForm();
		$('#modalAddGiraviItem').modal('toggle');
		//$('#giraviItemForm').parsley().validate();
	}

	function openAddCustomerModal(){
		clearCustomerForm($('#customerForm'));
		$(".customerSelect").select2("close");
		$('#modalAddCustomer').modal('toggle');
	}
	
	function updateTableSerialNumber(){
		$('.giraviItemsTable tbody tr').each(function(i,trObj){
			$(trObj).find('.trCount').text(i+1)
		});
	}
	
	function updateTfootTotal(){
		var qtyTot = 0.00;
		var gwTot = 0.00;
		var nwTot = 0.00;
		var vTot = 0.00;
		var payAmtTot = 0.00;
		var txTot = 0.00;
		
		$('.giraviItemsTable tbody tr').each(function(i,trObj){
			//$(trObj).find('.trCount').text(i+1)
			//{"id":4,"name":"Men Ring","qty":1,"metalType":"G","grossWeight":5,
			//"grossWeightUom":"gm","netWeight":4.5,"netWeightUom":"gm",
			//"valuationAmt":22000,"payableAmt":16000,"grandAmt":16000}
			var itmObj = JSON.parse($(trObj).find('span.rowItemObj').text());
			qtyTot = qtyTot + parseFloat(itmObj.qty);
			gwTot = gwTot + parseFloat(itmObj.grossWeight);
			nwTot = nwTot + parseFloat(itmObj.netWeight);
			vTot = vTot + parseFloat(itmObj.valuationAmt);
			payAmtTot = payAmtTot + parseFloat(itmObj.payableAmt);
			
		});
		
		$('.giraviItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text(qtyTot.toFixed(2));
		$('.giraviItemsTable tfoot').find('.totalTr').find('.gwTotTfoot span:eq(0)').text(gwTot.toFixed(2));
		$('.giraviItemsTable tfoot').find('.totalTr').find('.nwTotTfoot span:eq(0)').text(nwTot.toFixed(2));
		$('.giraviItemsTable tfoot').find('.totalTr').find('.vTotTfoot span:eq(0)').text(vTot.toFixed(2));
		$('.giraviItemsTable tfoot').find('.totalTr').find('.payAmtTotTfoot span:eq(0)').text(payAmtTot.toFixed(2));

		$('.giraviMainTotAmt').text(payAmtTot.toFixed(2));
		
		if($('.giraviItemsTable tfoot').find('.totalTr').hasClass('hide')){
			$('.giraviItemsTable tfoot').find('.totalTr').removeClass('hide');
		}

		calculateInterest();
	}

	function calculateInterest() {
		var loanAmt = 0;
		if($('table.giraviItemsTable tbody tr').length > 0 && !$('table.giraviItemsTable tbody tr:first').hasClass('noDataTr')){
			$('table.giraviItemsTable tbody tr').each(function(i,tr){
				var trObj = JSON.parse($(tr).find('span.rowItemObj').text());
				loanAmt = loanAmt + parseFloat(trObj.payableAmt ? trObj.payableAmt : 0);
			});
		}
		var tenurePeriodType = parseFloat($("select.tenurePeriodType").val());
		var tenurePeriod = parseFloat($("input.tenurePeriod").val());
		var interestRate = parseFloat($("select.roi").val());
		console.log('loanAmt , tenurePeriod , interestRate::',loanAmt , tenurePeriod , interestRate)
		if(loanAmt > 0 && tenurePeriod > 0 && interestRate > 0){
			var interestAmt = (tenurePeriod*interestRate)/100*loanAmt;
			console.log('interestAmt::'+interestAmt);
			$('.giraviMainTaxAmt').text(interestAmt.toFixed(2));
			$('.giraviMainGrandAmt').text((loanAmt+interestAmt).toFixed(2));
		}else{
			$(".giraviMainTaxAmt").text((0).toFixed(2));
			$(".giraviMainGrandAmt").text((loanAmt).toFixed(2));
		}
	}
	                                                                                                                                                                                                                    
	function deleteGiraviItm(obj,flag){
		var trObj = $(obj).closest('tr');
		$(trObj).remove();
		
		if($('.giraviItemsTable tbody tr').length>0){
			$('.giraviItemsTable tbody tr').each(function(i,trObj){
				$(trObj).find('.trCount').text(i+1)
			});
			updateTfootTotal();
		}else{
			$('.giraviItemsTable tfoot').find('.totalTr').addClass('hide');
			$('.giraviItemsTable tbody').append('<tr class="noDataTr">'+
			'<th colspan="10" style="text-align: center; padding: 20px 0px;"><i class="fa fa-plus hide"></i>&nbsp; &nbsp; No item found</th></tr>');
		}
		
	}
	
	function editCustomer(){
		$('.billToDetail').empty();
		$('.billToDetail').siblings('.form-group').removeClass('hide');
		$('.customerSelect').val(null).trigger('change');
		$('.customerSelect').select2('open');
	}

	function cancelGiravi(){
		reloadPage();
	}

	function clearGiravi(){
		$('.containtStart').find('input').val('');
		$('.containtStart').find('select').val(null).trigger('change');
		$('.bottom-total-group').find('.giraviMainTotAmt').text('0.00');    
		$('.bottom-total-group').find('.giraviMainDisAmt').text('0.00');    
		$('.bottom-total-group').find('.giraviMainTaxableAmt').text('0.00');
		$('.bottom-total-group').find('.giraviMainTaxAmt').text('0.00');    
		$('.bottom-total-group').find('.giraviMainGrandAmt').text('0.00');  
		$('.giraviItemsTable tbody').empty();
		$('.giraviItemsTable tfoot').find('.totalTr').addClass('hide');
		$('.giraviItemsTable tbody').append('<tr class="noDataTr">'+
		'<th colspan="10" style="text-align: center; padding: 20px 0px;"><i class="fa fa-plus hide"></i>&nbsp; &nbsp; No item found</th></tr>');
		$('.billToDetail').siblings('.form-group').removeClass('hide');
		$('.billToDetail').empty();
		$('.recipientDesc').val('1.\n2.\n3.\n4.')


		$('.containtStart').find('input').val('');
		$('.containtStart').find('select').val('');
		$('.containtStart').find('.select2-hidden-accessible').val(null).trigger('change');
		$('.containtStart').find('textarea').val('');
		$('.containtStart').find('.alert').remove();
		$('.containtStart').find('.select2-hidden-accessible').removeClass('parsley-error');
		$('.containtStart').find('.parsley-error').removeClass('parsley-error');
		$('.containtStart').find('.parsley-success').removeClass('parsley-success');
		$('.containtStart').find('.select2-selection').removeClass('parsley-error');

		$('#giraviId').val(0);
		$('#giraviFlag').val('N');


		//$('.containtStart').find('.giraviSave').attr('onclick',"saveItem(this,'N')");
		$('.containtStart').find('.giraviSave').removeClass('btn-danger').addClass('btn-primary');
		$('.containtStart').find('.giraviSave').text('Save Giravi');
		$('.containtStart').find('.giraviSave').prop('disabled',true);
		//$('.parsleyField.mandatory').parsley();
		$('#mainForm').parsley();
	}


	function saveGiravi(btnObj){

		if($('.giraviItemsTable tbody tr').length == 0 || $('.giraviItemsTable tbody').find('.noDataTr').length){
			alert('Please add items to giravi');
			return;
		}
		
		var giraviItems = [];
		$('.giraviItemsTable tbody tr').each(function(i,tr){
			giraviItems.push(JSON.parse($(tr).find('.rowItemObj').text()));
		});

		
		var formData = {
			'giraviId'		     : $('#giraviId').val(),
			'flag'               : $('#giraviFlag').val(),
			'items'              : JSON.stringify(giraviItems),
			'customerId'         : $('.customer-form-group').find('.customerSelect').val(),
			'giraviNo'           : $('.giravi-detail-group').find('.giraviNum').val(),
			'giraviDate'         : $('.giravi-detail-group').find('.giraviDate').val(),
			'intrestRate'        : $('.giravi-detail-group').find('select.roi').val(),
			'netPayableAmount'   : $('.bottom-total-group').find('.giraviMainGrandAmt').text(),
			'loanAmount'         : $('.bottom-total-group').find('.giraviMainGrandAmt').text(),
			'intrestAmount'      : $('.bottom-total-group').find('.giraviMainTaxAmt').text(),
		 	'tenurePeriod' 		 : $('.giravi-detail-group').find('input.tenurePeriod').val(),
		 	'tenureType' 		 : $('.giravi-detail-group').find('select.tenurePeriodType').val(),
		 	'recipientDesc' 	 : $('.recipientDesc').val(),
		}
		
		
		//console.log('giravi formData:',formData);


		$.ajax({
			url : '/app/giravi/giraviMaster/saveGiravi',
			method : 'POST',
			data : formData,
			async : false,
			success : function(resp) {
				console.log('resp',resp);
				if(resp.status=="success"){
					//clearGiravi();
					alert(resp.msg,'S');
					//needReloadItem=true;
					//clearItemForm($('#itemForm'));
					$('#modalAddItem').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'+
				    '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
				}else{
					alert(resp.msg,'E');
					//needReloadItem=false;
					//$('#modalAddItem').find('.modal-content').find('.alert').remove();
					$('#modalAddItem').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'+
		            '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
				}
			},
			error : function(event, jqxhr, settings){
				console.log('ajaxErrorrrrr::', event, jqxhr, settings)

				$.confirm({
				    title: event.responseJSON.error,
				    type: 'red',
				    typeAnimated: true,
				    buttons: {
				    	close: {
				            text: 'Close',
				            btnClass: 'btn-red',
				            action: function(){
				            }
				        }
				    }
				});
			}
		});
		
		
	}


	$('#mainForm').find('.mandatory').on('change input keyup paste keypress', function(){
		setTimeout(function(){
			var parsleyFieldLength = $('#mainForm').find('.mandatory').length;
			if($('#mainForm').find('.parsley-success').length==parsleyFieldLength){
				$('#giraviSaveBtn').prop('disabled',false);
			}else{
				$('#giraviSaveBtn').prop('disabled',true);
			}
		},10);
	});  
	
	</script>
</body>
</html>