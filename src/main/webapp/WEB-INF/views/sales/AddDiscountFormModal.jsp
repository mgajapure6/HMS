<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalAddDiscount" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog wd-sm-650" role="document">
		<div class="modal-content">
			<form id="discountForm">
				<div class="modal-header pd-x-20 pd-sm-x-30">
					<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</a>
					<div class="media align-items-center">
						<span class="tx-color-03 d-none d-sm-block"> <i data-feather="box"></i>
						</span>
						<div class="media-body mg-sm-l-20">
							<h4 class="tx-18 tx-sm-20 mg-b-2">Create Discount Entry</h4>
							<p class="tx-13 tx-color-03 mg-b-0">Please fill all fields for better result.</p>
						</div>
					</div>
				</div>
				<div class="modal-body pd-sm-x-30">
					<div class="form-group row">
						<label class="col-form-label col-sm-4 pt-0 mandlabel">Discount Type</label>
						<div class="col-sm-8">
							<div>
								<div class="custom-control custom-radio">
									<input type="radio" data-val="P" id="discTypePercent" name="discType" class="custom-control-input discType " checked>
									<label class="custom-control-label" for="discTypePercent">Percentage (%)</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" data-val="A" id="discTypeAmt" name="discType" class="custom-control-input discType">
									<label class="custom-control-label" for="discTypeAmt">Amount</label>
								</div>
							</div>
							<!-- <div class="custom-control custom-radio">
								<input type="radio" name="discType" class="custom-control-input discType mandatory" value="P" checked>
								<label class="custom-control-label"></label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" name="discType" class="custom-control-input discType" value="A">
								<label class="custom-control-label"></label>
							</div> -->
							<input type="hidden" class="discountId" value="0">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label mandlabel">
							Discount <span class="discPercentSuggest"> in <b>%</b></span>
						</label>
						<div class="col-sm-8">
							<input type="text" maxlength="5" class="form-control discPercent discPercentCleave mandatory" placeholder="Enter discount in percent" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter at least 1 digit ">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Discount Code</label>
						<div class="col-sm-8">
							<input type="text" class="form-control discCode" placeholder="Create discount code">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Status</label>
						<div class="col-sm-8">
							<select class="form-control statusSelect select2">
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer pd-x-20 pd-y-15" style="padding-right: 30px;">
					<button type="button" class="btn btn-white" data-dismiss="modal">Cancel</button>
					<button type="button" data-flag="N" class="btn btn-primary discountSave" onclick="saveDiscount(this)" disabled>Save Info</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	var needReloadDiscount = false;
  $(function() {
	  var discPercentCleave = new Cleave('.discPercentCleave', {
	  	 numericOnly: true,
 	     delimiter: '.',
 	     blocks: [2, 2],
 	     numeralPositiveOnly : true,
	  });
	  $('#discountForm').find('input[name=discType]').on('change', function() {
	  	console.log($(this).data('val'))
	  	if($(this).data('val')=="P"){
	  		$('#discountForm').find('.discPercent').val("").attr('maxlength',"5").removeClass('parsley-success');
	  		discPercentCleave.destroy();
	  		discPercentCleave = new Cleave('.discPercentCleave', {
		  	    numericOnly: true,
		  	    delimiter: '.',
		  	    blocks: [2, 2],
		  	    numeralPositiveOnly : true,
	  		});
	  		
	  		$('.discPercentSuggest').html(' in <b>%</b>');
	  	}else{
	  		$('#discountForm').find('.discPercent').val("").attr('maxlength',"10").removeClass('parsley-success');
	  		discPercentCleave.destroy();
	  		discPercentCleave = new Cleave('.discPercentCleave', {
		  	    numeral : true,
		  	    numeralDecimalScale : 2,
		  	    numeralThousandsGroupStyle : 'lakh',
		  	    numeralPositiveOnly : true,
		  	});
	  		$('.discPercentSuggest').html(' in <b>Rs</b>');
	  	}
	  	
	  	$('#discountForm').find('input[name=discType]').trigger('input');
	  })
	  $('#discountForm').on('focus change paste cut keyup keypress', function() {
		  $('#modalAddDiscount').find('.alert').remove();
	  });
	  $('.statusSelect').select2({
	    width : '100%',
	    placeholder : 'Select Status',
	    allowClear : true
	  }).val(null).trigger('change');
	  $('#discountForm').parsley().on('field:validated', function() {
		  var parsleyFieldLength = $('#discountForm').find('.mandatory').length;
		  console.log('mandatory length',parsleyFieldLength)
		  var isValidForm = false;
		  if ($('#discountForm').find('.parsley-success').length == parsleyFieldLength) {
			  isValidForm = true;
		  } else {
			  isValidForm = false;
		  }
		  if (isValidForm) {
			  $('.discountSave').prop('disabled', false);
		  } else {
			  $('.discountSave').prop('disabled', true);
		  }
	  }).on('form:submit', function() {
		  return false; // Don't submit form for this demo
	  });
	  $('#modalAddDiscount').on('hidden.bs.modal', function() {
		  if (needReloadDiscount) {
			  reloadPage();
		  }
	  });
	  $('#modalAddDiscount').on('shown.bs.modal', function() {
		  needReloadDiscount = false;
	  });
  });
  function saveDiscount(btnObj) {
	  var flag = $(btnObj).data('flag');
	  var discountId = null;
	  if (flag == 'N') {
		  discountId = 0;
	  } else {
		  discountId = $('#discountForm').find('.discountId').val();
	  }
	  var formData = {
	    'discType' : $('#discountForm').find('input[name=discType]:checked').data('val'),
	    'discount' : $('#discountForm').find('.discPercent').val(),
	    'disCode' : $('#discountForm').find('.discCode').val(),
	    'statusSelect' : $('#discountForm').find('.statusSelect').val(),
	    'flag' : flag,
	    'discountId' : discountId
	  }
	  $.ajax({
	    url : '/discount/saveUpdateDeleteDiscount',
	    method : 'POST',
	    data : formData,
	    async : false,
	    success : function(resp) {
		    console.log('resp', resp);
		    if (resp.status == "success") {
			    needReloadDiscount = true;
			    clearDiscountForm($('#discountForm'));
			    $('#modalAddDiscount').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    } else {
			    needReloadDiscount = false;
			    $('#modalAddDiscount').find('.modal-content').find('.alert').remove();
			    $('#modalAddDiscount').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    }
	    }
	  });
  }
  function saveUpdateDeleteDiscount(obj, flag) {
	  clearDiscountForm($('#discountForm'));
	  $('#discountForm').find('.discountId').val($(obj).closest('tr').find('.discountId').text()).trigger('keyup');
	  $('#discountForm').find('.discountName').val($(obj).closest('tr').find('.discountName').text()).trigger('keyup');
	  $('#discountForm').find('.statusSelect').val($(obj).closest('tr').find('.status').text()).trigger('change');
	  $('#discountForm').find('.discountDesc').val($(obj).closest('tr').find('.discountDesc').text()).trigger('keyup');
	  $('#discountForm').find('.discountSave').data('flag', flag);
	  if (flag == 'D') {
		  $('#discountForm').find('.discountSave').removeClass('btn-primary').addClass('btn-danger');
		  $('#discountForm').find('.discountSave').text('Delete Info');
	  } else {
		  $('#discountForm').find('.discountSave').removeClass('btn-danger').addClass('btn-primary');
		  $('#discountForm').find('.discountSave').text('Save Info');
	  }
	  $('#modalAddDiscount').modal('toggle');
  }
  function clearDiscountForm(formObj) {
	  console.log('clearDiscountForm')
	  $('#discountForm').find('input').val('').trigger('keyup');
	  $('#discountForm').find('select').val('').trigger('change');
	  $('#discountForm').find('.select2-hidden-accessible').val(null).trigger('change');
	  $('#discountForm').find('textarea').val('');
	  $('#discountForm').find('.alert').remove();
	  $('#discountForm').find('.select2-hidden-accessible').removeClass('parsley-error');
	  $('#discountForm').find('.parsley-error').removeClass('.parsley-error');
	  $('#discountForm').find('.parsley-success').removeClass('.parsley-success');
	  $('#discountForm').find('.select2-selection').removeClass('.parsley-error');
	  $('#discountForm').find('.discountId').val("0"), $('#discountForm').find('.discountSave').attr('onclick', "saveDiscount(this,'N')");
	  $('#discountForm').find('.discountSave').removeClass('btn-danger').addClass('btn-primary');
	  $('#discountForm').find('.discountSave').text('Save Info');
	  $('#discountForm').find('.discountSave').prop('disabled', true);
	  $('#discountForm').parsley().reset();
  }
</script>