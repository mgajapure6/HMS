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
.parent-row td {
	background-color: #f6faff;
}

#table thead th {
	background-color: #e0edff !important;
}

#table thead th{
	position: sticky;
    top: 0px;
    background: #ccc;
    z-index: 100;
}

#table-div {
  height: 500px;
  overflow-y: scroll;
}
</style>
</head>
<body>
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="javascript:;">Admin</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">Role Rights</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Role Rights</h4>
		</div>
	</div>
	<div data-label="Permissions" class="df-example roleForm-div">
		<form id="roleRightForm">
			<div class="form-group row">
				<label for="roleSelect" class="col-sm-2 col-form-label mandlabel">Select Role</label>
				<div class="col-sm-10">
					<select id="roleSelect" class="form-control roleSelect select2 mandatory">
						<c:forEach items="${allRoles}" var="role">
							<option value="${role.id}" ${roleId ==  role.id ? 'selected' : ''}>${role.roleName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label for="roleNameOl" class="col-sm-2 col-form-label">Role Rights </label>
				<div class="col-sm-10">
					<div id="table-div">
						<table id="table" class="table table-bordered" style="width: 100%;">
							<thead>
								<tr>
									<th class="hide">#</th>
									<th>Permission Name</th>
									<th class="center">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input checkBoxR prAll" id="checkBoxRall">
											<label class="custom-control-label" for="checkBoxRall">Read Permission</label>
										</div>
									</th>
									<th class="center">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input checkBoxW pwAll" id="checkBoxWall">
											<label class="custom-control-label" for="checkBoxWall">Write Permission</label>
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:set value="0" var="rCount"></c:set>
								<c:forEach items="${modules}" var="mo">
									<c:set value="${rCount + 1}" var="rCount"></c:set>
									<tr data-moduleid="${mo.id}" class="parent-row treegrid-${rCount}" index-row="${rCount}" child-length="${fn:length(mo.menus)}" selected-cr-count="0" selected-cw-count="0">
										<th class="hide">${rCount}</th>
										<td>${mo.moduleName}</td>
										<td class="center"  >
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input checkbox-r checkBox${rCount}r pr" id="checkBox${rCount}r">
												<label class="custom-control-label" for="checkBox${rCount}r"></label>
											</div>
										</td>
										<td class="center">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input checkbox-w checkBox${mo.id}w pw" id="checkBox${rCount}w">
												<label class="custom-control-label" for="checkBox${rCount}w"></label>
											</div>
										</td>
									</tr>
									<c:if test="${fn:length(mo.menus)>0}">
										<c:set value="0" var="rCountChild"></c:set>
										<c:forEach items="${mo.menus}" var="moo">
											<c:set value="${rCountChild + 1}" var="rCountChild"></c:set>
											<tr data-moduleid="${mo.id}" data-menuid="${moo.id}" class="treegrid-${rCount}${rCountChild} treegrid-parent-${rCount} child-row">
												<th class="hide">${rCount}${rCountChild}</th>
												<td>${moo.menuName}</td>
												<td class="center">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" data-menuid="${moo.id}" class="custom-control-input checkbox-r checkBox${rCount}${rCountChild}r cr" id="checkBox${rCount}${rCountChild}r">
														<label class="custom-control-label" for="checkBox${rCount}${rCountChild}r"></label>
													</div>
												</td>
												<td class="center">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" data-menuid="${moo.id}" class="custom-control-input checkbox-w checkBox${rCount}${rCountChild}w cw" id="checkBox${rCount}${rCountChild}w">
														<label class="custom-control-label" for="checkBox${rCount}${rCountChild}w"></label>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="form-group row mg-b-0">
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary roleSaveBtn" onclick="saveRoleRight(this)" disabled>Save Role</button>
					<button type="button" class="btn btn-warning" onclick="clearForm()">Clear</button>
				</div>
			</div>
			
			<div class="form-group row mg-b-0">
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10 alertDiv">
					
				</div>
			</div>
		</form>
	</div>
	<script>

		$('#roleSelect').select2({
			width : '100%',
			allowClear : true,
			placeholder : 'Please select role...'
		}).on('change',function(){
			if($(this).val()==null){
				$('#checkBoxRall').prop('indeterminate',false);
				$('#checkBoxWall').prop('indeterminate',false);
				$('#checkBoxRall').prop('checked',false);
				$('#checkBoxWall').prop('checked',false);
				$('input.checkbox-r').prop('indeterminate',false);
				$('input.checkbox-w').prop('indeterminate',false);
				$('input.checkbox-r').prop('checked',false);
				$('input.checkbox-w').prop('checked',false);

				$('tr.parent-row').attr('selected-cr-count',0);
				$('tr.parent-row').attr('selected-cw-count',0);

				$('#roleRightForm').find('.roleSaveBtn').prop('disabled', true);
			}else{
				loadRoleRights($(this).val());
				$('#roleRightForm').find('.roleSaveBtn').prop('disabled', false);
			}
		}).val(null).trigger('change');

	
		$('#table').treegrid({
			treeColumn : 0,
		});


		$(function() {
			$(document).find('input.pr').on('change',function(){
				var index = $(this).closest('tr').attr('index-row');
				var childLength = $(this).closest('tr').attr('child-length');
				if($(this).prop('checked')){
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cr').prop('checked',true);
					$(this).closest('tr').attr('selected-cr-count',childLength);
				}else{
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cr').prop('checked',false);
					$(this).closest('tr').attr('selected-cr-count',0);
				}

				var rLength = $('input.checkbox-r').length;
				var rCheckedLength = $('input.checkbox-r:checked').length;
				if(rCheckedLength==0){
					$('#checkBoxRall').prop('checked',false);
					$('#checkBoxRall').prop('indeterminate',false);
				}else if(rLength==rCheckedLength){
					$('#checkBoxRall').prop('indeterminate',false);
					$('#checkBoxRall').prop('checked',true);
				}else if(rCheckedLength>0){
					$('#checkBoxRall').prop('checked',false);
					$('#checkBoxRall').prop('indeterminate',true);
				}
			});

			$(document).find('input.pw').on('change',function(){
				var index = $(this).closest('tr').attr('index-row');
				var childLength = $(this).closest('tr').attr('child-length');
				if($(this).prop('checked')){
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cw').prop('checked',true);
					$(this).closest('tr').attr('selected-cw-count',childLength);
				}else{
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cw').prop('checked',false);
					$(this).closest('tr').attr('selected-cw-count',0);
				}

				var wLength = $('input.checkbox-w').length;
				var wCheckedLength = $('input.checkbox-w:checked').length;

				if(wCheckedLength==0){
					$('#checkBoxWall').prop('checked',false);
					$('#checkBoxWall').prop('indeterminate',false);
				}else if(wLength==wCheckedLength){
					$('#checkBoxWall').prop('indeterminate',false);
					$('#checkBoxWall').prop('checked',true);
				}else if(wCheckedLength>0){
					$('#checkBoxWall').prop('checked',false);
					$('#checkBoxWall').prop('indeterminate',true);
				}
			});

			$(document).find('input.cr').on('change',function(){
				var moduleId = $(this).closest('tr').attr('data-moduleid');
				if($(this).prop('checked')){
					var selectedCRcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cr-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cr-count',parseInt(selectedCRcount)+1);
				}else{
					var selectedCRcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cr-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cr-count',parseInt(selectedCRcount)-1);
				}
				var childLength = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('child-length');
				var selectedCRcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cr-count');
				
				if(parseInt(selectedCRcount)==0){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pr').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pr').prop('checked',false);
				}else if(parseInt(childLength)==parseInt(selectedCRcount)){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pr').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pr').prop('checked',true);
				}else{
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pr').prop('checked',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pr').prop('indeterminate',true);
				}

				var rLength = $('input.checkbox-r').length;
				var rCheckedLength = $('input.checkbox-r:checked').length;
				if(rCheckedLength==0){
					$('#checkBoxRall').prop('checked',false);
					$('#checkBoxRall').prop('indeterminate',false);
				}else if(rLength==rCheckedLength){
					$('#checkBoxRall').prop('indeterminate',false);
					$('#checkBoxRall').prop('checked',true);
				}else if(rCheckedLength>0){
					$('#checkBoxRall').prop('checked',false);
					$('#checkBoxRall').prop('indeterminate',true);
				}
				
			});

			$(document).find('input.cw').on('change',function(){
				var moduleId = $(this).closest('tr').attr('data-moduleid');
				if($(this).prop('checked')){
					var selectedCWcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cw-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cw-count',parseInt(selectedCWcount)+1);
				}else{
					var selectedCWcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cw-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cw-count',parseInt(selectedCWcount)-1);
				}
				var childLength = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('child-length');
				var selectedCWcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cw-count');
				
				if(parseInt(selectedCWcount)==0){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pw').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pw').prop('checked',false);
				}else if(parseInt(childLength)==parseInt(selectedCWcount)){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pw').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pw').prop('checked',true);
				}else{
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pw').prop('checked',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pw').prop('indeterminate',true);
				}

				var wLength = $('input.checkbox-w').length;
				var wCheckedLength = $('input.checkbox-w:checked').length;

				if(wCheckedLength==0){
					$('#checkBoxWall').prop('checked',false);
					$('#checkBoxWall').prop('indeterminate',false);
				}else if(wLength==wCheckedLength){
					$('#checkBoxWall').prop('indeterminate',false);
					$('#checkBoxWall').prop('checked',true);
				}else if(wCheckedLength>0){
					$('#checkBoxWall').prop('checked',false);
					$('#checkBoxWall').prop('indeterminate',true);
				}
			});

			$('#checkBoxRall').on('change',function(){
				if($(this).prop('checked')){
					$('#table>tbody').find('input.pr').prop('checked',true);
					$('#table>tbody').find('input.cr').prop('checked',true);
				}else{
					$('#table>tbody').find('input.pr').prop('checked',false);
					$('#table>tbody').find('input.cr').prop('checked',false);
				}
			});

			$('#checkBoxWall').on('change',function(){
				if($(this).prop('checked')){
					$('#table>tbody').find('input.pw').prop('checked',true);
					$('#table>tbody').find('input.cw').prop('checked',true);
				}else{
					$('#table>tbody').find('input.pw').prop('checked',false);
					$('#table>tbody').find('input.cw').prop('checked',false);
				}
			});
		});


		function loadRoleRights(roleid){
			$('.loading').removeClass('hide');
			$('.mainContainer').addClass('hide');
			$('.footer').addClass('hide');
			$.ajax({
				url : "/app/admin/roleRight/getRoleById",
				async : false,
				method : 'POST',
				data : {
					'roleId' : roleid
				},
				success : function(resp) {
					console.log('resp::',resp);

					$('#checkBoxRall').prop('indeterminate',false);
					$('#checkBoxWall').prop('indeterminate',false);
					$('#checkBoxRall').prop('checked',false);
					$('#checkBoxWall').prop('checked',false);
					$('input.checkbox-r').prop('indeterminate',false);
					$('input.checkbox-w').prop('indeterminate',false);
					$('input.checkbox-r').prop('checked',false);
					$('input.checkbox-w').prop('checked',false);

					$('tr.parent-row').attr('selected-cr-count',0);
					$('tr.parent-row').attr('selected-cw-count',0);
					
					if(resp.data && resp.data.roleMasterRights && resp.data.roleMasterRights.length > 0){
						$.each(resp.data.roleMasterRights,function(i,ob){
							if(ob.menuRead){
								if(!$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cr').prop('checked')){
									$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cr').prop('checked',ob.menuRead).trigger('change');
								}
							}

							if(ob.menuWrite){
								if(!$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cw').prop('checked')){
									$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cw').prop('checked',ob.menuWrite).trigger('change');
								}
							}
							/* if(!ob.menuId){
								if(ob.moduleRead){
									$('tr.parent-row[data-moduleid="'+ob.moduleId+'"]').find('input.custom-control-input.pr').prop('checked',ob.moduleRead).trigger('change');
								}
								if(ob.moduleWrite){
									$('tr.parent-row[data-moduleid="'+ob.moduleId+'"]').find('input.custom-control-input.pw').prop('checked',ob.moduleWrite).trigger('change');
								}
							}else{
								if(ob.menuRead){
									if(!$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cr').prop('checked')){
										$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cr').prop('checked',ob.menuRead).trigger('change');
									}
								}

								if(ob.menuWrite){
									if(!$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cw').prop('checked')){
										$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cw').prop('checked',ob.menuWrite).trigger('change');
									}
								}
							} */
						});
					}

					/* var rLength = $('input.checkbox-r').length;
					var wLength = $('input.checkbox-w').length;

					var rCheckedLength = $('input.checkbox-r:checked').length;
					var wCheckedLength = $('input.checkbox-w:checked').length;

					if(rLength==rCheckedLength){
						$('#checkBoxRall').prop('checked',true);
					}else{
						$('#checkBoxRall').prop('checked',false);
					}

					if(wLength==wCheckedLength){
						$('#checkBoxWall').prop('checked',true);
					}else{
						$('#checkBoxWall').prop('checked',false);
					} */
					
					setTimeout(function() {
						$('.loading').addClass('hide');
						$('.mainContainer').removeClass('hide');
						$('.footer').removeClass('hide');
					}, 1000);
				}
			});
		}

		function saveRoleRight(){
			var rrList = [];
			
			$('#table>tbody').find('tr.child-row').each(function(i,tr){

				if($(tr).find('input.custom-control-input.cr').prop('checked') ||
						$(tr).find('input.custom-control-input.cw').prop('checked')){
					var rrObj = {};
					var moduleId = $(tr).attr('data-moduleid')
					rrObj.moduleId 		= moduleId;
					rrObj.moduleRead 	= $('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pr').prop('checked');
					rrObj.moduleWrite 	= $('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pw').prop('checked');;
					rrObj.menuId 		= $(tr).attr('data-menuid');
					rrObj.menuRead 		= $(tr).find('input.custom-control-input.cr').prop('checked');
					rrObj.menuWrite 	= $(tr).find('input.custom-control-input.cw').prop('checked');
					rrList.push(rrObj);
				}
				
				/* if($(tr).hasClass('parent-row')){
					if($(tr).find('input.custom-control-input.pr').prop('checked') || 
							$(tr).find('input.custom-control-input.pw').prop('checked')){
						var rrObj = {};
						rrObj.moduleId 		= $(tr).attr('data-moduleid');
						rrObj.moduleRead 	= $(tr).find('input.custom-control-input.pr').prop('checked');
						rrObj.moduleWrite 	= $(tr).find('input.custom-control-input.pw').prop('checked');
						rrObj.menuId 		= null;
						rrObj.menuRead 		= null;
						rrObj.menuWrite 	= null;
						rrList.push(rrObj);
					}
					
				}else{
					if($(tr).find('input.custom-control-input.cr').prop('checked') ||
							$(tr).find('input.custom-control-input.cw').prop('checked')){
						var rrObj = {};
						rrObj.moduleId 		= $(tr).attr('data-moduleid');
						rrObj.moduleRead 	= null;
						rrObj.moduleWrite 	= null;
						rrObj.menuId 		= $(tr).attr('data-menuid');
						rrObj.menuRead 		= $(tr).find('input.custom-control-input.cr').prop('checked');
						rrObj.menuWrite 	= $(tr).find('input.custom-control-input.cw').prop('checked');
						rrList.push(rrObj);
					}
				} */
				
			});

			console.log('rrList::',rrList);

			$.ajax({
				url : '/app/admin/roleRight/saveRoleRights',
				method : 'POST',
				data : {
					"roleId" : $('#roleSelect').val(),
					"data" : JSON.stringify(rrList)
				},
				async : false,
				success : function(resp) {
					console.log('resp', resp);
					if (resp.status == "success") {
						$('.alertDiv').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0 mg-t-20" role="alert">'
												+ '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '
												+ resp.msg + '</div>');
					} else {
						$('.alertDiv').find('.alert').remove();
						$('.alertDiv').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0 mg-t-20" role="alert">'
												+ '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '
												+ resp.msg + '</div>');
					}

					setTimeout(function(){
						$('.alertDiv').find('.alert').remove();
					},3000);
				}
			});
		}

		function statusFormatter(value, row, index) {
			if (value === 1) {
				return '<span class="badge badge-pill badge-success">Active</span>'
			}
			return '<span class="badge badge-pill badge-danger">Inactive</span>'
		}
	</script>
</body>
</html>