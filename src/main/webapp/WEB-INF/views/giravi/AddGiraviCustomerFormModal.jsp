<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalAddCustomer" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog wd-sm-650" role="document">
		<div class="modal-content">
			<form id="customerForm">
				<div class="modal-header pd-x-20 pd-sm-x-30">
					<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</a>
					<div class="media align-items-center">
						<span class="tx-color-03 d-none d-sm-block"> <i data-feather="box"></i>
						</span>
						<div class="media-body mg-sm-l-20">
							<h4 class="tx-18 tx-sm-20 mg-b-2">Add New Customer</h4>
							<p class="tx-13 tx-color-03 mg-b-0">Please fill all fields for better result.</p>
						</div>
					</div>
				</div>
				<div class="modal-body pd-sm-x-30">
					<div class="form-group mg-b-0">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Customer name</label>
						<input type="text" class="form-control mandatory customerName customerNameCleave" placeholder="Enter customer full name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 3 character. ">
						<input type="hidden" class="customerId" value="0">
					</div>
					<div class="row row-sm">
						<div class="col-sm mg-t-20 mg-sm-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Street address line 1</label>
							<input type="text" class="form-control  mandatory addrL1 addrL1Cleave" placeholder="Enter street address line 1" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 3 character. ">
						</div>
					</div>
					<div class="row row-sm">
						<div class="col-sm mg-t-20 mg-sm-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Street address line 2</label>
							<input type="text" class="form-control addrL2 addrL2Cleave" placeholder="Enter street address line 2">
						</div>
					</div>
					<div class="row row-sm">
						<div class="col-sm">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">State</label>
							<select class="form-control stateSelect stateSelectCleave select2">
								<option value="Nos">Nos</option>
								<option value="KG">KG</option>
							</select>
						</div>
						<div class="col-sm mg-t-20 mg-sm-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">City / Town / Village</label>
							<input type="text" class="form-control city mandatory cityCleave" placeholder="Enter city / town / village name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 3 character. ">
						</div>
					</div>
					<div class="row row-sm">
						<div class="col-sm">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Pin code / Zip code</label>
							<input type="text" class="form-control pincode pincodeCleave" placeholder="Enter pincode">
						</div>
						<div class="col-sm mg-t-20 mg-sm-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Mobile no</label>
							<input type="text" class="form-control mobile mandatory mobileCleave" placeholder="Enter mobile number" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="please enter correct mobile no. ">
						</div>
					</div>
					<div class="row row-sm">
						<div class="col-sm">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 ">Email</label>
							<input type="email" class="form-control email  emailCleave" placeholder="Enter email address" data-parsley-type="email">
						</div>
					</div>
				</div>
				<div class="modal-footer pd-x-20 pd-y-15">
					<button type="button" class="btn btn-white" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary customerSave" data-flag="N" onclick="saveCustomer(this)" disabled>Save Info</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	var needReloadCustomer = false;
	
	$(function(){
        'use strict'
        
        $('#customerForm').on('focus change paste cut keyup keypress',function() {
        	$('#modalAddCustomer').find('.alert').remove();
		});
        
      
        
        new Cleave('.mobileCleave', {
        	numeral: true,
        	numeralIntegerScale: 10,
        	numeralPositiveOnly: true,
        	delimiter: ''
        });

        new Cleave('.pincodeCleave', {
        	numeral: true,
        	numeralIntegerScale: 6,
        	numeralPositiveOnly: true,
        	delimiter: ''
        });
        
        
		$('.stateSelect').select2({
			width:'100%',
			placeholder: 'Select State',
			allowClear: true
		}).on("select2:unselecting", function(e) {
        	$(this).trigger('input');
        }).on('change',function(){
			
		}).val(null).trigger('change');
        
		
		
		$('#customerForm').parsley().on('field:validated', function() {
			var parsleyFieldLength = $('#customerForm').find('.mandatory').length;
		    var isValidForm = false;
			if($('#customerForm').find('.parsley-success').length==parsleyFieldLength){
				isValidForm = true;
			}else{
				isValidForm = false;
			}
			if(isValidForm){
				$('.customerSave').prop('disabled',false);
			}else{
				$('.customerSave').prop('disabled',true);
			}
		  }).on('form:submit', function() {
		    return false; // Don't submit form for this demo
		  });
		
		
		$('#modalAddCustomer').on('hidden.bs.modal', function() {
			$('#customerForm').find('.stateSelect').select2('close');
			if(needReloadCustomer){
				reloadPage();
			}
		});

		
		$('#modalAddCustomer').on('shown.bs.modal', function() {
			needReloadCustomer=false;
		});

	
    });

	
	
	function saveCustomer(btnObj){
		var flag = $(btnObj).data('flag');
		var customerId = null;
		
		if(flag=='N'){
			customerId = 0;
		}else{
			customerId = $('#customerForm').find('.customerId').val();
		}
		
		var formData = {
			'customerName' : 	$('#customerForm').find('.customerName').val(),
			'stateSelect'  : 	$('#customerForm').find('.stateSelect').val(),
			'addrL1'       :	$('#customerForm').find('.addrL1').val().split(",").join("|"),  
			'addrL2'       : 	$('#customerForm').find('.addrL2').val().split(",").join("|"),
			'city'         : 	$('#customerForm').find('.city').val(),
			'pincode'      : 	$('#customerForm').find('.pincode').val(),
			'mobile'       : 	$('#customerForm').find('.mobile').val(),
			'email'        : 	$('#customerForm').find('.email').val(),
			'customerId'   :    customerId,
			'flag'         :    flag
		}
		
		$.ajax({
			url : '/customer/saveUpdateDeleteCustomer',
			method : 'POST',
			data : formData,
			async : false,
			success : function(resp) {
				console.log('resp',resp);
				if(resp.status=="success"){
					needReloadCustomer=true;
					clearCustomerForm($('#customerForm'));
					$('#modalAddCustomer').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'+
				    '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
				}else{
					needReloadCustomer=false;
					$('#modalAddCustomer').find('.modal-content').find('.alert').remove();
					$('#modalAddCustomer').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'+
		            '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
				}
			}
		});
	}
	



	
	function clearCustomerForm(formObj){
		console.log('clearCustomerForm')
		$('#customerForm').find('input').val('');
		$('#customerForm').find('select').val('');
		$('#customerForm').find('.select2-hidden-accessible').val(null).trigger('change');
		$('#customerForm').find('textarea').val('');
		$('#customerForm').find('.alert').remove();
		
		$('#customerForm').find('.select2-hidden-accessible').removeClass('parsley-error');
		$('#customerForm').find('.parsley-error').removeClass('.parsley-error');
		$('#customerForm').find('.parsley-success').removeClass('.parsley-success');
		$('#customerForm').find('.select2-selection').removeClass('.parsley-error');
		$('#customerForm').find('.customerId').val("0"),  
		$('#customerForm').find('.customerSave').attr('onclick',"saveCustomer(this,'N')");
		$('#customerForm').find('.customerSave').removeClass('btn-danger').addClass('btn-primary');
		$('#customerForm').find('.customerSave').text('Save Info');
		$('#customerForm').find('.customerSave').prop('disabled',true);
		$('#customerForm').parsley().reset();
	}
	
	</script>