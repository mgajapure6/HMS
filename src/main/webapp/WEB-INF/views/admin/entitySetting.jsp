<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="lib/prism/prism-vs.css">
<link rel="stylesheet" href="lib/typicons/typicons.css">
<!-- <link rel="stylesheet" href="lib/datatable/responsive.dataTables.min.css"> -->
<style type="text/css">
.alert {
	margin-top: 10px;
}
</style>
</head>
<body>
	<input type="text" id="entityId" hidden />
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="#">Admin</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">Entity Setting</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Entity Setting</h4>
		</div>
		<div class="d-none d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 listToFormBtn">
				<i class="fa fa-plus"></i> <span class="spinner-border spinner-border-sm hide spinIcon mg-r-5" role="status" aria-hidden="true"></span> <span class="btnName">Add New Entity</span>
			</button>
		</div>
	</div>
	<div data-label="Entity Form" class="df-example entity-form hide">
		<form id="entityForm">
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label mandlabel">Entity Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="entityName" placeholder="Enter Entity Name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character.">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Entity Name Ol</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="entityNameOl" placeholder="Enter Entity Name Ol">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label mandlabel">Entity Address</label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="entityAddress" placeholder="Enter Address" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character.">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Entity Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="entityEmail" placeholder="Enter Email">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label mandlabel">Entity Contact</label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="entityContact" placeholder="Enter Contact Number" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="13" data-parsley-minlength-message="please enter at least 2 character.">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0">Status</label>
				<div class="col-sm-10">
					<div class="custom-control custom-radio">
						<input type="radio" id="mStatusE" value="E" name="mStatus" class="custom-control-input" checked>
						<label class="custom-control-label" for="mStatusE">Enable</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="mStatusD" value="D" name="mStatus" class="custom-control-input">
						<label class="custom-control-label" for="mStatusD">Disable</label>
					</div>
				</div>
			</div>
			<div class="form-group row mg-b-0">
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary entitySaveBtn" data-flag="N" data-menuid="" onclick="saveEntity(this)" disabled>Save Menu</button>
					<button type="button" class="btn btn-warning" onclick="clearForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	<div data-label="entity List" class="entityTable-div df-example">
		<div class="table-responsive">
			<table class="table mg-b-0" id="entityListTable">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Entity Name</th>
						<th scope="col">Entity Name Ol</th>
						<th scope="col">Entity Address</th>
						<th scope="col">Entity Contact</th>
						<th scope="col">Entity Email</th>
						<th scope="col">Status</th>
						<th scope="col" class="center">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:set value="0" var="rCount"></c:set>
					<c:forEach items="${allEntityMasters}" var="entity">
						<c:set value="${rCount + 1}" var="rCount"></c:set>
						<tr>
							<td class="entityCount">${rCount}</td>
							<td class="entityName">${entity.entityName}</td>
							<td class="entityNameOl">${entity.entityNameOl}</td>
							<td class="entityAddress">${entity.entityAddress}</td>
							<td class="entityContact">${entity.entityContact}</td>
							<td class="entityEmail">${entity.entityEmail}</td>
							<td class="entityStatus">${entity.status}<span class="entityStatus hide">${entity.status}</span></td>
							<td class="">
								<div class="text-center">
									<button type="button" onclick="setFormData(this,'M')" data-entityid="${entity.id}" class="btn btn-success btn-icon btn-sm editRecordBtn">
										<i class="fa fa-pencil-alt" aria-hidden="true"></i>
									</button>
									<button type="button" onclick="setFormData(this,'D')" data-entityid="${entity.id}" class="btn btn-danger btn-icon btn-sm deleteRecordBtn">
										<i class="fa fa-trash-alt" aria-hidden="true"></i>
									</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- table-responsive -->
	</div>
	<script type="text/javascript">
	
		var needPageReload = false;
	
		$('#entityForm').parsley().on('field:validated', function() {
			var parsleyFieldLength = $('#entityForm').find('.mandatory').length;
		    var isValidForm = false;
			if($('#entityForm').find('.parsley-success').length==parsleyFieldLength){
				isValidForm = true;
			}else{
				isValidForm = false;
			}
			if(isValidForm){
				$('.entitySaveBtn').prop('disabled',false);
			}else{
				$('.entitySaveBtn').prop('disabled',true);
			}
		 }).on('form:submit', function() {
		    return false; // Don't submit form 
		 });
		
		
		$('.listToFormBtn').on('click', function() {
			$(this).find('.fa').addClass('hide');
			$(this).find('.spinIcon').removeClass('hide');
			setTimeout(function() {
				if ($('.entity-form').hasClass('hide')) {
					$('.entity-form').removeClass('hide');
					$('.entityTable-div').addClass('hide');
					$('.listToFormBtn').find('span.btnName').text('All Entities')
				} else {
					$('.entity-form').addClass('hide');
					$('.entityTable-div').removeClass('hide');
					$('.listToFormBtn').find('span.btnName').text('Add New Entity')
				}

				$('.listToFormBtn').find('.spinIcon').addClass('hide');
				$('.listToFormBtn').find('.fa').removeClass('hide');
			}, 500);

		});

		function setFormData(btnObj,flg){
			$('.listToFormBtn').click();
			needPageReload = false;
			$('.entity-form').find('.alert').remove();
			var tr = $(btnObj).closest('tr');
			var entId = $(btnObj).attr('data-entityid');
			$('#entityId').val(entId);
			$('#entityName').val($(tr).find('.entityName').text().trim());                                           
			$('#entityNameOl').val($(tr).find('.entityNameOl').text().trim());
			$('#entityAddress').val($(tr).find('.entityAddress').text().trim());
			$('#entityEmail').val($(tr).find('.entityEmail').text().trim());
			$('#entityContact').val($(tr).find('.entityContact').text().trim());
			if($(tr).find('span.entityStatus').text()=="E")  {
				$('#mStatusE').prop("checked",true);
			}else{
				$('#mStatusD').prop("checked",true);
			}                                     
			
			//$('#entityForm').find('input.entityId').val(entId); 
			$('#entityForm').find('.entitySaveBtn').attr('data-flag',flg);
			$('#entityForm').parsley().validate();

		}
		
		
		function saveEntity(btnObj){
			var flag = $(btnObj).data('flag');
			var entityId = null;
			
			if(flag=='N'){
				entityId = 0;
			}else{
				entityId = $("#entityId").val();//$("#entityId").attr('data-parsley-id');
			}
			
			var formData = {
				'id'     		:   entityId,
				'entityName'   	: 	$('#entityName').val(),
				'entityNameOl' 	: 	$('#entityNameOl').val(),
				'entityAddress' :   $('#entityAddress').val(),
				'entityEmail' 	:   $('#entityEmail').val(),
				'entityContact' :   $('#entityContact').val(),
				'status'     	:	$('#entityForm').find('input[name="mStatus"]:checked').val(),
				'flag'			: 	flag,
			}
			
			$.ajax({
				url : '/app/admin/entityMaster/saveUpdateDeleteEntity',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					
					if(resp.status=="success"){
						needPageReload=true;
						clearForm($('#entityForm'));
						$('.entity-form').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'+
					   '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
					}else{
						needPageReload=false;
						$('.entity-form').find('.alert').remove();
						$('.entity-form').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'+
			           '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '+resp.msg+'</div>')
					}
				}
			});
		}
		
		
		function clearForm(formObje){
			var formObj = formObje ? formObje : $('#entityForm');
			$('.entity-form').find('.alert').remove();
			$('#entityForm').find('input').val('');
			$('#entityForm').find('select').val('');
			$('#entityForm').find('.select2-hidden-accessible').val(null).trigger('change');
			$('#entityForm').find('textarea').val('');
			$('#mStatusE').val('E');
			$('#mStatusD').val('D');
			$('#entityForm').find('input[type="radio"]:first').prop('checked',true);
			$('#entityForm').find('.alert').remove();
			$('#entityForm').find('.select2-hidden-accessible').removeClass('parsley-error');
			$('#entityForm').find('.parsley-error').removeClass('.parsley-error');
			$('#entityForm').find('.parsley-success').removeClass('.parsley-success');
			$('#entityForm').find('.select2-selection').removeClass('.parsley-error');
			$('#entityForm').find('input.entityId').val("0"),  
			$('#entityForm').find('.entitySaveBtn').attr('data-flag',"N");
			$('#entityForm').find('.entitySaveBtn').removeClass('btn-danger').addClass('btn-primary');
			$('#entityForm').find('.entitySaveBtn').text('Save Menu');
			$('#entityForm').find('.entitySaveBtn').prop('disabled',true);
			$('#entityForm').parsley().reset();
		}
		
		$('#example1').DataTable({
			language : {
				searchPlaceholder : 'Search...',
				sSearch : '',
				lengthMenu : '_Entity_ items/page',
			}
		});
	</script>
</body>
</html>