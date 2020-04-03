<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalAddTax" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog wd-sm-650" role="document" style="max-width: 550px;">
		<div class="modal-content">
			<form id="taxForm">
				<div class="modal-header pd-x-20 pd-sm-x-30">
					<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</a>
					<div class="media align-items-center">
						<span class="tx-color-03 d-none d-sm-block"> <i data-feather="box"></i>
						</span>
						<div class="media-body mg-sm-l-20">
							<h4 class="tx-18 tx-sm-20 mg-b-2">Create Tax Entry</h4>
							<p class="tx-13 tx-color-03 mg-b-0">Please fill all fields for better result.</p>
						</div>
					</div>
				</div>
				<div class="modal-body pd-sm-x-30">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label mandlabel"> Tax Name </label>
						<div class="col-sm-8">
							<input type="text" class="form-control taxName taxNameCleave mandatory" placeholder="Enter tax name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="1" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 2 charachter ">
							<input type="hidden" class="taxId" value="0">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label mandlabel"> Tax Rate in % </label>
						<div class="col-sm-8">
							<input type="text" maxlength="5" class="form-control taxPercent taxPercentCleave mandatory" placeholder="Enter tax in percent" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter at least 2 digit ">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label "> Tax Reg. Number </label>
						<div class="col-sm-8">
							<input type="text" maxlength="50" class="form-control taxRegNumber" placeholder="Enter tax reg number">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label "> Tax authorizer Name </label>
						<div class="col-sm-8">
							<input type="text" maxlength="5" class="form-control taxAuthorizerName" placeholder="Enter tax authorizer Name">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Tax Code</label>
						<div class="col-sm-8">
							<input type="text" class="form-control taxCode" placeholder="Create tax code">
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
					<button type="button" data-flag="N" class="btn btn-primary taxSave" onclick="saveTax(this)" disabled>Save Tax</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
  var needReloadTax = false;
  $(function() {
	  var taxPercentCleave = new Cleave('.taxPercentCleave', {
	  	 numericOnly: true,
 	     delimiter: '.',
 	     blocks: [2, 2],
 	     numeralPositiveOnly : true,
	  });
	
	  $('#taxForm').on('focus change paste cut keyup keypress', function() {
		  $('#modalAddTax').find('.alert').remove();
	  });
	  
	  $('.statusSelect').select2({
	    width : '100%',
	    placeholder : 'Select Status',
	    allowClear : true
	  }).val(null).trigger('change');
	  
	  $('#taxForm').parsley().on('field:validated', function() {
		  var parsleyFieldLength = $('#taxForm').find('.mandatory').length;
		  console.log('mandatory length',parsleyFieldLength)
		  var isValidForm = false;
		  if ($('#taxForm').find('.parsley-success').length == parsleyFieldLength) {
			  isValidForm = true;
		  } else {
			  isValidForm = false;
		  }
		  if (isValidForm) {
			  $('.taxSave').prop('disabled', false);
		  } else {
			  $('.taxSave').prop('disabled', true);
		  }
	  }).on('form:submit', function() {
		  return false; // Don't submit form for this demo
	  });
	  
	  $('#modalAddTax').on('hidden.bs.modal', function() {
		  if (needReloadTax) {
			  reloadPage();
		  }
	  });
	  
	  $('#modalAddTax').on('shown.bs.modal', function() {
		  needReloadTax = false;
	  });
	  
  });
  
  function saveTax(btnObj) {
	  var flag = $(btnObj).data('flag');
	  var taxId = null;
	  if (flag == 'N') {
		  taxId = 0;
	  } else {
		  taxId = $('#taxForm').find('.taxId').val();
	  }
	  var formData = {
	    'taxName' : $('#taxForm').find('.taxName').val(),
	    'taxPercent' : $('#taxForm').find('.taxPercent').val(),
	    'taxRegNumber' : $('#taxForm').find('.taxRegNumber').val(),
	    'taxAuthorizerName' : $('#taxForm').find('.taxAuthorizerName').val(),
	    'taxCode' : $('#taxForm').find('.taxCode').val(),
	    'statusSelect' : $('#taxForm').find('.statusSelect').val(),
	    'flag' : flag,
	    'taxId' : taxId
	  }
	  $.ajax({
	    url : '/app/setting/taxMaster/saveUpdateDeleteTax',
	    method : 'POST',
	    data : formData,
	    async : false,
	    success : function(resp) {
		    console.log('resp', resp);
		    if (resp.status == "success") {
			    needReloadTax = true;
			    clearTaxForm($('#taxForm'));
			    $('#modalAddTax').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    } else {
			    needReloadTax = false;
			    $('#modalAddTax').find('.modal-content').find('.alert').remove();
			    $('#modalAddTax').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		    }
	    }
	  });
  }
  
  function saveUpdateDeleteTax(obj, flag) {
	  clearTaxForm($('#taxForm'));
	  $('#taxForm').find('.taxId').val($(obj).closest('tr').find('.taxId').text()).trigger('keyup');
	  $('#taxForm').find('.taxName').val($(obj).closest('tr').find('.taxName').text()).trigger('keyup');
	  $('#taxForm').find('.statusSelect').val($(obj).closest('tr').find('.status').text()).trigger('change');
	  $('#taxForm').find('.taxPercent').val($(obj).closest('tr').find('.taxPercent').text()).trigger('keyup');
	  $('#taxForm').find('.taxRegNumber').val($(obj).closest('tr').find('.taxRegNumber').text()).trigger('keyup');
	  $('#taxForm').find('.taxAuthorizerName').val($(obj).closest('tr').find('.taxAuthorizerName').text()).trigger('keyup');
	  $('#taxForm').find('.taxCode').val($(obj).closest('tr').find('.taxCode').text()).trigger('keyup');
	  $('#taxForm').find('.taxSave').data('flag', flag);
	  if (flag == 'D') {
		  $('#taxForm').find('.taxSave').removeClass('btn-primary').addClass('btn-danger');
		  $('#taxForm').find('.taxSave').text('Delete Tax');
	  } else {
		  $('#taxForm').find('.taxSave').removeClass('btn-danger').addClass('btn-primary');
		  $('#taxForm').find('.taxSave').text('Save Tax');
	  }
	  $('#modalAddTax').modal('toggle');
  }
  function clearTaxForm(formObj) {
	  console.log('clearTaxForm')
	  $('#taxForm').find('input').val('').trigger('keyup');
	  $('#taxForm').find('select').val('').trigger('change');
	  $('#taxForm').find('.select2-hidden-accessible').val(null).trigger('change');
	  $('#taxForm').find('textarea').val('');
	  $('#taxForm').find('.alert').remove();
	  $('#taxForm').find('.select2-hidden-accessible').removeClass('parsley-error');
	  $('#taxForm').find('.parsley-error').removeClass('.parsley-error');
	  $('#taxForm').find('.parsley-success').removeClass('.parsley-success');
	  $('#taxForm').find('.select2-selection').removeClass('.parsley-error');
	  $('#taxForm').find('.taxId').val("0"), $('#taxForm').find('.taxSave').attr('onclick', "saveTax(this,'N')");
	  $('#taxForm').find('.taxSave').removeClass('btn-danger').addClass('btn-primary');
	  $('#taxForm').find('.taxSave').text('Save Tax');
	  $('#taxForm').find('.taxSave').prop('disabled', true);
	  $('#taxForm').parsley().reset();
  }
</script>