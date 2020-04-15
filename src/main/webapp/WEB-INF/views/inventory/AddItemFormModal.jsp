<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalAddItem" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog wd-sm-650" role="document">
		<div class="modal-content">
			<form id="itemForm">
				<div class="modal-header pd-x-20 pd-sm-x-30">
					<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</a>
					<div class="media align-items-center">
						<span class="tx-color-03 d-none d-sm-block"> <i data-feather="box"></i>
						</span>
						<div class="media-body mg-sm-l-20">
							<h4 class="tx-18 tx-sm-20 mg-b-2">Create Inventory Item</h4>
							<p class="tx-13 tx-color-03 mg-b-0">Please fill all fields for better result.</p>
						</div>
					</div>
				</div>
				<div class="modal-body pd-sm-x-30">
					<div class="form-group mg-b-0">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Item Name</label>
						<input type="text" class="form-control mandatory itemName itemNameCleave" placeholder="Enter item name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 character. ">
						<input type="hidden" class="itemId" value="0">
					</div>
					<div class="form-group mg-b-0">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">HSN number</label>
						<input type="text" class="form-control itemHSN itemHSNCleave" placeholder="Enter HSN number" data-parsley-trigger="keyup" data-parsley-minlength="4" data-parsley-validation-threshold="0" data-parsley-maxlength="6" data-parsley-minlength-message="Enter 4 digit hsn number. ">
					</div>
					<div class="form-group mg-b-0">
						<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Select Category</label>
						<div class="parsley-select">
							<select class="form-control categorySelect categorySelectCleave select2 mandatory" required data-parsley-trigger="input" data-parsley-validation-threshold="0">
								<c:forEach items="${allCategories}" var="cat">
									<option value="${cat.id}">${cat.categoryName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row row-sm">
						<div class="col-sm">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Select Measurement Unit</label>
							<div class="parsley-select">
								<select class="form-control measurUnitSelect measurUnitSelectCleave select2 mandatory" required data-parsley-trigger="input" data-parsley-validation-threshold="0">
									<option value="Nos">Nos</option>
									<option value="KG">KG</option>
								</select>
							</div>
						</div>
						<div class="col-sm mg-t-20 mg-sm-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Quantity</label>
							<input type="text" class="form-control right mandatory mainQty mainQtyCleave" placeholder="Enter quantity" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter at least 1 digit. ">
						</div>
					</div>
					<div class="row row-sm">
						<div class="col-sm">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Brand</label>
							<input type="text" class="form-control brand brandCleave" placeholder="Enter brand name">
						</div>
						<div class="col-sm mg-t-20 mg-sm-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Expiry Date</label>
							<input type="text" class="form-control expiryDate expiryDateCleave" placeholder="Enter expiry date">
						</div>
					</div>
					<div class="row row-sm">
						<div class="col-sm">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Select Status</label>
							<select class="form-control statusSelect statusSelectCleave select2">
								<option value="In Stock">In Stock</option>
								<option value="Out Of Stock"></option>
								<option value="Low Stock">L</option>
							</select>
						</div>
						<div class="col-sm mg-t-20 mg-sm-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Low Stock Alert Quantity</label>
							<input type="text" class="form-control right lowStockQty lowStockQtyCleave" placeholder="Enter low stock alert quantity">
						</div>
					</div>
					<div class="row row-sm">
						<div class="col-sm">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Cost Price</label>
							<input type="text" class="form-control right costPrice costPriceCleave" placeholder="Enter cost price">
						</div>
						<div class="col-sm mg-t-20 mg-sm-t-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Selling Price</label>
							<input type="text" class="form-control right mandatory sellingPrice sellingPriceCleave" placeholder="Enter selling price" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-validation-threshold="0" data-parsley-maxlength="10" data-parsley-minlength-message="Enter at least 1 digit. ">
						</div>
					</div>
				</div>
				<div class="modal-footer pd-x-20 pd-y-15">
					<button type="button" class="btn btn-white" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary itemSave" data-flag="N" onclick="saveItem(this)" disabled>Save Info</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	var needReloadItem = false;
	
	$(function(){
        'use strict'
        
        $('#itemForm').on('focus change paste cut keyup keypress',function() {
        	$('#modalAddItem').find('.alert').remove();
		});
        
        
        new Cleave('.expiryDateCleave', {
		    date: true,
		    delimiter: '-',
		    datePattern: ['d', 'm', 'Y']
		});
        
        new Cleave('.sellingPriceCleave', {
            numeral: true,
            numeralDecimalScale: 4,
            numeralThousandsGroupStyle: 'lakh',
            numeralPositiveOnly: true,
        });
        
        new Cleave('.costPriceCleave', {
            numeral: true,
            numeralDecimalScale: 4,
            numeralThousandsGroupStyle: 'lakh',
            numeralPositiveOnly: true,
        });
        
        new Cleave('.mainQtyCleave', {
            numeral: true,
            numeralDecimalScale: 0,
            numeralPositiveOnly: true,
            numeralThousandsGroupStyle: 'lakh',
        });
        
        new Cleave('.lowStockQtyCleave', {
            numeral: true,
            numeralDecimalScale: 0,
            numeralPositiveOnly: true,
            numeralThousandsGroupStyle: 'lakh',
        });
        
		$('.categorySelect').select2({
			width:'100%',
			placeholder: 'Select Category',
			allowClear: true
		}).on('select2:open', () => { 
			var nn= '<div class="row"><div class="col-sm"><div class="pd-y-10 pd-x-20 bg-ui-01"><a href="javascript:;" onclick="openCategoryModal()"><i class="icon ion-md-add"></i> Create new category</a></div></div></div>';
	        $(".select2-results:not(:has(a))").append(nn);
		}).on("select2:unselecting", function(e) {
        	$(this).trigger('input');
        }).on('change',function(){
			
		}).val(null).trigger('change');
        
        $('.measurUnitSelect').select2({
			width:'100%',
			placeholder: 'Select Measurment Unit',
			allowClear: true
		}).on("select2:unselecting", function(e) {
        	$(this).trigger('input');
        }).on('change',function(){
			
		}).val(null).trigger('change');
        
		$('.statusSelect').select2({
			width:'100%',
			placeholder: 'Select Status',
			allowClear: true
		}).val(null).trigger('change');
		
		$('.expiryDate').datepicker({
			  dateFormat: 'dd-mm-yy',
			  showOtherMonths: true,
			  selectOtherMonths: true,
			  changeMonth: true,
			  changeYear: true
		});
		
		
		$('#itemForm').parsley().on('field:validated', function() {
			var parsleyFieldLength = $('#itemForm').find('.mandatory').length;
		    var isValidForm = false;
			if($('#itemForm').find('.parsley-success').length==parsleyFieldLength){
				isValidForm = true;
			}else{
				isValidForm = false;
			}
			if(isValidForm){
				$('.itemSave').prop('disabled',false);
			}else{
				$('.itemSave').prop('disabled',true);
			}
		  }).on('form:submit', function() {
		    return false; // Don't submit form for this demo
		  });
		
		
		$('#modalAddItem').on('hidden.bs.modal', function() {
			$('#itemForm').find('.categorySelect').select2('close');
			if(needReloadItem){
				reloadPage();
			}
		});

		
		$('#modalAddItem').on('shown.bs.modal', function() {
			needReloadItem=false;
		});

	
    });

	function openCategoryModal(){
		clearCategoryForm($('#categoryForm'));
		//$('#itemForm').find('.categorySelect').select2('close');
		$('#modalAddItem').modal('toggle');
		$('#modalAddCategory').modal('toggle');
		$('#categoryForm').find('.categoryName').focus();
	} 
	
	
	function saveItem(btnObj){
		var flag = $(btnObj).data('flag');
		var itemId = null;
		
		if(flag=='N'){
			itemId = 0;
		}else{
			itemId = $('#itemForm').find('.itemId').val();
		}
		
		var formData = {
			'itemName' : 		$('#itemForm').find('.itemName').val(),
			'itemHSN' : 		$('#itemForm').find('.itemHSN').val(),
			'categorySelect' : 	$('#itemForm').find('.categorySelect').val(),
			'measurUnitSelect':	$('#itemForm').find('.measurUnitSelect').val(),
			'mainQty' : 		$('#itemForm').find('.mainQty').val().split(",").join(""),
			'brand' : 			$('#itemForm').find('.brand').val(),
			'expiryDate' : 		$('#itemForm').find('.expiryDate').val(),
			'statusSelect' : 	$('#itemForm').find('.statusSelect').val(),
			'lowStockQty' : 	$('#itemForm').find('.lowStockQty').val().split(",").join(""),
			'costPrice' : 		$('#itemForm').find('.costPrice').val().split(",").join(""),
			'sellingPrice' : 	$('#itemForm').find('.sellingPrice').val().split(",").join(""),
			'flag' : flag,
			'itemId' : itemId
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath }/app/inventory/itemServiceMaster/saveUpdateDeleteItem',
			method : 'POST',
			data : formData,
			async : false,
			success : function(resp) {
				console.log('resp',resp);
				if(resp.status=="success"){
					needReloadItem=true;
					clearItemForm($('#itemForm'));
					$('#modalAddItem').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'+
				    '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
				}else{
					needReloadItem=false;
					$('#modalAddItem').find('.modal-content').find('.alert').remove();
					$('#modalAddItem').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'+
		            '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
				}
			}
		});
	}
	

	function saveUpdateDeleteItm(obj,flag, closestEle){
		clearItemForm($('#itemForm'));
		$('#itemForm').find('.itemId').val($(obj).closest(''+closestEle).find('.itemId').text()).trigger('keyup');   
		$('#itemForm').find('.itemName').val($(obj).closest(''+closestEle).find('.itemName').text()).trigger('keyup');       
		$('#itemForm').find('.itemHSN').val($(obj).closest(''+closestEle).find('.itemHSN').text()).trigger('keyup');                        
		$('#itemForm').find('.categorySelect').val($(obj).closest(''+closestEle).find('.categoryId').text()).trigger('change');                  
		$('#itemForm').find('.measurUnitSelect').val($(obj).closest(''+closestEle).find('.measurementUnit').text()).trigger('change');                
		$('#itemForm').find('.mainQty').val($(obj).closest(''+closestEle).find('.mainQty').text()).trigger('keyup');     
		$('#itemForm').find('.brand').val($(obj).closest(''+closestEle).find('.brand').text()).trigger('keyup');                           
		$('#itemForm').find('.expiryDate').val($(obj).closest(''+closestEle).find('.expiryDate').text()).trigger('change');                      
		$('#itemForm').find('.statusSelect').val($(obj).closest(''+closestEle).find('.status').text()).trigger('change');                    
		$('#itemForm').find('.lowStockQty').val($(obj).closest(''+closestEle).find('.lowStockQty').text()).trigger('keyup'); 
		$('#itemForm').find('.costPrice').val($(obj).closest(''+closestEle).find('.costPrice').text()).trigger('keyup');   
		$('#itemForm').find('.sellingPrice').val($(obj).closest(''+closestEle).find('.sellingPrice').text()).trigger('keyup');
		$('#itemForm').find('.itemSave').data('flag',flag);
		if(flag=='D'){
			$('#itemForm').find('.itemSave').removeClass('btn-primary').addClass('btn-danger');
			$('#itemForm').find('.itemSave').text('Delete Info');
		}else{
			$('#itemForm').find('.itemSave').removeClass('btn-danger').addClass('btn-primary');
			$('#itemForm').find('.itemSave').text('Save Info');
		}
		$('#modalAddItem').modal('toggle');
	}

	
	function clearItemForm(formObj){
		console.log('clearItemForm')
		$('#itemForm').find('input').val('');
		$('#itemForm').find('select').val('');
		$('#itemForm').find('.select2-hidden-accessible').val(null).trigger('change');
		$('#itemForm').find('textarea').val('');
		$('#itemForm').find('.alert').remove();
		
		$('#itemForm').find('.select2-hidden-accessible').removeClass('parsley-error');
		$('#itemForm').find('.parsley-error').removeClass('parsley-error');
		$('#itemForm').find('.parsley-success').removeClass('parsley-success');
		$('#itemForm').find('.select2-selection').removeClass('parsley-error');
		$('#itemForm').find('.itemId').val("0");
		$('#itemForm').find('.itemSave').attr('onclick',"saveItem(this,'N')");
		$('#itemForm').find('.itemSave').removeClass('btn-danger').addClass('btn-primary');
		$('#itemForm').find('.itemSave').text('Save Info');
		$('#itemForm').find('.itemSave').prop('disabled',true);
		$('#itemForm').parsley().reset();
	}
	
	</script>