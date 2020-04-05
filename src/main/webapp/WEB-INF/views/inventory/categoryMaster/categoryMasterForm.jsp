<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page import="com.fasterxml.jackson.databind.SerializationFeature"%>
<%
	ObjectMapper mapper = new ObjectMapper();
	mapper.disable(SerializationFeature.FAIL_ON_EMPTY_BEANS);
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.alert {
	margin-top: 10px;
}
</style>
</head>
<body>
	<input type="hidden" value="${category.id == null ? 0 : category.id}" id="categoryId">
	<input type="hidden" value="${flag}" id="categoryFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="javascript:;">Inventory</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Category' : 'Update Category'}</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Category' : 'Update Category'}</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 formCancelBtn">
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
			</button>
		</div>
	</div>
	<div data-label="Category Form" class="df-example categoryForm-div">
		<form id="categoryForm">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">Category Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control categoryName mandatory" placeholder="Enter category Name" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. ">
					<input type="hidden" class="categoryId" value="0">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label mandlabel">Select Status</label>
				<div class="col-sm-10">
					<select class="form-control statusSelect select2">
						<option value="Active">Active</option>
						<option value="Inactive">Inactive</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Short Description</label>
				<div class="col-sm-10">
					<textarea class="form-control categoryDesc" rows="2" placeholder="Write some short description about this category"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Add Item </label>
				<div class="col-sm-10">
					<div id="transfer1" class="transfer-demo"></div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary categorySave" onclick="saveCategory(this)" disabled>Save Category</button>
					<button type="button" class="btn btn-warning" onclick="clearCategoryForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		var dataArray1 = [ {
			"city" : "Beijing",
			"value" : 132
		}, {
			"city" : "Shanghai",
			"value" : 422
		}, {
			"city" : "Chengdu",
			"value" : 232
		}, {
			"city" : "Wuhan",
			"value" : 765
		}, {
			"city" : "Tianjin",
			"value" : 876
		}, {
			"city" : "Guangzhou",
			"value" : 453
		}, {
			"city" : "Hongkong",
			"value" : 125
		} ];

		var settings1 = {
			"dataArray" : dataArray1,
			"itemName" : "city",
			"valueName" : "value",
			"callable" : function(items) {
				console.dir(items)
			}
		};

		$("#transfer1").transfer(settings1);
	</script>
	<script type="text/javascript">

    $(function() {
	    'use strict'
	    
	    $('.formCancelBtn').on('click', function() {
			reloadPage();
		});

	    $('#categoryForm').parsley();

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
	    
	    setFormData();
    });

    function setFormData() {
		if($('#categoryFlag').val()!='N'){
			var catJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("category"))%>));
			console.log('catJsonObj::',catJsonObj);
			$('.categoryForm-div').find('.alert').remove();
			$('#categoryForm').find('input.categoryName').val(catJsonObj.categoryName);
			$('#categoryForm').find('select.statusSelect').val(catJsonObj.status);
			$('#categoryForm').find('textarea.categoryDesc').val(catJsonObj.desc);
			$('#categoryForm').find('input.categoryId').val(catJsonObj.id);
			$('#categoryForm').parsley().validate();
		}
	}
    
   

    function saveCategory(btnObj) {
	    var flag = $('#categoryFlag').val();
	    var categoryId = null;

	    if (flag == 'N') {
		    categoryId = 0;
	    } else {
		    categoryId = $('#categoryId').val();
	    }

	    var formData = {
	        'categoryName' : $('#categoryForm').find('.categoryName').val(),
	        'statusSelect' : $('#categoryForm').find('.statusSelect').val(),
	        'desc' : $('#categoryForm').find('.categoryDesc').val(),
	        'flag' : flag,
	        'categoryId' : categoryId
	    }

	    $.ajax({
	        url : '/app/inventory/categoryMaster/saveUpdateDeleteCategory',
	        method : 'POST',
	        data : formData,
	        async : false,
	        success : function(resp) {
		        console.log('resp', resp);
		        if (resp.status == "success") {
			        clearCategoryForm($('#categoryForm'));
			        $('.categoryForm-div').find('.alert').remove();
			        $('.categoryForm-div').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		        } else {
			        $('.categoryForm-div').find('.alert').remove();
			        $('.categoryForm-div').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">' + '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> ' + resp.msg + '</div>')
		        }
	        }
	    });
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
</body>
</html>