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
	width: 15%;
}

.dataTables_filter {
	width: 85%;
}

.dataTables_wrapper .dataTables_filter label {
	display: unset !important;
}
</style>
</head>
<body>
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item active" aria-current="page">Inventory</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Inventory Management</h4>
		</div>
		<div class="d-none d-md-block"></div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<ul class="nav nav-line" id="myTab5" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="allItm-tab5" data-toggle="tab" href="#allItmTabPane" role="tab" aria-controls="allItm" aria-selected="true">All Items</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="category-tab5" data-toggle="tab" href="#categoryTabPane" role="tab" aria-controls="category" aria-selected="false">Categories</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="lowStock-tab5" data-toggle="tab" href="#lowStockTabPane" role="tab" aria-controls="lowStock" aria-selected="false">Low In Stock</a>
				</li>
			</ul>
			<div class="tab-content mg-t-20" id="myTabContent5">
				<div class="tab-pane fade active show" id="allItmTabPane" role="tabpanel" aria-labelledby="allItm-tab5">
					<h6>All Items</h6>
					<table class="table allItmTable" id=allItmTable">
						<thead>
							<tr>
								<th scope="col">Name</th>
								<th scope="col">Quantity</th>
								<th scope="col">Category</th>
								<th scope="col">Status</th>
								<th scope="col">Mea. Unit</th>
								<th scope="col">Brand</th>
								<th scope="col">Expiry Date</th>
								<th scope="col">Cost Price</th>
								<th scope="col">Selling Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${allItems}" var="itm">
								<tr>
									<td class="itemName">${itm.itemName}</td>
									<td class="mainQty">${itm.mainQty}</td>
									<td class="categoryName">${itm.itemCategory.categoryName}</td>
									<td class="">${itm.status}<span class="status hide">${itm.status}</span>
									</td>
									<td class="">${itm.measurementUnit}<span class="measurementUnit hide">${itm.measurementUnit}</span>
									</td>
									<td class="brand">${itm.brand}</td>
									<td class="expiryDate">${itm.expiryDate}</td>
									<td class="costPrice">${itm.costPrice}</td>
									<td class="sellingPrice">${itm.sellingPrice}</td>
									<td class=""><span class="itemId hide">${itm.id}</span> <span class="categoryId hide">${itm.itemCategory.id}</span> <span class="lowStockQty hide">${itm.lowStockQty}</span>
										<div class="text-center">
											<button type="button" onclick="saveUpdateDeleteItm(this,'M','tr')" data-itemid="${itm.id}" class="btn btn-success btn-icon btn-sm">
												<i data-feather="edit-3"></i>
											</button>
											<button type="button" onclick="saveUpdateDeleteItm(this,'D','tr')" data-itemid="${itm.id}" class="btn btn-danger btn-icon btn-sm">
												<i data-feather="trash-2"></i>
											</button>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="categoryTabPane" role="tabpanel" aria-labelledby="category-tab5">
					<h6>All Categories</h6>
					<table class="table allCategoryTable" id=allCategoryTable">
						<thead>
							<tr>
								<th scope="col">Name</th>
								<th scope="col">Status</th>
								<th scope="col">Description</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${allCategories}" var="cat">
								<tr>
									<td class="categoryName">${cat.categoryName}</td>
									<td class="status">${cat.status}</td>
									<td class="status">${cat.desc}</td>
									<td class=""><span class="categoryId hide">${cat.id}</span>
										<div class="text-center">
											<button type="button" onclick="saveUpdateDeleteCategory(this,'M')" data-itemid="${cat.id}" class="btn btn-success btn-icon btn-sm">
												<i class="icon ion-md-create"></i>
											</button>
											<button type="button" onclick="saveUpdateDeleteCategory(this,'D')" data-itemid="${cat.id}" class="btn btn-danger btn-icon btn-sm">
												<i class="icon ion-md-trash"></i>
											</button>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="lowStockTabPane" role="tabpanel" aria-labelledby="lowStock-tab5">
					<h6>Low Stock Items</h6>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="AddItemFormModal.jsp"></jsp:include>
	<jsp:include page="AddCategoryFormModal.jsp"></jsp:include>
	<%-- <div class="modal" id="modalAddItem" role="dialog" aria-hidden="true" style="display: none;">
		<div class="modal-dialog wd-sm-650" role="document">
			<div class="modal-content">
				<form id="itemForm">
					<div class="modal-header pd-x-20 pd-sm-x-30">
						<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</a>
						<div class="media align-items-center">
							<span class="tx-color-03 d-none d-sm-block">
								<i data-feather="box"></i>
							</span>
							<div class="media-body mg-sm-l-20">
								<h4 class="tx-18 tx-sm-20 mg-b-2">Enter Item Info</h4>
								<p class="tx-13 tx-color-03 mg-b-0">Please fill all fields for better result.</p>
							</div>
						</div>
					</div>
					<div class="modal-body pd-sm-x-30">
						<div class="form-group mg-b-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Item Name</label>
							<input type="text" class="form-control mandatory itemName itemNameCleave" placeholder="Enter item name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 digit. ">
							<input type="hidden" class="itemId" value="0">
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
	</div> --%>
	<!-- <div class="modal" id="modalAddCategory" role="dialog" aria-hidden="true" style="display: none;">
		<div class="modal-dialog wd-sm-650" role="document">
			<div class="modal-content">
				<form id="categoryForm">
					<div class="modal-header pd-x-20 pd-sm-x-30">
						<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</a>
						<div class="media align-items-center">
							<span class="tx-color-03 d-none d-sm-block">
								<i data-feather="box"></i>
							</span>
							<div class="media-body mg-sm-l-20">
								<h4 class="tx-18 tx-sm-20 mg-b-2">Enter Category Info</h4>
								<p class="tx-13 tx-color-03 mg-b-0">Please fill all fields for better result.</p>
							</div>
						</div>
					</div>
					<div class="modal-body pd-sm-x-30">
						<div class="form-group mg-b-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03 mandlabel">Category Name</label>
							<input type="text" class="form-control categoryName mandatory" placeholder="Enter category Name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
							<input type="hidden" class="categoryId" value="0">
						</div>
						<div class="form-group mg-b-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Select Status</label>
							<select class="form-control statusSelect select2">
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>
							</select>
						</div>
						<div class="form-group mg-b-0">
							<label class="tx-10 tx-uppercase tx-medium tx-spacing-1 mg-b-0 tx-color-03">Short Description</label>
							<textarea class="form-control categoryDesc" rows="2" placeholder="Write some short description about this category"></textarea>
						</div>
					</div>
					<div class="modal-footer pd-x-20 pd-y-15">
						<button type="button" class="btn btn-white" data-dismiss="modal">Cancel</button>
						<button type="button" data-flag="N" class="btn btn-primary categorySave" onclick="saveCategory(this)" disabled>Save Info</button>
					</div>
				</form> 
			</div>
		</div>
	</div> -->
	<!-- <script src="lib/parsleyjs/parsley.min.js"></script> -->
	<script type="text/javascript">
	var itmTable=null;
	var catTable=null;
	
	
	
	$(function(){
        'use strict'
        
        //
        if ($.fn.dataTable.isDataTable( '.allItmTable' )){
    		itmTable = $('.allItmTable').DataTable();
		}else{
		    itmTable = $('.allItmTable').DataTable({
		    	language : {
					searchPlaceholder : 'Search...',
					sSearch : '',
					lengthMenu : '_MENU_ items/page',
				},
				"initComplete":function(){
				
					$('#allItmTabPane').find('.dataTables_filter').append('<a href="javascript:;" style="float: right;" onclick="reloadPage()" class="btn btn-sm pd-x-15 btn-white btn-uppercase mg-l-5">'+
							'<i data-feather="refresh-cw"></i></a>'+
							'<a href="javascript:;" style="float: right;" onclick="openItemModal()" class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5">'+
								'<i class="fa fa-plus"></i> Add New Item</a>');
					feather.replace();
				}
		    });
		}
        
        
        //
        
        if ($.fn.dataTable.isDataTable( '.allCategoryTable' )){
        	catTable = $('.allCategoryTable').DataTable();
		}else{
			catTable = $('.allCategoryTable').DataTable({
		    	language : {
					searchPlaceholder : 'Search...',
					sSearch : '',
					lengthMenu : '_MENU_ items/page',
				},
				"initComplete":function(){
					
					$('#categoryTabPane').find('.dataTables_filter').append('<a href="javascript:;" style="float: right;" onclick="reloadPage()" class="btn btn-sm pd-x-15 btn-white btn-uppercase mg-l-5">'+
							'<i data-feather="refresh-cw"></i></a>'+
							'<a href="javascript:;" style="float: right;" onclick="openCategoryModalNew()" class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5">'+
								'<i class="fa fa-plus"></i> Add New Category</a>');
					feather.replace();
				}
		    });
		}
        
        $('.dataTables_length').find('select').select2({minimumResultsForSearch: -1});
        
        
        $('select').on('change', function(){
        	if($(this).val()!=null){
        		$(this).trigger('input');
        	}
	    	if($(this).hasClass('mandatory') && $(this).closest('.parsley-select').find('ul').length>0){
	    		var ul = $(this).closest('.parsley-select').find('ul');
				$(this).closest('.parsley-select').find('ul').remove();
				$(this).closest('.parsley-select').append(ul);
	    	}
	    	if($(this).hasClass('parsley-error') && $(this).hasClass('select2-hidden-accessible')){
	    		console.log('adding parsley-error class to select')
	    		$(this).removeClass('parsley-error');
				$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-success').addClass('parsley-error');
			}else if($(this).hasClass('parsley-success')){
				$(this).removeClass('parsley-success');
				$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-error').addClass('parsley-success');
			}else{
				$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-error').removeClass('parsley-success');
			}
	    });

        
        /* $('#itemForm').on('focus change paste cut keyup keypress',function() {
        	$('#modalAddItem').find('.alert').remove();
		});
        
        $('#categoryForm').on('focus change paste cut keyup keypress',function() {
        	$('#modalAddCategory').find('.alert').remove();
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
        
        $('select').on('change', function(){
        	if($(this).val()!=null){
        		$(this).trigger('input');
        	}
	    	if($(this).hasClass('mandatory') && $(this).closest('.parsley-select').find('ul').length>0){
	    		var ul = $(this).closest('.parsley-select').find('ul');
				$(this).closest('.parsley-select').find('ul').remove();
				$(this).closest('.parsley-select').append(ul);
	    	}
	    	if($(this).hasClass('parsley-error') && $(this).hasClass('select2-hidden-accessible')){
	    		console.log('adding parsley-error class to select')
	    		$(this).removeClass('parsley-error');
				$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-success').addClass('parsley-error');
			}else if($(this).hasClass('parsley-success')){
				$(this).removeClass('parsley-success');
				$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-error').addClass('parsley-success');
			}else{
				$(this).closest('.parsley-select').find('.select2-selection').removeClass('parsley-error').removeClass('parsley-success');
			}
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
		
		$('#categoryForm').parsley().on('field:validated', function() {
			var parsleyFieldLength = $('#categoryForm').find('.mandatory').length;
		    var isValidForm = false;
			if($('#categoryForm').find('.parsley-success').length==parsleyFieldLength){
				isValidForm = true;
			}else{
				isValidForm = false;
			}
			if(isValidForm){
				$('.categorySave').prop('disabled',false);
			}else{
				$('.categorySave').prop('disabled',true);
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
		
		$('#modalAddCategory').on('hidden.bs.modal', function() {
			if(needReloadCategory){
				reloadPage();
			} 
		});
		
		$('#modalAddItem').on('shown.bs.modal', function() {
			needReloadItem=false;
		});
		
		$('#modalAddCategory').on('shown.bs.modal', function() {
			needReloadCategory=false;
		}); */
	
    });
	
	function openItemModal(){
		clearItemForm($('#itemForm'));
		$('#modalAddItem').modal('toggle');
	}
	
	function openCategoryModalNew(){
		clearCategoryForm($('#itemForm'));
		$('#modalAddCategory').modal('toggle');
	}
/* 	
	function openCategoryModal(){
		clearCategoryForm($('#categoryForm'));
		$('#itemForm').find('.categorySelect').select2('close');
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
			url : '/inventory/saveUpdateDeleteItem',
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
	
	
	function saveCategory(btnObj){
		var flag = $(btnObj).data('flag');
		var categoryId = null;
		
		if(flag=='N'){
			categoryId = 0;
		}else{
			categoryId = $('#categoryForm').find('.categoryId').val();
		}
		
		var formData = {
			'categoryName' : 	$('#categoryForm').find('.categoryName').val(),
			'statusSelect' : 	$('#categoryForm').find('.statusSelect').val(),
			'desc' 		   : 	$('#categoryForm').find('.categoryDesc').val(),
			'flag' 		   : 	flag,
			'categoryId'   : 	categoryId
		}
		
		$.ajax({
			url : '/inventory/saveUpdateDeleteCategory',
			method : 'POST',
			data : formData,
			async : false,
			success : function(resp) {
				console.log('resp',resp);
				if(resp.status=="success"){
					needReloadCategory=true;
					clearCategoryForm($('#categoryForm'));
					$('#modalAddCategory').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'+
				    '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
				}else{
					needReloadCategory=false;
					$('#modalAddCategory').find('.modal-content').find('.alert').remove();
					$('#modalAddCategory').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'+
		            '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
				}
			}
		});
	}
	
	function saveUpdateDeleteItm(obj,flag){
		clearItemForm($('#itemForm'));
		$('#itemForm').find('.itemId').val($(obj).closest('tr').find('.itemId').text()).trigger('keyup');   
		$('#itemForm').find('.itemName').val($(obj).closest('tr').find('.itemName').text()).trigger('keyup');                        
		$('#itemForm').find('.categorySelect').val($(obj).closest('tr').find('.categoryId').text()).trigger('change');                  
		$('#itemForm').find('.measurUnitSelect').val($(obj).closest('tr').find('.measurementUnit').text()).trigger('change');                
		$('#itemForm').find('.mainQty').val($(obj).closest('tr').find('.mainQty').text()).trigger('keyup');     
		$('#itemForm').find('.brand').val($(obj).closest('tr').find('.brand').text()).trigger('keyup');                           
		$('#itemForm').find('.expiryDate').val($(obj).closest('tr').find('.expiryDate').text()).trigger('change');                      
		$('#itemForm').find('.statusSelect').val($(obj).closest('tr').find('.status').text()).trigger('change');                    
		$('#itemForm').find('.lowStockQty').val($(obj).closest('tr').find('.lowStockQty').text()).trigger('keyup'); 
		$('#itemForm').find('.costPrice').val($(obj).closest('tr').find('.costPrice').text()).trigger('keyup');   
		$('#itemForm').find('.sellingPrice').val($(obj).closest('tr').find('.sellingPrice').text()).trigger('keyup');
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

	
	function saveUpdateDeleteCategory(obj,flag){
		clearCategoryForm($('#categoryForm'));
		$('#categoryForm').find('.categoryId').val($(obj).closest('tr').find('.categoryId').text()).trigger('keyup');   
		$('#categoryForm').find('.categoryName').val($(obj).closest('tr').find('.categoryName').text()).trigger('keyup');                          
		$('#categoryForm').find('.statusSelect').val($(obj).closest('tr').find('.status').text()).trigger('change');                    
		$('#categoryForm').find('.categoryDesc').val($(obj).closest('tr').find('.categoryDesc').text()).trigger('keyup');
		$('#categoryForm').find('.categorySave').data('flag',flag);
		if(flag=='D'){
			$('#categoryForm').find('.categorySave').removeClass('btn-primary').addClass('btn-danger');
			$('#categoryForm').find('.categorySave').text('Delete Info');
		}else{
			$('#categoryForm').find('.categorySave').removeClass('btn-danger').addClass('btn-primary');
			$('#categoryForm').find('.categorySave').text('Save Info');
		}
		$('#modalAddCategory').modal('toggle');
	}
	
	function clearItemForm(formObj){
		console.log('clearItemForm')
		$('#itemForm').find('input').val('');
		$('#itemForm').find('select').val('');
		$('#itemForm').find('.select2-hidden-accessible').val(null).trigger('change');
		$('#itemForm').find('textarea').val('');
		$('#itemForm').find('.alert').remove();
		
		$('#itemForm').find('.select2-hidden-accessible').removeClass('parsley-error');
		$('#itemForm').find('.parsley-error').removeClass('.parsley-error');
		$('#itemForm').find('.parsley-success').removeClass('.parsley-success');
		$('#itemForm').find('.select2-selection').removeClass('.parsley-error');
		$('#itemForm').find('.itemId').val("0"),  
		$('#itemForm').find('.itemSave').attr('onclick',"saveItem(this,'N')");
		$('#itemForm').find('.itemSave').removeClass('btn-danger').addClass('btn-primary');
		$('#itemForm').find('.itemSave').text('Save Info');
		$('#itemForm').find('.itemSave').prop('disabled',true);
		$('#itemForm').parsley().reset();
	}
	
	function clearCategoryForm(formObj){
		console.log('clearCategoryForm')
		$('#categoryForm').find('input').val('');
		$('#categoryForm').find('select').val('');
		$('#categoryForm').find('.select2-hidden-accessible').val(null).trigger('change');
		$('#categoryForm').find('textarea').val('');
		$('#categoryForm').find('.alert').remove();
		
		$('#categoryForm').find('.select2-hidden-accessible').removeClass('parsley-error');
		$('#categoryForm').find('.parsley-error').removeClass('.parsley-error');
		$('#categoryForm').find('.parsley-success').removeClass('.parsley-success');
		$('#categoryForm').find('.select2-selection').removeClass('.parsley-error');
		$('#categoryForm').find('.categoryId').val("0"),  
		$('#categoryForm').find('.categorySave').attr('onclick',"saveCategory(this,'N')");
		$('#categoryForm').find('.categorySave').removeClass('btn-danger').addClass('btn-primary');
		$('#categoryForm').find('.categorySave').text('Save Info');
		$('#categoryForm').find('.categorySave').prop('disabled',true);
		$('#categoryForm').parsley().reset();
	}
		 */
	</script>
</body>
</html>