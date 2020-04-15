<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal" id="modalAddCategory" role="dialog" aria-hidden="true" style="display: none;">
	<div class="modal-dialog wd-sm-650" role="document">
		<div class="modal-content">
			<form id="categoryForm">
				<div class="modal-header pd-x-20 pd-sm-x-30">
					<a href="" role="button" class="close pos-absolute t-15 r-15" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</a>
					<div class="media align-items-center">
						<span class="tx-color-03 d-none d-sm-block"> <i data-feather="box"></i>
						</span>
						<div class="media-body mg-sm-l-20">
							<h4 class="tx-18 tx-sm-20 mg-b-2">Create Category Info</h4>
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
</div>
<script type="text/javascript">
	var needReloadCategory = false;

    $(function() {
	    'use strict'


	    $('#categoryForm').on('focus change paste cut keyup keypress', function() {
		    $('#modalAddCategory').find('.alert').remove();
	    });

	    $('.statusSelect').select2({
	        width : '100%',
	        placeholder : 'Select Status',
	        allowClear : true
	    }).val(null).trigger('change');

	    $('#categoryForm').parsley().on('field:validated', function() {
		    var parsleyFieldLength = $('#categoryForm').find('.mandatory').length;
		    var isValidForm = false;
		    if ($('#categoryForm').find('.parsley-success').length == parsleyFieldLength) {
			    isValidForm = true;
		    } else {
			    isValidForm = false;
		    }
		    if (isValidForm) {
			    $('.categorySave').prop('disabled', false);
		    } else {
			    $('.categorySave').prop('disabled', true);
		    }
	    }).on('form:submit', function() {
		    return false; // Don't submit form for this demo
	    });

	    $('#modalAddCategory').on('hidden.bs.modal', function() {
		    if (needReloadCategory) {
			    reloadPage();
		    }
	    });

	    $('#modalAddCategory').on('shown.bs.modal', function() {
		    needReloadCategory = false;
	    });

    });

   

    function saveCategory(btnObj) {
	    var flag = $(btnObj).data('flag');
	    var categoryId = null;

	    if (flag == 'N') {
		    categoryId = 0;
	    } else {
		    categoryId = $('#categoryForm').find('.categoryId').val();
	    }

	    var formData = {
	        'categoryName' : $('#categoryForm').find('.categoryName').val(),
	        'statusSelect' : $('#categoryForm').find('.statusSelect').val(),
	        'desc' : $('#categoryForm').find('.categoryDesc').val(),
	        'flag' : flag,
	        'categoryId' : categoryId
	    }

	    $.ajax({
	        url : '${pageContext.request.contextPath }/app/inventory/categoryMaster/saveUpdateDeleteCategory',
	        method : 'POST',
	        data : formData,
	        async : false,
	        success : function(resp) {
		        console.log('resp', resp);
		        if (resp.status == "success") {
			        needReloadCategory = true;
			        clearCategoryForm($('#categoryForm'));
			        $('#modalAddCategory').find('.modal-content').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		        } else {
			        needReloadCategory = false;
			        $('#modalAddCategory').find('.modal-content').find('.alert').remove();
			        $('#modalAddCategory').find('.modal-content').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		        }
	        }
	    });
    }

    function saveUpdateDeleteCategory(obj, flag) {
	    clearCategoryForm($('#categoryForm'));
	    $('#categoryForm').find('.categoryId').val($(obj).closest('tr').find('.categoryId').text()).trigger('keyup');
	    $('#categoryForm').find('.categoryName').val($(obj).closest('tr').find('.categoryName').text()).trigger('keyup');
	    $('#categoryForm').find('.statusSelect').val($(obj).closest('tr').find('.status').text()).trigger('change');
	    $('#categoryForm').find('.categoryDesc').val($(obj).closest('tr').find('.categoryDesc').text()).trigger('keyup');
	    $('#categoryForm').find('.categorySave').data('flag', flag);
	    if (flag == 'D') {
		    $('#categoryForm').find('.categorySave').removeClass('btn-primary').addClass('btn-danger');
		    $('#categoryForm').find('.categorySave').text('Delete Info');
	    } else {
		    $('#categoryForm').find('.categorySave').removeClass('btn-danger').addClass('btn-primary');
		    $('#categoryForm').find('.categorySave').text('Save Info');
	    }
	    $('#modalAddCategory').modal('toggle');
    }

    function clearCategoryForm(formObj) {
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
	    $('#categoryForm').find('.categoryId').val("0"), $('#categoryForm').find('.categorySave').attr('onclick', "saveCategory(this,'N')");
	    $('#categoryForm').find('.categorySave').removeClass('btn-danger').addClass('btn-primary');
	    $('#categoryForm').find('.categorySave').text('Save Info');
	    $('#categoryForm').find('.categorySave').prop('disabled', true);
	    $('#categoryForm').parsley().reset();
    }
</script>