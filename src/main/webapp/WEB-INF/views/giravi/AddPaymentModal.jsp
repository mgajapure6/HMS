<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalAddPayment" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog" role="document" style="max-width: 400px;">
		<div class="modal-content">
			<form id="addPaymentForm">
				<div class="modal-header pd-x-20 pd-sm-x-30">
					<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</a>
					<div class="media align-items-center">
						<span class="tx-color-03 d-none d-sm-block"> <i class="fa fa-credit-card" style="font-size: 2rem;"></i>
						</span>
						<div class="media-body mg-sm-l-20">
							<h4 class="tx-18 tx-sm-20 mg-b-2">Add Payment to Giravi</h4>
						</div>
					</div>
				</div>
				<div class="modal-body pd-sm-x-30">
					<div class="form-group mg-b-0">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Enter Receivable Amount</label>
						<input type="text" placeholder="Enter Receivable Amount" class="form-control mandatory addPaymentReceivableAmountInput receivableAmountCleave" required data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-minlength-message="Enter proper amount." data-parsley-required-message="Receivable Amount must be required.">
						<input type="hidden" class="loanId" value="0">
					</div>
					<div class="form-group mg-b-0 mg-t-20">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Payment Mode / Method</label>
						<select onkeyup="" class="form-control payModeSelect">
							<option value="C">Cash</option>
							<option value="B">Bank Transfer</option>
						</select>
					</div>
					<hr class="mg-t-20 mg-b-20">
					<div class="row row-sm">
						<div class="col-sm mg-t-10 mg-b-10" style="text-align: right;">
							<button type="button" class="btn btn-white cancelBtn" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary savePaymentBtn" data-flag="N" onclick="saveGiraviPayment(this,'N')" disabled>Save Payment</button>
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

	new Cleave('.receivableAmountCleave', {
		numeral: true,
		numeralDecimalScale: 4,
		numeralThousandsGroupStyle: 'lakh',
		numeralPositiveOnly: true,
	});


	$('#addPaymentForm').parsley().on('field:validated', function () {
		var parsleyFieldLength = $('#addPaymentForm').find('.mandatory').length;
		var isValidForm = false;
		if ($('#addPaymentForm').find('.parsley-success').length == parsleyFieldLength) {
			isValidForm = true;
		} else {
			isValidForm = false;
		}
		if (isValidForm) {
			$('#addPaymentForm').find('.savePaymentBtn').prop('disabled', false);
		} else {
			$('#addPaymentForm').find('.savePaymentBtn').prop('disabled', true);
		}
	}).on('form:submit', function () {
		return false; // Don't submit form for this demo
	});




	function clearPaymentForm() {
		var loanId 		= $('#addPaymentForm').find('input.loanId').val();
		$('#addPaymentForm').find('input').val('');
		$('#addPaymentForm').find('select').val('');
		$('#addPaymentForm').find('select').find('option:first').prop('selected',true).trigger('change');
		$('#addPaymentForm').find('.select2-hidden-accessible').val(null).trigger('change');
		$('#addPaymentForm').find('textarea').val('');
		$('#modalAddPayment').find('.alert').remove();
		$('#addPaymentForm').find('.select2-hidden-accessible').removeClass('parsley-error');
		$('#addPaymentForm').find('.parsley-error').removeClass('.parsley-error');
		$('#addPaymentForm').find('.parsley-success').removeClass('.parsley-success');
		$('#addPaymentForm').find('.select2-selection').removeClass('.parsley-error');
		$('#modalAddPayment').find('.savePaymentBtn').attr('onclick', "saveGiraviPayment(this,'N')");
		$('#modalAddPayment').find('.savePaymentBtn').prop('disabled', true);
		$('#addPaymentForm').find('input.loanId').val(loanId);
		$('#addPaymentForm').parsley().reset();
	}



	function saveGiraviPayment(obj,flg) {
		var loanId 		= $('#addPaymentForm').find('input.loanId').val();
		var receAmt 	= $('#addPaymentForm').find('input.addPaymentReceivableAmountInput').val().split(",").join("");
		var payMethod 	= $('#addPaymentForm').find('select.payModeSelect').val();

		
		var formData = {
				'loanId' : loanId,
				'receAmt' : receAmt,
				'payMethod' : payMethod,
				'flag' : "N"
			}
		
		$.ajax({
			url : '/app/giravi/giraviMaster/saveGiraviPayment',
			method : 'POST',
			data : formData,
			async : false,
			success : function(resp) {
				console.log('resp',resp);
				if(resp.status=="success"){
					clearPaymentForm($('#addPaymentForm'));
					$(obj).attr('isreload',true);
					$('#modalAddPayment').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-t-10 mg-b-0" role="alert">'+
				    '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>');
					$('#addPaymentForm').find('.cancelBtn').focus();
				}else{
					$(obj).attr('isreload',false);
					$('#modalAddPayment').find('.modal-content').find('.alert').remove();
					$('#modalAddPayment').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-t-10 mg-b-0" role="alert">'+
		            '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>');
				}
			}
		});
	}

	
	$('#modalAddPayment').on('keypress', function(event) {
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if (keycode == '13') {
			if($('#modalAddPayment').find('.savePaymentBtn').prop('disabled')){
				$('#addPaymentForm').parsley().validate();
			}else{
				$('#modalAddPayment').find('.savePaymentBtn').click();
			}
		}
	});

	$('#modalAddPayment').on('shown.bs.modal', function() {
		$('#modalAddPayment').find('.addPaymentReceivableAmountInput').focus();
	});

	$('#modalAddPayment').on('hidden.bs.modal', function() {
		if($('#modalAddPayment').find('.savePaymentBtn').attr('isreload')=='true'){
			$('.loading').removeClass('hide');
			$('.mainContainer').addClass('hide');
			$('.footer').addClass('hide');
			//var flag = $(btnObj).attr('data-flag');
			var loanId 	= $('#addPaymentForm').find('input.loanId').val();
			$.ajax({
				  url : '/app/giravi/giraviMaster/getGiraviDetail',
				  async : true,
				  data : {
					  //'flag' : flag,
					  'loadId' : loanId
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
	});
</script>