<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalAddSalesInvoiceItem" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog wd-sm-750" role="document" style="max-width: 661px;">
		<div class="modal-content">
			<form id="salesInvoiceItemForm">
				<div class="modal-header pd-x-20 pd-sm-x-30">
					<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</a>
					<div class="media align-items-center">
						<span class="tx-color-03 d-none d-sm-block"> <i data-feather="box"></i>
						</span>
						<div class="media-body mg-sm-l-20">
							<h4 class="tx-18 tx-sm-20 mg-b-2">Add Item to invoice</h4>
						</div>
					</div>
				</div>
				<div class="modal-body pd-sm-x-30">
					<div class="form-group mg-b-0">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Search item here</label>
						<div class="parsley-select">
							<div class="form-group has-search">
								<span class="fa fa-search form-control-feedback newentry"></span>
								<select class="form-control mandatory searchInventoryItem" required data-parsley-trigger="input" data-parsley-validation-threshold="0">
									<%-- <c:set var="rCount" value="0"></c:set>
									<c:forEach items="${inventoryList}" var="itm">
										<fmt:parseNumber var="parsedQty" type="number" value="${itm.mainQty}" />
										<c:choose>
											<c:when test="${parsedQty <= 0}">
												<option disabled value="${itm.id}" data-category="${itm.itemCategory.categoryName}" data-category-id="${itm.itemCategory.id}" data-qty="${itm.mainQty}" data-sprice="${itm.sellingPrice}" data-lowqty="${itm.lowStockQty}" data-brand="${itm.brand}" data-mu="${itm.measurementUnit}">${itm.itemName}</option>
											</c:when>
											<c:otherwise>
												<option value="${itm.id}" data-category="${itm.itemCategory.categoryName}" data-category-id="${itm.itemCategory.id}" data-qty="${itm.mainQty}" data-sprice="${itm.sellingPrice}" data-lowqty="${itm.lowStockQty}" data-brand="${itm.brand}" data-mu="${itm.measurementUnit}">${itm.itemName}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach> --%>
								</select>
								<input type="hidden" class="itmId">
							</div>
						</div>
					</div>
					<div class="itemFound hide mg-t-20">
						<div class="row row-sm">
							<div class="col-sm mg-t-0">
								<span class="fieldSuggestionTxt"> Avai. Qty : <span class="fieldSuggestionQty"></span> <span class="fieldSuggestionUnit"></span>
								</span>
								<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Quantity to be sold</label>
								<input type="text" onkeyup="calculateTotalInModal()" class="form-control right mandatory qty qtyCleave" required placeholder="Enter quantity" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-max="" data-parsley-max-message="Qty should not be more than Avai. Qty" data-parsley-minlength-message="Enter at least 1 digit. ">
							</div>
							<div class="col-sm mg-t-0">
								<span class="fieldSuggestionTxt"> Orig. Unit Price : Rs <span class="fieldSuggestionUnitPrice"></span>
								</span>
								<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Unit Price</label>
								<input type="text" onkeyup="calculateTotalInModal()" class="form-control right mandatory unitPrice unitPriceCleave" required placeholder="Enter selling price" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter at least 1 digit. ">
							</div>
						</div>
						<div class="row row-sm ">
							<div class="col-sm mg-t-5">
								<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Select Tax</label>
								<select class="form-control taxSelect" onchange="calculateTotalInModal()" multiple>
									<c:forEach items="${allTaxes}" var="tax">
										<option value="${tax.id}" data-taxrate="${tax.taxRate}" data-taxregno="${tax.taxRegNo}" data-authname="${tax.authName}" data-taxcode="${tax.taxCode}">${tax.taxCode}</option>
									</c:forEach>
								</select>
								<span class="taxObjectArray hide"></span>
							</div>
							<div class="col-sm mg-t-5">
								<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Select Discount</label>
								<select class="form-control discountSelect" onchange="calculateTotalInModal()">
									<c:forEach items="${allDiscounts}" var="dis">
										<c:choose>
											<c:when test="${dis.discType == 'P'}">
												<option value="${dis.id}" data-discount="${dis.discount}" data-discode="${dis.disCode}" data-distype="${dis.discType}">${dis.discount}%</option>
											</c:when>
											<c:otherwise>
												<option value="${dis.id}" data-discount="${dis.discount}" data-discode="${dis.disCode}" data-distype="${dis.discType}">Rs: ${dis.discount}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
								<span class="discountObject hide"></span>
							</div>
						</div>
						<div class="modalTotDiv mg-t-10" style="text-align: right;">
							<p class="">
								Total Amount : Rs <b class="modalTotAmt">0.00</b>
							</p>
							<p class="">
								Tax Amount : Rs <b class="modalTotTaxAmt">0.00</b>
							</p>
							<p class="">
								Discount Amount : Rs <b class="modalDiscountAmt">0.00</b>
							</p>
							<p class="">
								Grand Total Amount : Rs <b class="modalGrandTotAmt">0.00</b>
							</p>
						</div>
						<div class="row row-sm">
							<div class="col-sm mg-t-10" style="text-align: right;">
								<button type="button" class="btn btn-white" data-dismiss="modal">Cancel</button>
								<button type="button" class="btn btn-primary addItemToInvoiceBtn" data-flag="N" onclick="addItemToInvoice(this,'N')" disabled>Add item to invoice</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">

	$(function () {

		loadAllInventoryItems();
		
	});


	$('#salesInvoiceItemForm').find('.taxSelect').select2({
		width: '100%',
		placeholder: 'Select Tax Type...',
		allowClear: true,
		multiple: true,
	}).on('select2:open', () => {
		var nn = '<div class="row"><div class="col-sm"><div class="pd-y-10 pd-x-20 bg-ui-01"><a href="javascript:;" onclick="openTaxEntryModal()"><i class="icon ion-md-add"></i> Create new tax entry</a></div></div></div>';
		$(".select2-results:not(:has(a))").append(nn);
	}).val(null).trigger('change');


	new Cleave('.qtyCleave', {
		numeral: true,
		numeralDecimalScale: 0,
		numeralPositiveOnly: true,
		numeralThousandsGroupStyle: 'lakh',
	});

	new Cleave('.unitPriceCleave', {
		numeral: true,
		numeralDecimalScale: 4,
		numeralThousandsGroupStyle: 'lakh',
		numeralPositiveOnly: true,
	});

	$('#salesInvoiceItemForm').find('.discountSelect').select2({
		width: '100%',
		placeholder: 'Select Discount...',
		allowClear: true,
	}).on('select2:open', () => {
		var nn = '<div class="row"><div class="col-sm"><div class="pd-y-10 pd-x-20 bg-ui-01"><a href="javascript:;" onclick="openDiscountEntryModal()"><i class="icon ion-md-add"></i> Create new discount entry</a></div></div></div>';
		$(".select2-results:not(:has(a))").append(nn);
	}).val(null).trigger('change');


	$('#modalAddSalesInvoiceItem').on('hidden.bs.modal', function () {
		$('#salesInvoiceItemForm').find('.searchInventoryItem').select2('close');
		$('#salesInvoiceItemForm').find('.taxSelect').select2('close');
		$('#salesInvoiceItemForm').find('.discountSelect').select2('close');
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


	$('#salesInvoiceItemForm').parsley().on('field:validated', function () {
		var parsleyFieldLength = $('#salesInvoiceItemForm').find('.mandatory').length;
		//console.log('mandatory length',parsleyFieldLength)
		var isValidForm = false;
		if ($('#salesInvoiceItemForm').find('.parsley-success').length == parsleyFieldLength) {
			isValidForm = true;
		} else {
			isValidForm = false;
		}
		if (isValidForm) {
			$('#salesInvoiceItemForm').find('.addItemToInvoiceBtn').prop('disabled', false);
		} else {
			$('#salesInvoiceItemForm').find('.addItemToInvoiceBtn').prop('disabled', true);
		}
	}).on('form:submit', function () {
		return false; // Don't submit form for this demo
	});


	function loadAllInventoryItems() {
		var url = '/app/inventory/itemServiceMaster/getInventoryItems?iid=null';
		$.ajax({
			url: url,
			method: 'POST',
			success: function (resp) {
				console.log('loadAllInventoryItems resp::',resp)
				var options = null;
				(resp.data).forEach(function (itm) {
					console.log('getAllInventoryItems itm :', itm);
					var disabled = "";
					if (parseFloat(itm.mainQty) <= 0) {
						disabled = "disabled";
					}
					options = options + '<option ' + disabled + ' value="' + itm.id + '" data-qty="' + itm.mainQty + '" data-sprice="' + itm.sellingPrice + '" data-lowqty="' + itm.lowStockQty + '" data-brand="' + itm.brand + '" data-mu="' + itm.measurementUnit + '">' + itm.itemName + '</option>';
				});
				$('#salesInvoiceItemForm').find('.searchInventoryItem').append(options);


				$('#salesInvoiceItemForm').find('.searchInventoryItem').select2({
					width: '100%',
					placeholder: 'Type item name here...',
					allowClear: true,
					templateResult: select2Itemformat,
					escapeMarkup: function (m) {
						return m;
					}
				}).on('select2:open', () => {
					var nn = '<div class="row"><div class="col-sm"><div class="pd-y-10 pd-x-20 bg-ui-01"><a href="javascript:;" onclick="openItemModal()"><i class="icon ion-md-add"></i> Create new inventory item</a></div></div></div>';
					$(".select2-results:not(:has(a))").append(nn);
				}).on("select2:unselecting", function (e) {
					$(this).trigger('input');
				}).on('change', function () {
					if ($(this).val() != '' && $(this).val() != null) {
						//<span class="fieldSuggestionTxt">Avai. Qty : <span class="fieldSuggestionQty"></span> <span class="fieldSuggestionUnit"></span></span>
						/* var exsistingQty = 0;
						var exsistingUnitPrice = 0;
						var exsistingQty = 0;
						var exsistingQty = 0;
						var exsistingQty = 0;
						var exsistingQty = 0;  */
						var isItemAvailInTbl = false;
						var trObj = null;
						$('.invoiceItemsTable tbody tr').each(function (i, trObjj) {
							if ($(trObjj).find('.itemId').text() == $('#salesInvoiceItemForm').find('.searchInventoryItem').val()) {
								isItemAvailInTbl = true;
								trObj = $(trObjj);
							}
						});

						if (isItemAvailInTbl && $(this).hasClass('newentry')) {
							console.log('found');
							$('#salesInvoiceItemForm').find('.qty').val($(trObj).find('.itemQtyTd span').text()).trigger('keyup');
							$('#salesInvoiceItemForm').find('.unitPrice').val($(trObj).find('.itemUPTd span').text()).trigger('keyup');

							var taxVal = [];
							if ($.isArray(JSON.parse($(trObj).find('.rowTaxObjArray').text()))) {
								JSON.parse($(trObj).find('.rowTaxObjArray').text()).forEach(function (tax) {
									taxVal.push(tax.taxId);
								});
							}
							$('#salesInvoiceItemForm').find('.taxSelect').val(taxVal).trigger('change');
							if ($(trObj).find('.rowDiscountObj').text() != "") {
								var discObj = JSON.parse($(trObj).find('.rowDiscountObj').text());
								$('#salesInvoiceItemForm').find('.discountSelect').val(discObj.id).trigger('change');
							} else {
								$('#salesInvoiceItemForm').find('.discountSelect').val(null).trigger('change');
							}

							$('#salesInvoiceItemForm').find('.addItemToInvoiceBtn').attr('onclick', "addItemToInvoice(this,'M')");
							$('#salesInvoiceItemForm').find('.addItemToInvoiceBtn').data('rowindex', $(trObj).index());
						} else {
							console.log('not found');
							$('#salesInvoiceItemForm').find('.qty').val('').trigger('keyup');
							$('#salesInvoiceItemForm').find('.taxSelect').val(null).trigger('change');
							$('#salesInvoiceItemForm').find('.discountSelect').val(null).trigger('change');
							$('#salesInvoiceItemForm').find('.unitPrice').val($(this).find('option:selected').data('sprice')).trigger('keyup');
							$('.select2-search__field').css('width', '100%');
						}
						$('#salesInvoiceItemForm').find('.unitPrice').siblings('.fieldSuggestionTxt').find('.fieldSuggestionUnitPrice').empty().text($(this).find('option:selected').data('sprice'));
						$('#salesInvoiceItemForm').find('.qty').siblings('.fieldSuggestionTxt').find('.fieldSuggestionQty').empty().text($(this).find('option:selected').data('qty'));
						$('#salesInvoiceItemForm').find('.qty').siblings('.fieldSuggestionTxt').find('.fieldSuggestionUnit').empty().text($(this).find('option:selected').data('mu'));
						$('#salesInvoiceItemForm').find('.qty').attr('data-parsley-max', $(this).find('option:selected').data('qty'));
						$('#salesInvoiceItemForm').find('.itmId').val($(this).val());
						$('#salesInvoiceItemForm').find('.itemFound').removeClass('hide');
					} else {
						$('#salesInvoiceItemForm').find('.itemFound').addClass('hide');
					}
				}).val(null).trigger('change');

			}
		});
	}

	function select2Itemformat(option) {
		if (!option.id) {
			return option.text;
		}
		//console.log('option::',option)
		var dataSet = option.element.dataset;
		var avtar = option.text.substring(0, 2);
		var Qty = dataSet.qty + ' ' + dataSet.mu;
		if (parseFloat(dataSet.qty) <= 0) {
			Qty = '<span style="color:red;">' + dataSet.qty + ' ' + dataSet.mu + '</span>';
		}

		var ob = '<div class="d-flex">' +
			'<div class="mg-r-10"><div class="avatar"><span class="avatar-initial rounded-circle">' + avtar + '</span></div></div>' +
			'<div class="flex-fill"><h6 class="tx-13 mg-b-2">' + option.text + '</h6><span class="d-block tx-color-03">' + dataSet.category + '</span></div>' +
			'<div class="flex-fill" style="text-align: right;"><span class="d-block txt-fnt">Available Qty : ' + Qty + '</span><span class="d-block txt-fnt">Unit Price Rs : ' + dataSet.sprice + '</span></div>' +
			'</div>';
		return ob;
	};


	function getSingleInventoryItem(id) {
		var url = '/inventory/getInventoryItems?iid=' + id;
		$.ajax({
			url: url,
			method: 'POST',
			success: function (resp) {
				//console.log('getSingleInventoryItem resp :',resp);
			}
		});
	}


	function clearSalesInvoiceItemForm() {
		//console.log('clearItemForm')
		$('#salesInvoiceItemForm').find('.searchInventoryItem').addClass('newentry');
		$('#salesInvoiceItemForm').find('input').val('');
		$('#salesInvoiceItemForm').find('select').val('');
		$('#salesInvoiceItemForm').find('.select2-hidden-accessible').val(null).trigger('change');
		$('#salesInvoiceItemForm').find('textarea').val('');
		$('#salesInvoiceItemForm').find('.alert').remove();
		$('#salesInvoiceItemForm').find('.discountObject').empty();
		$('#salesInvoiceItemForm').find('.taxObjectArray').empty();
		$('#salesInvoiceItemForm').find('.select2-hidden-accessible').removeClass('parsley-error');
		$('#salesInvoiceItemForm').find('.parsley-error').removeClass('.parsley-error');
		$('#salesInvoiceItemForm').find('.parsley-success').removeClass('.parsley-success');
		$('#salesInvoiceItemForm').find('.select2-selection').removeClass('.parsley-error');
		$('#salesInvoiceItemForm').find('.addItemToInvoiceBtn').attr('onclick', "addItemToInvoice(this,'N')");
		$('#salesInvoiceItemForm').find('.addItemToInvoiceBtn').prop('disabled', true);
		$('#salesInvoiceItemForm').parsley().reset();

	}


	function calculateTotalInModal() {
		var qty = $('#salesInvoiceItemForm').find('.qty').val() == "" ? 0 : $('#salesInvoiceItemForm').find('.qty').val().split(",").join("");
		var uPrice = $('#salesInvoiceItemForm').find('.unitPrice').val() == "" ? 0 : $('#salesInvoiceItemForm').find('.unitPrice').val().split(",").join("");
		var taxPercentArry = $('#salesInvoiceItemForm').find('.taxSelect').val();
		var discountPercent = $('#salesInvoiceItemForm').find('.discountSelect').find('option:selected').data('discount') == "" || $('#salesInvoiceItemForm').find('.discountSelect').find('option:selected').data('discount') == null ? 0 : $('#salesInvoiceItemForm').find('.discountSelect').find('option:selected').data('discount');
		var discountIsPercent = $('#salesInvoiceItemForm').find('.discountSelect').find('option:selected').data('distype') == "P";


		var totAmt = (parseFloat(qty) * parseFloat(uPrice));

		var taxObjArray = [];
		var totalTaxAmount = 0;
		if (taxPercentArry.length > 0) {
			taxPercentArry.forEach(function (obj, i) {
				var txr = $('#salesInvoiceItemForm').find('option[value="' + obj + '"]').data('taxrate');
				var txName = $('#salesInvoiceItemForm').find('option[value="' + obj + '"]').text();
				var taxAmtNew = parseFloat(txr) / 100;
				totalTaxAmount = totalTaxAmount + (taxAmtNew * parseFloat(totAmt));
				taxObjArray.push({ "taxId": obj, "taxAmt": taxAmtNew * parseFloat(totAmt), "taxName": txName, "taxRate": txr });
			});
		}

		$('#salesInvoiceItemForm').find('.taxObjectArray').empty().text(JSON.stringify(taxObjArray));
		if ($('#salesInvoiceItemForm').find('.discountSelect').val() != "" && $('#salesInvoiceItemForm').find('.discountSelect').val() != null) {
			$('#salesInvoiceItemForm').find('.discountObject').empty().text(JSON.stringify({
				"id": $('#salesInvoiceItemForm').find('.discountSelect').val(),
				"discount": $('#salesInvoiceItemForm').find('.discountSelect').find('option:selected').data('discount'),
				"discode": $('#salesInvoiceItemForm').find('.discountSelect').find('option:selected').data('discode'),
				"distype": $('#salesInvoiceItemForm').find('.discountSelect').find('option:selected').data('distype')
			}));
		}



		//console.log('totalTaxAmount', totalTaxAmount);
		//console.log('taxObjArray', taxObjArray);

		var discountAmt = 0;

		if (discountIsPercent) {
			var p = parseFloat(discountPercent) / 100;
			discountAmt = p * parseFloat(totAmt);
			//console.log('discountAmt',discountAmt);
		} else {
			discountAmt = discountPercent;
		}

		var grandTotAmt = (totAmt + totalTaxAmount) - discountAmt;

		$('#salesInvoiceItemForm').find('.modalTotAmt').text(totAmt.toFixed(2));
		$('#salesInvoiceItemForm').find('.modalTotTaxAmt').text(totalTaxAmount.toFixed(2));
		$('#salesInvoiceItemForm').find('.modalDiscountAmt').text(discountAmt.toFixed(2));
		$('#salesInvoiceItemForm').find('.modalGrandTotAmt').text(grandTotAmt.toFixed(2));

	}






	function addItemToInvoice(obj, flag) {
		var itemObj = {};
		var itemId = 0;
		$('.invoiceItemsTable tbody').find('.noDataTr').remove();
		var qty = $('#salesInvoiceItemForm').find('.qty').val() == "" ? 0 : $('#salesInvoiceItemForm').find('.qty').val().split(",").join("");
		var uPrice = $('#salesInvoiceItemForm').find('.unitPrice').val() == "" ? 0 : $('#salesInvoiceItemForm').find('.unitPrice').val().split(",").join("");
		var rowCount = $('.invoiceItemsTable tbody tr').length;
		var totAmt = (parseFloat(qty) * parseFloat(uPrice));
		

		
		var taxPercentArry = $('#salesInvoiceItemForm').find('.taxSelect').val();
		var taxTd = "";
		var taxObjArray = [];
		if (taxPercentArry && taxPercentArry.length > 0) {
			taxPercentArry.forEach(function (objTx, i) {
				var txr = $('#salesInvoiceItemForm .taxSelect').find('option[value="' + objTx + '"]').data('taxrate');
				var txName = $('#salesInvoiceItemForm .taxSelect').find('option[value="' + objTx + '"]').text();
				var taxAmtNew = parseFloat(txr) / 100;
				taxTd = taxTd + '<span style="display:block;">' + txName + ' Rs: <b class="txamt">' + (taxAmtNew * parseFloat(totAmt)) + '</b></span>';
			});
		}

		taxTd = taxTd + '<small class="hide rowTaxTotAmt">' + $('#salesInvoiceItemForm').find('.modalTotTaxAmt').text() + '</small>';



		var discPercentArry = $('#salesInvoiceItemForm').find('.discountSelect').val();
		var discTd = "";
		var discObjArray = [];
		var rowDiscTotAmt = 0;
		if (discPercentArry && discPercentArry.length > 0) {
			discPercentArry.forEach(function (objDisc, i) {
				var discr = $('#salesInvoiceItemForm .discountSelect').find('option[value="' + objTx + '"]').data('discountrate');
				var discAmtNew = parseFloat(discr) / 100;
				discTd = discTd + '<span> '+discr+'% Rs: <b class="discamt">' + (discAmtNew * parseFloat(totAmt)) + '</b></span>';
				rowDiscTotAmt = rowDiscTotAmt + (discAmtNew * parseFloat(totAmt));
			});
		}

		discTd = discTd + '<small class="hide rowDiscTotAmt">' + rowDiscTotAmt + '</small>';

		

		itemObj.id = $('#salesInvoiceItemForm').find('.itmId').val();
		itemObj.invItemid = $('#salesInvoiceItemForm').find('.itmId').val();
		itemObj.categoryid = null;//$('#salesInvoiceItemForm').find('.searchInventoryItem').find('option:selected').data('category-id');
		itemObj.name = $('#salesInvoiceItemForm').find('.searchInventoryItem').find('option:selected').text();
		itemObj.hsn = $('#salesInvoiceItemForm').find('.itmHSN').text();
		itemObj.qty = $('#salesInvoiceItemForm').find('.qty').val()
		itemObj.mu = $('#salesInvoiceItemForm').find('.searchInventoryItem').find('option:selected').data('mu');
		itemObj.uPrice = $('#salesInvoiceItemForm').find('.unitPrice').val();
		itemObj.qtyAmt = $('#salesInvoiceItemForm').find('.modalTotAmt').text();
		itemObj.discAmt = $('#salesInvoiceItemForm').find('.modalDiscountAmt').text();
		itemObj.taxableAmt = $('#salesInvoiceItemForm').find('.modalTotAmt').text();
		itemObj.totAmt = $('#salesInvoiceItemForm').find('.modalGrandTotAmt').text();
		itemObj.taxArr = $('#salesInvoiceItemForm').find('.taxObjectArray').text();
		itemObj.discArr = $('#salesInvoiceItemForm').find('.discountObject').text();

		
		var tr = ' <tr>' +
			' <td class="trCount">' + (rowCount + 1) + '</td>' +
			' <td class="itemNameTd">' + $('#salesInvoiceItemForm').find('.searchInventoryItem').find('option:selected').text() + '</td>' +
			' <td class="itemHSNTd col-hsn">' + $('#salesInvoiceItemForm').find('.itmHSN').text() + '</td>' +
			' <td class="itemQtyTd"><span>' + $('#salesInvoiceItemForm').find('.qty').val() + '</span> ' + $('#salesInvoiceItemForm').find('.searchInventoryItem').find('option:selected').data('mu') + '</td>' +
			' <td class="itemUPTd col-up">Rs: <span>' + $('#salesInvoiceItemForm').find('.unitPrice').val() + '</span></td>' +
			' <td class="itemTATd">Rs: <span>' + $('#salesInvoiceItemForm').find('.modalTotAmt').text() + '</span></td>' +
			' <td class="itemDisTd col-disc">' + discTd + '</td>' +
			' <td class="itemTaxAmtTd">Rs: <span class="txamt">' + $('#salesInvoiceItemForm').find('.modalTotAmt').text() + '</span></td>' +
			' <td class="itemTaxTd col-tax">' + taxTd + '</td>' +
			' <td class="">' +
			'<span class="itemGrandAmt hide">' + $('#salesInvoiceItemForm').find('.modalGrandTotAmt').text() + '</span>' +
			'<span class="itemId hide">' + $('#salesInvoiceItemForm').find('.itmId').val() + '</span>' +
			'<span class="rowTaxObjArray hide">' + $('#salesInvoiceItemForm').find('.taxObjectArray').text() + '</span>' +
			'<span class="rowDiscountObj hide">' + $('#salesInvoiceItemForm').find('.discountObject').text() + '</span>' +
			'<span class="rowItemObj hide">' + (JSON.stringify(itemObj)) + '</span>' +
			'<div class="text-center">' +
			'<button type="button" onclick=updateInvoiceItm(this) class="btn btn-success btn-icon btn-sm editBtn">' +
			'<i data-feather="edit-3"></i>' +
			'</button>' +
			'<button type="button" onclick=deleteInvoiceItm(this) class="btn btn-danger btn-icon btn-sm deleteBtn">' +
			'<i data-feather="trash-2"></i>' +
			'</button>' +
			'</div>' +
			'</td></tr>';

		console.log('adding tr')

		if (flag == 'N') {
			$('.invoiceItemsTable tbody').append(tr);
		} else if (flag == 'M') {
			var rowindex = $(obj).data('rowindex');
			var oldTr = $('.invoiceItemsTable tbody tr:eq(' + rowindex + ')');
			oldTr.replaceWith(tr);

			/* $('.invoiceItemsTable tbody tr:eq('+rowindex+')').remove();
			if(rowindex==0){
				$('.invoiceItemsTable tbody').prepend(tr);
			}else{
				$(tr).insertAfter($('.invoiceItemsTable tbody tr:eq('+(rowindex)+')'));
			} */
			updateTableSerialNumber();
		}

		updateTfootTotal();
		//addTfootTotal()
		feather.replace();
		$('#modalAddSalesInvoiceItem').modal('toggle');

	}


	function updateInvoiceItm(obj) {
		clearSalesInvoiceItemForm();
		var trObj = $(obj).closest('tr');
		$('#salesInvoiceItemForm').find('.searchInventoryItem').removeClass('newentry');
		$('#salesInvoiceItemForm').find('.searchInventoryItem').val($(trObj).find('.itemId').text()).trigger('change');
		$('#salesInvoiceItemForm').find('.qty').val($(trObj).find('.itemQtyTd span').text()).trigger('keyup');
		$('#salesInvoiceItemForm').find('.unitPrice').val($(trObj).find('.itemUPTd span').text()).trigger('keyup');
		var taxVal = [];
		if ($.isArray(JSON.parse($(trObj).find('.rowTaxObjArray').text()))) {
			JSON.parse($(trObj).find('.rowTaxObjArray').text()).forEach(function (tax) {
				taxVal.push(tax.taxId);
			});
		}
		$('#salesInvoiceItemForm').find('.taxSelect').val(taxVal).trigger('change');
		if ($(trObj).find('.rowDiscountObj').text() != "") {
			var discObj = JSON.parse($(trObj).find('.rowDiscountObj').text());
			$('#salesInvoiceItemForm').find('.discountSelect').val(discObj.id).trigger('change');
		} else {
			$('#salesInvoiceItemForm').find('.discountSelect').val(null).trigger('change');
		}
		$('#salesInvoiceItemForm').find('.addItemToInvoiceBtn').attr('onclick', "addItemToInvoice(this,'M')");
		$('#salesInvoiceItemForm').find('.addItemToInvoiceBtn').data('rowindex', $(trObj).index());
		$('#modalAddSalesInvoiceItem').modal('toggle');
	}
</script>