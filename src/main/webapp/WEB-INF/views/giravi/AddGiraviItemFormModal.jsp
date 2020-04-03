<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalAddGiraviItem" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog wd-sm-750" role="document" style="max-width: 661px;">
		<div class="modal-content">
			<form id="giraviItemForm">
				<div class="modal-header pd-x-20 pd-sm-x-30">
					<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</a>
					<div class="media align-items-center">
						<span class="tx-color-03 d-none d-sm-block"> <i data-feather="box"></i>
						</span>
						<div class="media-body mg-sm-l-20">
							<h4 class="tx-18 tx-sm-20 mg-b-2">Add Item to giravi</h4>
						</div>
					</div>
				</div>
				<div class="modal-body pd-sm-x-30">
					<div class="form-group mg-b-0">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Enter item name</label>
						<input type="text" placeholder="Enter Item Name" class="form-control mandatory giraviItemNameInput" required data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-minlength-message="Item Name must be valid name." data-parsley-required-message="Item Name must be required.">
						<input type="hidden" class="itmId" value="0">
					</div>
					<div class="row row-sm mg-t-10">
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Select Metal</label>
							<select onkeyup="" class="form-control metalSelect">
								<option value="G">Gold</option>
								<option value="G">Silver</option>
							</select>
						</div>
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Quantity</label>
							<input type="text" class="form-control right mandatory giraviItemQtyInput qtyCleave" placeholder="Enter quantity" required data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter proper quantity ">
						</div>
					</div>
					<div class="row row-sm mg-t-10">
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Gross Weight</label>
							<input type="text" class="form-control right mandatory grossWeightInput grossWeightCleave" required placeholder="Enter Gross Weight" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter proper weight. ">
						</div>
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Gross Weight Unit</label>
							<select class="form-control guomSelect">
								<option value="gm" selected>Gram</option>
								<option value="mg">MiliGram</option>
							</select>
						</div>
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Net Weight</label>
							<input type="text" class="form-control right mandatory netWeightInput netWeightCleave" required placeholder="Enter Net Weight" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter proper weight. ">
						</div>
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Net Weight Unit</label>
							<select class="form-control nuomSelect">
								<option value="gm" selected>Gram</option>
								<option value="mg">MiliGram</option>
							</select>
						</div>
					</div>
					<div class="row row-sm mg-t-10">
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Valuation Amount</label>
							<input type="text" class="form-control right valuationInput valuationCleave" placeholder="Enter Valuation Amount">
						</div>
						<div class="col-sm mg-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Payable Amount</label>
							<input type="text" onkeyup="" class="form-control right mandatory payableAmountInput payableAmountCleave" required placeholder="Enter Payable Amount" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter proper amount. ">
						</div>
					</div>
					<div class="row row-sm mg-t-50">
						<div class="col-sm mg-t-10" style="text-align: right;">
							<button type="button" class="btn btn-white" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary addItemToGiraviBtn" data-flag="N" onclick="addItemToGiravi(this,'N')" disabled>Add item to giravi</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">

	$(function () {

		//loadAllInventoryItems();
		
	});


	new Cleave('.qtyCleave', {
		numeral: true,
		numeralDecimalScale: 0,
		numeralPositiveOnly: true,
		numeralThousandsGroupStyle: 'lakh',
	});

	new Cleave('.grossWeightCleave', {
		numeral: true,
		numeralDecimalScale: 4,
		numeralThousandsGroupStyle: 'lakh',
		numeralPositiveOnly: true,
	});

	new Cleave('.netWeightCleave', {
		numeral: true,
		numeralDecimalScale: 4,
		numeralThousandsGroupStyle: 'lakh',
		numeralPositiveOnly: true,
	});

	new Cleave('.valuationCleave', {
		numeral: true,
		numeralDecimalScale: 4,
		numeralThousandsGroupStyle: 'lakh',
		numeralPositiveOnly: true,
	});

	new Cleave('.payableAmountCleave', {
		numeral: true,
		numeralDecimalScale: 4,
		numeralThousandsGroupStyle: 'lakh',
		numeralPositiveOnly: true,
	});

	
	$('#giraviItemForm').find('.discountSelect').select2({
		width: '100%',
		placeholder: 'Select Discount...',
		allowClear: true,
	}).on('select2:open', () => {
		var nn = '<div class="row"><div class="col-sm"><div class="pd-y-10 pd-x-20 bg-ui-01"><a href="javascript:;" onclick="openDiscountEntryModal()"><i class="icon ion-md-add"></i> Create new discount entry</a></div></div></div>';
		$(".select2-results:not(:has(a))").append(nn);
	}).val(null).trigger('change');


	$('#modalAddGiraviItem').on('hidden.bs.modal', function () {
		$('#giraviItemForm').find('.searchInventoryItem').select2('close');
		$('#giraviItemForm').find('.taxSelect').select2('close');
		$('#giraviItemForm').find('.discountSelect').select2('close');
	});


	$('select').on('change', function () {
		if ($(this).val() != null) {
			$(this).trigger('input');
		}
		if ($(this).hasClass('mandatory') && $(this).closest('.parsley-select').find('ul').length > 0) {
			var ul = $(this).closest('.parsley-select').find('ul');
			$(this).closest('.parsley-select').find('ul').remove();
			$(this).closest('.parsley-select').append(ul);
		}
		if ($(this).hasClass('parsley-error') && $(this).hasClass('select2-hidden-accessible')) {
			//console.log('adding parsley-error class to select')
			$(this).removeClass('parsley-error');
			$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-success').addClass('parsley-error');
		} else if ($(this).hasClass('parsley-success')) {
			$(this).removeClass('parsley-success');
			$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-error').addClass('parsley-success');
		} else {
			$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-error').removeClass('parsley-success');
		}
	});


	$('#giraviItemForm').parsley().on('field:validated', function () {
		var parsleyFieldLength = $('#giraviItemForm').find('.mandatory').length;
		console.log('mandatory length',parsleyFieldLength)
		console.log('parsley length',$('#giraviItemForm').find('.parsley-success').length)
		var isValidForm = false;
		if ($('#giraviItemForm').find('.parsley-success').length == parsleyFieldLength) {
			isValidForm = true;
		} else {
			isValidForm = false;
		}
		if (isValidForm) {
			$('#giraviItemForm').find('.addItemToGiraviBtn').prop('disabled', false);
		} else {
			$('#giraviItemForm').find('.addItemToGiraviBtn').prop('disabled', true);
		}
	}).on('form:submit', function () {
		return false; // Don't submit form for this demo
	});




	function clearGiraviItemForm() {
		//console.log('clearItemForm')
		$('#giraviItemForm').find('.searchInventoryItem').addClass('newentry');
		$('#giraviItemForm').find('input').val('');
		$('#giraviItemForm').find('select').val('');
		$('#giraviItemForm').find('select').find('option:first').prop('selected',true).trigger('change');
		$('#giraviItemForm').find('.select2-hidden-accessible').val(null).trigger('change');
		$('#giraviItemForm').find('textarea').val('');
		$('#giraviItemForm').find('.alert').remove();
		$('#giraviItemForm').find('.discountObject').empty();
		$('#giraviItemForm').find('.taxObjectArray').empty();
		$('#giraviItemForm').find('.select2-hidden-accessible').removeClass('parsley-error');
		$('#giraviItemForm').find('.parsley-error').removeClass('.parsley-error');
		$('#giraviItemForm').find('.parsley-success').removeClass('.parsley-success');
		$('#giraviItemForm').find('.select2-selection').removeClass('.parsley-error');
		$('#giraviItemForm').find('.addItemToGiraviBtn').attr('onclick', "addItemToGiravi(this,'N')");
		$('#giraviItemForm').find('.addItemToGiraviBtn').prop('disabled', true);
		$('#giraviItemForm').find('input.itmId').val(0);
		$('#giraviItemForm').parsley().reset();

	}


	function addItemToGiravi(obj, flag) {
		$('.giraviItemsTable tbody').find('.noDataTr').remove();
		var itemId = $('#giraviItemForm').find('.itmId').val();
		var itmName = $('#giraviItemForm').find('.giraviItemNameInput').val();
		var metalType =  $('#giraviItemForm').find('.metalSelect').val();
		var qty = $('#giraviItemForm').find('.giraviItemQtyInput').val() == "" ? 0 : $('#giraviItemForm').find('.giraviItemQtyInput').val().split(",").join("");
		var grossWeight = $('#giraviItemForm').find('.grossWeightInput').val() == "" ? 0 : $('#giraviItemForm').find('.grossWeightInput').val().split(",").join("");
		var grossWeightUom =  $('#giraviItemForm').find('.guomSelect').val();
		var netWeight = $('#giraviItemForm').find('.netWeightInput').val() == "" ? 0 : $('#giraviItemForm').find('.netWeightInput').val().split(",").join("");
		var netWeightUom =  $('#giraviItemForm').find('.nuomSelect').val();
		var valuationAmt = $('#giraviItemForm').find('.valuationInput').val() == "" ? 0 : $('#giraviItemForm').find('.valuationInput').val().split(",").join("");
		var payableAmt = $('#giraviItemForm').find('.payableAmountInput').val() == "" ? 0 : $('#giraviItemForm').find('.payableAmountInput').val().split(",").join("");

		var itemObj = {};
		itemObj.id = itemId;
		itemObj.name = itmName;
		itemObj.qty = qty;
		itemObj.metalType = metalType;
		itemObj.grossWeight = grossWeight;
		itemObj.grossWeightUom = grossWeightUom;
		itemObj.netWeight = netWeight;
		itemObj.netWeightUom = netWeightUom;
		itemObj.valuationAmt = valuationAmt;
		itemObj.payableAmt = payableAmt;
		itemObj.grandAmt = payableAmt;

		var rowCount = $('.giraviItemsTable tbody tr').length;
		
		var tr = ' <tr>' +
			' <td class="trCount">' + (rowCount + 1) + '</td>' +
			' <td class="itemNameTd">' + itmName + ' '+(metalType=='G' ? '<span class="badge badge-warning">Gold</span>' : '<span class="badge badge-info">'+metalType+'</span>')+'</td>' +
			' <td class="itemQtyTd">' + qty + '</td>' +
			' <td class="itemGrossWeightTd col-up"><span>' + grossWeight + '</span> <span>' + grossWeightUom + '</span></td>' +
			' <td class="itemNetWeightTd"><span>' + netWeight + '</span> <span>' + netWeightUom + '</span></td>' +
			' <td class="itemValuationTd">Rs: ' + valuationAmt + '</td>' +
			' <td class="itemPayableAmtTd">Rs: ' + payableAmt + '</td>' +
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

		if (flag == 'N') {
			$('.giraviItemsTable tbody').append(tr);
		} else if (flag == 'M') {
			var rowindex = $(obj).data('rowindex');
			var oldTr = $('.giraviItemsTable tbody tr:eq(' + rowindex + ')');
			oldTr.replaceWith(tr);

			/* $('.giraviItemsTable tbody tr:eq('+rowindex+')').remove();
			if(rowindex==0){
				$('.giraviItemsTable tbody').prepend(tr);
			}else{
				$(tr).insertAfter($('.giraviItemsTable tbody tr:eq('+(rowindex)+')'));
			} */
			updateTableSerialNumber();
		}

		updateTfootTotal();
		$('#modalAddGiraviItem').modal('toggle');

	}


	function updateGiraviItm(obj) {
		clearGiraviItemForm();
		var trObj = $(obj).closest('tr');
		var itemObj = JSON.parse($(trObj).find('span.rowItemObj').text());

		$('#giraviItemForm').find('.itmId').val(itemObj.id);
		$('#giraviItemForm').find('.giraviItemNameInput').val(itemObj.name);
		$('#giraviItemForm').find('.metalSelect').val(itemObj.metalType).trigger('change');
		$('#giraviItemForm').find('.giraviItemQtyInput').val(itemObj.qty);
		$('#giraviItemForm').find('.grossWeightInput').val(itemObj.grossWeight);
		$('#giraviItemForm').find('.guomSelect').val(itemObj.grossWeightUom);
		$('#giraviItemForm').find('.netWeightInput').val(itemObj.netWeight);
		$('#giraviItemForm').find('.nuomSelect').val(itemObj.netWeightUom);
		$('#giraviItemForm').find('.valuationInput').val(itemObj.valuationAmt);
		$('#giraviItemForm').find('.payableAmountInput').val(itemObj.payableAmt);
		
		
		$('#giraviItemForm').find('.addItemToGiraviBtn').attr('onclick', "addItemToGiravi(this,'M')");
		$('#giraviItemForm').find('.addItemToGiraviBtn').data('rowindex', $(trObj).index());
		$('#giraviItemForm').parsley().validate();
		$('#modalAddGiraviItem').modal('toggle');
	}
</script>