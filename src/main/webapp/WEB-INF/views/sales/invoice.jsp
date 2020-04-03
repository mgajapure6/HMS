<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="com.fasterxml.jackson.databind.SerializationFeature"%>
<%ObjectMapper mapper = new ObjectMapper();
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
	<input type="hidden" value="0" id="invoiceId">
	<input type="hidden" value="N" id="invoiceFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-20 bd-b pd-b-10 fixed-header">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-5">
					<li class="breadcrumb-item active" aria-current="page">New Invoice</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Create New Invoice</h4>
		</div>
		<!-- <div class="d-none d-md-block"></div> -->
		<div style="margin: auto;">
			<button type="button" class="btn btn-white" onclick="cancelInvoice()">Cancel</button>
			<button type="button" data-flag="N" class="btn btn-primary invoiceSave" id="invoiceSaveBtn" onclick="saveInvoice(this)">Save Invoice</button>
		</div>
	</div>
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
		<div class="col-md-6 invoice-detail-group">
			<h5>Invoice Detail</h5>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group mg-b-5">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Invoice Number</label>
						<input type="text" class="form-control mandatory invoiceNum parsleyField" placeholder="Enter invoice number" autocomplete="off" required data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="18" data-parsley-minlength-message="Enter at least 2 character. " data-parsley-maxlength-message="Cannot exist more than 18 character">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group mg-b-5">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Invoice Date</label>
						<input type="text" class="form-control mandatory invoiceDate dateCleave parsleyField" readonly placeholder="Select invoice date" autocomplete="off" required data-parsley-trigger="change" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Date is incorrect" data-parsley-maxlength-message="Date is incorrect">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group mg-b-5">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">P.O/S.O Number</label>
						<input type="text" class="form-control posonum" placeholder="Enter P.O. / S.O. number " autocomplete="off">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group mg-b-5">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Payment Due Date</label>
						<input type="text" class="form-control paymentDueDate dateCleave" placeholder="Select payment due date" autocomplete="off" readonly>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="col-md-12">
			<hr>
			<div class="d-flex" style="align-items: center;">
				<div class="pd-10 flex-grow-1">
					<h5 class="mandlabel">Invoice Items</h5>
				</div>
				<!-- manage columns -->
				<div class="pd-10 mg-l-auto">
					<div class="dropdown manageColumnsDropdown">
						<a class="dropdown-toggle" id="manageColumnsDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: #0168fa;"> Manage columns </a>
						<div class="dropdown-menu" aria-labelledby="manageColumnsDropdown">
							<form class=" pd-8">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="hsnColumnCheck" checked="checked" onchange="manageColumn(this,'hsn')">
									<label class="custom-control-label" for="hsnColumnCheck">HSN</label>
								</div>
								<div class="dropdown-divider"></div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="upColumnCheck" checked="checked" onchange="manageColumn(this,'up')">
									<label class="custom-control-label" for="upColumnCheck">Unit Price</label>
								</div>
								<div class="dropdown-divider"></div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="discountColumnCheck" checked="checked" onchange="manageColumn(this,'disc')">
									<label class="custom-control-label" for="discountColumnCheck">Discount</label>
								</div>
								<div class="dropdown-divider"></div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="taxColumnCheck" checked="checked" onchange="manageColumn(this,'tax')">
									<label class="custom-control-label" for="taxColumnCheck">Tax</label>
								</div>
							</form>
						</div>
					</div>
					<!-- <a href="javascript:;">
						Manage columns &nbsp;&nbsp;
						<i class="fa fa-angle-down"></i>
					</a> -->
				</div>
			</div>
			<div class="table-responsive">
				<table class="table invoiceItemsTable border-b">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Item</th>
							<th scope="col" class="col-hsn">HSN</th>
							<th scope="col">Quantity</th>
							<th scope="col" class="col-up">Unit Price</th>
							<th scope="col">Total Amount</th>
							<th scope="col" class="col-disc">Discount</th>
							<th scope="col">Taxable Amount</th>
							<th scope="col" class="col-tax">Tax</th>
							<th scope="col" style="text-align: center;">Action</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
					<tfoot>
						<tr class="totalTr hide">
							<th colspan="3" style="text-align: right;"><b>Total :</b></th>
							<th class="qtyTotTfoot"><span>0</span> items</th>
							<th class="upTotTfoot col-up">Rs: <span>0</span>
							</th>
							<th class="taTotTfoot">Rs: <span>0</span>
							</th>
							<th class="dTotTfoot col-disc">Rs: <span>0</span>
							</th>
							<th class="taxAmtTotTfoot">Rs: <span>0</span>
							</th>
							<th class="taxTotTfoot col-tax">Rs: <span>0</span>
							</th>
							<th class=""></th>
						</tr>
					</tfoot>
				</table>
			</div>
			<div style="text-align: right; padding: 20px 0px;">
				<a href="javascript:;" onclick="openAddSalesInvoiveItemModal()" class="btn btn-outline-primary">
					<i class="fa fa-plus"></i> &nbsp; &nbsp; Add Item
				</a>
			</div>
			<hr style="margin-top: 0;">
		</div>
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-7">
					<div class="accordion accordion-style1">
						<h6 class="recipientDescCollapse">Write a description to the recipient (will be printed at the footer of an invoice).......</h6>
						<div style="padding: 0;">
							<textarea class="form-control recipientDesc" style="border: 0; border-top: 1px solid #e6e6e6;" rows="5" placeholder="Write a description to the recipient..."></textarea>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-control-like-div bottom-total-group">
						<div class="d-flex" style="align-items: center;">
							<div class=" flex-grow-1">
								<b>Invoice Amount</b>
							</div>
							<!-- <div class="pd-10">Flex item</div> -->
							<div class="mg-l-auto">
								<b>Rs :</b> <b class="invoiceMainTotAmt">0.00</b>
							</div>
						</div>
						<hr style="margin: 3px">
						<div class="d-flex" style="align-items: center;">
							<div class=" flex-grow-1">
								<b>Discount Amount</b>
							</div>
							<!-- <div class="pd-10">Flex item</div> -->
							<div class=" mg-l-auto">
								<b>Rs :</b> <b class="invoiceMainDisAmt">0.00</b>
							</div>
						</div>
						<hr style="margin: 3px">
						<div class="d-flex" style="align-items: center;">
							<div class=" flex-grow-1">
								<b>Taxable Amount</b>
							</div>
							<!-- <div class="pd-10">Flex item</div> -->
							<div class=" mg-l-auto">
								<b>Rs :</b> <b class="invoiceMainTaxableAmt">0.00</b>
							</div>
						</div>
						<hr style="margin: 3px">
						<div class="d-flex" style="align-items: center;">
							<div class=" flex-grow-1">
								<b>Tax Amount</b>
							</div>
							<!-- <div class="pd-10">Flex item</div> -->
							<div class=" mg-l-auto">
								<b>Rs :</b> <b class="invoiceMainTaxAmt">0.00</b>
							</div>
						</div>
						<hr style="margin: 3px">
						<div class="d-flex" style="align-items: center;">
							<div class=" flex-grow-1">
								<b>Grand Total Amount</b>
							</div>
							<!-- <div class="pd-10">Flex item</div> -->
							<div class=" mg-l-auto">
								<b>Rs :</b> <b class="invoiceMainGrandAmt">0.00</b>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="col-md-12">
			<div class="accordion mg-t-20 accordion-style1">
				<h6 class="recipientDescCollapse">Write a description to the recipient (will be printed at the footer of an invoice).......</h6>
				<div style="padding: 0;">
					<textarea class="form-control recipientDesc" style="border: 0; border-top: 1px solid #e6e6e6;" rows="4" placeholder="Write a description to the recipient..."></textarea>
				</div>
			</div>
		</div> -->
		<div class="col-md-12">
			<hr>
			<div style="float: right;" class="hide">
				<button type="button" class="btn btn-white" onclick="cancelInvoice()">Cancel</button>
				<button type="button" data-flag="N" class="btn btn-primary invoiceSave" id="invoiceSaveBtn" onclick="saveInvoice(this)" disabled>Save Invoice</button>
			</div>
		</div>
	</div>
	<jsp:include page="../inventory/AddItemFormModal.jsp"></jsp:include>
	<jsp:include page="../inventory/AddCategoryFormModal.jsp"></jsp:include>
	<jsp:include page="AddCustomerFormModal.jsp"></jsp:include>
	<jsp:include page="AddDiscountFormModal.jsp"></jsp:include>
	<jsp:include page="AddTaxFormModal.jsp"></jsp:include>
	<jsp:include page="AddSoldItemToInvoiceFormModal.jsp"></jsp:include>
	<script type="text/javascript">
		function manageColumn(obj,colName){
			if($(obj).is(':checked')){
				$('.invoiceItemsTable').find('.col-'+colName).removeClass('hide');
				if(colName=='hsn'){
					$('.invoiceItemsTable').find('.totalTr th:eq(0)').attr('colspan','3');
				}
			}else{
				$('.invoiceItemsTable').find('.col-'+colName).addClass('hide');
				if(colName=='hsn'){
					$('.invoiceItemsTable').find('.totalTr th:eq(0)').attr('colspan','2');
				}
			}
		}
	
	
		$(function(){

			$('.parsleyField.mandatory').parsley();

			
			$('.accordion').accordion({
			  heightStyle: 'content',
			  collapsible: true
			});
			
			$('.recipientDescCollapse').click();
			$('.recipientDesc').val('1.\n2.\n3.\n4.')
			
			$('.invoiceDate').datepicker({
				  dateFormat: 'dd-mm-yy',
				  showOtherMonths: true,
				  selectOtherMonths: true,
				  changeMonth: true,
				  changeYear: true,
			});

			$('.invoiceDate').datepicker().on('changeDate', function(e) {
				$('.invoiceDate').parsley();
				$('.invoiceDate').change();
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
			
			
			//width: 287.5px;
			
			if($('.invoiceItemsTable tbody tr').length<=0){
				$('.invoiceItemsTable tbody').append('<tr class="noDataTr">'+
						'<th colspan="10" style="text-align: center; padding: 20px 0px;"><i class="fa fa-plus hide"></i>&nbsp; &nbsp; No item found</th></tr>')
			}
			
		});
		
		
		function openAddSalesInvoiveItemModal() {
			clearSalesInvoiceItemForm();
			$('#modalAddSalesInvoiceItem').modal('toggle');
			
		}

		
		function openItemModal(){
			clearItemForm($('#itemForm')); //function written in include jsp files
			$('#modalAddSalesInvoiceItem').modal('toggle');
			$('#modalAddItem').modal('toggle');
		}
		
		function openCategoryModal(){
			clearCategoryForm($('#categoryForm')); //function written in include jsp files
			$('#modalAddItem').modal('toggle');
			$('#modalAddCategory').modal('toggle');
			$('#categoryForm').find('.categoryName').focus();
		}
		
		function openDiscountEntryModal(){
			clearDiscountForm($('#discountForm'));
			$('#modalAddSalesInvoiceItem').modal('toggle');
			$('#modalAddDiscount').modal('toggle');
		}
		
		function openTaxEntryModal(){
			clearTaxForm($('#taxForm'));
			$('#modalAddSalesInvoiceItem').modal('toggle');
			$('#modalAddTax').modal('toggle');
		}

		function openAddCustomerModal(){
			clearCustomerForm($('#customerForm'));
			$(".customerSelect").select2("close");
			$('#modalAddCustomer').modal('toggle');
		}
		
		
		

		
		
		function updateTableSerialNumber(){
			$('.invoiceItemsTable tbody tr').each(function(i,trObj){
				$(trObj).find('.trCount').text(i+1)
			});
		}
		
		function updateTfootTotal(){
			
			var qtyTot = 0.00;
			var upTot = 0.00;
			var taTot = 0.00;
			var dTot = 0.00;
			var taxAmtTot = 0.00;
			var taxTot = 0.00;
			var discTot = 0.00;
			
			$('.invoiceItemsTable tbody tr').each(function(i,trObj){
				//$(trObj).find('.trCount').text(i+1)
				qtyTot = qtyTot + parseFloat($(this).find('.itemQtyTd span').text());
				upTot = upTot + parseFloat($(this).find('.itemUPTd span').text());
				taTot = taTot + parseFloat($(this).find('.itemTATd span').text());
				dTot = dTot + parseFloat($(this).find('.itemDisTd .discamt').text());
				taxAmtTot = taxAmtTot + parseFloat($(this).find('.itemTaxAmtTd .txamt').text());
				taxTot = taxTot + parseFloat($(this).find('.itemTaxTd .rowTaxTotAmt').text());
				discTot = discTot + parseFloat($(this).find('.itemTaxTd .rowDiscTotAmt').text());
			});
			
			$('.invoiceItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text(qtyTot.toFixed(2));
			$('.invoiceItemsTable tfoot').find('.totalTr').find('.upTotTfoot span:eq(0)').text(upTot.toFixed(2));
			$('.invoiceItemsTable tfoot').find('.totalTr').find('.taTotTfoot span:eq(0)').text(taTot.toFixed(2));
			$('.invoiceItemsTable tfoot').find('.totalTr').find('.dTotTfoot span:eq(0)').text(dTot.toFixed(2));
			$('.invoiceItemsTable tfoot').find('.totalTr').find('.taxAmtTotTfoot span:eq(0)').text(taxAmtTot.toFixed(2));
			$('.invoiceItemsTable tfoot').find('.totalTr').find('.taxTotTfoot span:eq(0)').text(taxTot.toFixed(2));
			
			var invoiceMainGrandAmt = (taTot + taxTot)-dTot;
			
			$('.invoiceMainTotAmt').text(taTot.toFixed(2));
			$('.invoiceMainTaxAmt').text(taxTot.toFixed(2));
			$('.invoiceMainDisAmt').text(discTot.toFixed(2));
			$('.invoiceMainGrandAmt').text(invoiceMainGrandAmt.toFixed(2));
			
			
			if($('.invoiceItemsTable tfoot').find('.totalTr').hasClass('hide')){
				$('.invoiceItemsTable tfoot').find('.totalTr').removeClass('hide');
			}
		}
		                                                                                                                                                                                                                    
		function deleteInvoiceItm(obj,flag){
			var trObj = $(obj).closest('tr');
			//substractTfootTotal(trObj)
			$(trObj).remove();
			
			if($('.invoiceItemsTable tbody tr').length>0){
				$('.invoiceItemsTable tbody tr').each(function(i,trObj){
					$(trObj).find('.trCount').text(i+1)
				});
				updateTfootTotal();
			}else{
				$('.invoiceItemsTable tfoot').find('.totalTr').addClass('hide');
				$('.invoiceItemsTable tbody').append('<tr class="noDataTr">'+
				'<th colspan="10" style="text-align: center; padding: 20px 0px;"><i class="fa fa-plus hide"></i>&nbsp; &nbsp; No item found</th></tr>');
			}
			
		}
		
		
		
		
		function editCustomer(){
			$('.billToDetail').empty();
			$('.billToDetail').siblings('.form-group').removeClass('hide');
			$('.customerSelect').val(null).trigger('change');
			$('.customerSelect').select2('open');
		}

		function cancelInvoice(){
			reloadPage();
		}

		function clearInvoice(){
			$('.containtStart').find('input').val('');
			$('.containtStart').find('select').val(null).trigger('change');
			$('.bottom-total-group').find('.invoiceMainTotAmt').text('0.00');    
			$('.bottom-total-group').find('.invoiceMainDisAmt').text('0.00');    
			$('.bottom-total-group').find('.invoiceMainTaxableAmt').text('0.00');
			$('.bottom-total-group').find('.invoiceMainTaxAmt').text('0.00');    
			$('.bottom-total-group').find('.invoiceMainGrandAmt').text('0.00');  
			$('.invoiceItemsTable tbody').empty();
			$('.invoiceItemsTable tfoot').find('.totalTr').addClass('hide');
			$('.invoiceItemsTable tbody').append('<tr class="noDataTr">'+
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

			$('#invoiceId').val(0);
			$('#invoiceFlag').val('N');


			//$('.containtStart').find('.invoiceSave').attr('onclick',"saveItem(this,'N')");
			$('.containtStart').find('.invoiceSave').removeClass('btn-danger').addClass('btn-primary');
			$('.containtStart').find('.invoiceSave').text('Save Invoice');
			$('.containtStart').find('.invoiceSave').prop('disabled',true);
			$('.parsleyField.mandatory').parsley();
		}


		function saveInvoice(btnObj){

			if($('.invoiceItemsTable tbody tr').length == 0 || $('.invoiceItemsTable tbody').find('.noDataTr').length){
				alert('Please add items to invoice');
				return;
			}
			
			var soldItems = [];
			$('.invoiceItemsTable tbody tr').each(function(i,tr){
				soldItems.push(JSON.parse($(tr).find('.rowItemObj').text()));
			});

			
			var formData = {
					'invoiceId'   : $('#invoiceId').val(),
					'flag'        : $('#invoiceFlag').val(),
					'items'       : JSON.stringify(soldItems),
					'customerId'  : $('.customer-form-group').find('.customerSelect').val(),
					'invNo'       : $('.invoice-detail-group').find('.invoiceNum').val(),
					'invDate'     : $('.invoice-detail-group').find('.invoiceDate').val(),
					'posoNo'      : $('.invoice-detail-group').find('.posonum').val(),
					'payDueDate'  : $('.invoice-detail-group').find('.paymentDueDate').val(),
					'invAmt'      : $('.bottom-total-group').find('.invoiceMainTotAmt').text(),
					'discountAmt' : $('.bottom-total-group').find('.invoiceMainDisAmt').text(),
					'taxableAmt'  : $('.bottom-total-group').find('.invoiceMainTaxableAmt').text(),
					'taxAmt'      : $('.bottom-total-group').find('.invoiceMainTaxAmt').text(),
					'grndTotAmt'  : $('.bottom-total-group').find('.invoiceMainGrandAmt').text(),
					'recipientDesc' : $('.recipientDesc').val()
			}
			
			
			//console.log('invoice formData:',formData);


			$.ajax({
				url : '/sales/saveUpdateDeleteSalesOrder',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					console.log('resp',resp);
					if(resp.status=="success"){
						clearInvoice();
						alert(resp.msg,'S');
						//needReloadItem=true;
						//clearItemForm($('#itemForm'));
						//$('#modalAddItem').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'+
					    //'<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
					}else{
						alert(resp.msg,'E');
						//needReloadItem=false;
						//$('#modalAddItem').find('.modal-content').find('.alert').remove();
						//$('#modalAddItem').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'+
			            //'<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
					}
				}
			});
			
			
		}

		$('.customer-form-group, .invoice-detail-group').find('.form-control.mandatory').on('change input keyup', function(){
			setTimeout(function(){
				var parsleyFieldLength = $('.customer-form-group, .invoice-detail-group').find('.parsleyField.mandatory').length;
				console.log('parsleyFieldLength',parsleyFieldLength)
				console.log('parsleyFieldLengthsuccess',$('.customer-form-group, .invoice-detail-group').find('.parsley-success').length)
			    var isValidForm = false;
				if($('.customer-form-group, .invoice-detail-group').find('.parsley-success').length==parsleyFieldLength){
					isValidForm = true;
				}else{
					isValidForm = false;
				}
				if(isValidForm){
					$('#invoiceSaveBtn').prop('disabled',false);
				}else{
					$('#invoiceSaveBtn').prop('disabled',true);
				}

			},10);
		}); 

	

	</script>
	<script type="text/javascript">

	
	
	/* function addTfootTotal(){
	var taxAmt = $('#salesInvoiceItemForm').find('.modalTotTaxAmt').text();

	var OqtyTotTfoot =    	parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text())+parseFloat($('#salesInvoiceItemForm').find('.qty').val());
	var OupTotTfoot = 		parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.upTotTfoot span:eq(0)').text())+parseFloat($('#salesInvoiceItemForm').find('.unitPrice').val());
	var OtaTotTfoot = 		parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.taTotTfoot span:eq(0)').text())+parseFloat($('#salesInvoiceItemForm').find('.modalTotAmt').text());
	var OdTotTfoot = 		parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.dTotTfoot span:eq(0)').text())+parseFloat($('#salesInvoiceItemForm').find('.modalDiscountAmt').text());
	var OtaxAmtTotTfoot = 	parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.taxAmtTotTfoot span:eq(0)').text())+parseFloat($('#salesInvoiceItemForm').find('.modalTotAmt').text());
	var OtaxTotTfoot = 		parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.taxTotTfoot span:eq(0)').text())+parseFloat(taxAmt);
	
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text(OqtyTotTfoot.toFixed(2));
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.upTotTfoot span:eq(0)').text(OupTotTfoot.toFixed(2));
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.taTotTfoot span:eq(0)').text(OtaTotTfoot.toFixed(2));
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.dTotTfoot span:eq(0)').text(OdTotTfoot.toFixed(2));
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.taxAmtTotTfoot span:eq(0)').text(OtaxAmtTotTfoot.toFixed(2));
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.taxTotTfoot span:eq(0)').text(OtaxTotTfoot.toFixed(2));
	
	var invoiceMainTotAmt =    parseFloat($('.invoiceMainTotAmt').text())+parseFloat($('#salesInvoiceItemForm').find('.modalTotAmt').text());
	var invoiceMainTaxAmt =    parseFloat($('.invoiceMainTaxAmt').text())+parseFloat(taxAmt);
	var invoiceMainDisAmt =    parseFloat($('.invoiceMainDisAmt').text())+parseFloat($('#salesInvoiceItemForm').find('.modalDiscountAmt').text());
	var invoiceMainGrandAmt =  parseFloat($('.invoiceMainGrandAmt').text())+parseFloat($('#salesInvoiceItemForm').find('.modalGrandTotAmt').text());
	
	$('.invoiceMainTotAmt').text(invoiceMainTotAmt.toFixed(2));
	$('.invoiceMainTaxAmt').text(invoiceMainTaxAmt.toFixed(2));
	$('.invoiceMainDisAmt').text(invoiceMainDisAmt.toFixed(2));
	$('.invoiceMainGrandAmt').text(invoiceMainGrandAmt.toFixed(2));
	
	
	if($('.invoiceItemsTable tfoot').find('.totalTr').hasClass('hide')){
		$('.invoiceItemsTable tfoot').find('.totalTr').removeClass('hide');
	}
	
}  */

/* function substractTfootTotal(trObj){
	var OqtyTotTfoot =    	parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemQtyTd span:eq(0)').text());
	var OupTotTfoot = 		parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.upTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemUPTd span:eq(0)').text());
	var OtaTotTfoot = 		parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.taTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemTATd span:eq(0)').text());
	var OdTotTfoot = 		parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.dTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemDisTd span:eq(0)').text());
	var OtaxAmtTotTfoot = 	parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.taxAmtTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemTaxAmtTd span:eq(0)').text());
	var OtaxTotTfoot = 		parseFloat($('.invoiceItemsTable tfoot').find('.totalTr').find('.taxTotTfoot span:eq(0)').text())-parseFloat($(trObj).find('.itemTaxTd .rowTaxTotAmt').text()==""?"0.00":$(trObj).find('.itemTaxTd .rowTaxTotAmt').text());

	$('.invoiceItemsTable tfoot').find('.totalTr').find('.qtyTotTfoot span:eq(0)').text(OqtyTotTfoot.toFixed(2));
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.upTotTfoot span:eq(0)').text(OupTotTfoot.toFixed(2));
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.taTotTfoot span:eq(0)').text(OtaTotTfoot.toFixed(2));
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.dTotTfoot span:eq(0)').text(OdTotTfoot.toFixed(2));
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.taxAmtTotTfoot span:eq(0)').text(OtaxAmtTotTfoot.toFixed(2));
	$('.invoiceItemsTable tfoot').find('.totalTr').find('.taxTotTfoot span:eq(0)').text(OtaxTotTfoot.toFixed(2));
	
	var invoiceMainTotAmt =    parseFloat($('.invoiceMainTotAmt').text())-parseFloat($(trObj).find('.itemTATd span:eq(0)').text());
	var invoiceMainTaxAmt =    parseFloat($('.invoiceMainTaxAmt').text())-parseFloat($(trObj).find('.itemTaxTd .rowTaxTotAmt').text()==""?"0.00":$(trObj).find('.itemTaxTd .rowTaxTotAmt').text());
	var invoiceMainDisAmt =    parseFloat($('.invoiceMainDisAmt').text())-parseFloat($(trObj).find('.itemDisTd span:eq(0)').text());
	var invoiceMainGrandAmt =  parseFloat($('.invoiceMainGrandAmt').text())-parseFloat($(trObj).find('.itemGrandAmt').text());
	
	$('.invoiceMainTotAmt').text(invoiceMainTotAmt.toFixed(2));
	$('.invoiceMainTaxAmt').text(invoiceMainTaxAmt.toFixed(2));
	$('.invoiceMainDisAmt').text(invoiceMainDisAmt.toFixed(2));
	$('.invoiceMainGrandAmt').text(invoiceMainGrandAmt.toFixed(2));
}    */     
	</script>
</body>
</html>