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
	<input type="hidden" value="${role.id == null ? 0 : role.id}" id="roleId">
	<input type="hidden" value="${flag}" id="roleFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="#">Admin</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Role' : 'Update Role'}</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Role' : 'Update Role'}</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 formCancelBtn">
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
			</button>
		</div>
	</div>
	<div data-label="Role Form" class="df-example roleForm-div">
		<form id="roleForm">
			<div class="form-group row">
				<label for="roleName" class="col-sm-2 col-form-label mandlabel">Role name </label>
				<div class="col-sm-10">
					<input type="text" id="roleName" class="form-control mandatory"  placeholder="Role name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character. ">
				</div>
			</div>
			<div class="form-group row">
				<label for="roleNameOl" class="col-sm-2 col-form-label">Role name ol </label>
				<div class="col-sm-10">
					<input type="text" id="roleNameOl" class="form-control "  placeholder="Role name other language">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Short Description</label>
				<div class="col-sm-10">
					<textarea id="roleDesc" class="form-control roleDesc" rows="2" placeholder="Write some short description about this role"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-sm-2 pt-0">Status</label>
				<div class="col-sm-10">
					<select id="roleStatus" class="form-control roleStatus select2">
						<option value="Active">Active</option>
						<option value="Inactive">Inactive</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label for="roleNameOl" class="col-sm-2 col-form-label mandlabel">Role Permissions </label>
				<div class="col-sm-10">
					<div id="table-div">
						<table id="table" class="table table-bordered" style="width: 100%;">
							<thead>
								<tr>
									<th class="hide" rowspan="2">#</th>
									<th rowspan="2">Permission Name</th>
									<th class="center" colspan="4">
										Permissions
									</th>
								</tr>
								<tr>
									<th class="center">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input checkBoxV pVAll" id="checkBoxVall">
											<label class="custom-control-label" for="checkBoxVall">View Permission</label>
										</div>
									</th>
									<th class="center">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input checkBoxA pAAll" id="checkBoxAall">
											<label class="custom-control-label" for="checkBoxAall">Add Permission</label>
										</div>
									</th>
									<th class="center">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input checkBoxE peAll" id="checkBoxEall">
											<label class="custom-control-label" for="checkBoxEall">Edit Permission</label>
										</div>
									</th>
									<th class="center">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input checkBoxD pDAll" id="checkBoxDall">
											<label class="custom-control-label" for="checkBoxDall">Delete Permission</label>
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:set value="0" var="rCount"></c:set>
								<c:forEach items="${modules}" var="mo">
									<c:set value="${rCount + 100}" var="rCount"></c:set>
									<tr data-moduleid="${mo.id}" class="parent-row treegrid-${rCount}" index-row="${rCount}" child-length="${fn:length(mo.menus)}" selected-cv-count="0" selected-ca-count="0" selected-ce-count="0" selected-cd-count="0">
										<th class="hide">${rCount}</th>
										<td class="moduleName">${mo.moduleName}</td>
										<td class="center"  >
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input checkbox-v checkBox${rCount}v pv" id="checkBox${rCount}v">
												<label class="custom-control-label" for="checkBox${rCount}v"></label>
											</div>
										</td>
										<td class="center"  >
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input checkbox-a checkBox${rCount}a pa" id="checkBox${rCount}a">
												<label class="custom-control-label" for="checkBox${rCount}a"></label>
											</div>
										</td>
										<td class="center">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input checkbox-e checkBox${mo.id}e pe" id="checkBox${rCount}e">
												<label class="custom-control-label" for="checkBox${rCount}e"></label>
											</div>
										</td>
										<td class="center"  >
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input checkbox-d checkBox${rCount}d pd" id="checkBox${rCount}d">
												<label class="custom-control-label" for="checkBox${rCount}d"></label>
											</div>
										</td>
									</tr>
									<c:if test="${fn:length(mo.menus)>0}">
										<c:set value="0" var="rCountChild"></c:set>
										<c:forEach items="${mo.menus}" var="moo">
											<c:set value="${rCountChild + 1}" var="rCountChild"></c:set>
											<tr data-moduleid="${mo.id}" data-menuid="${moo.id}" index-row="${rCount}${rCountChild}" class="treegrid-${rCount}${rCountChild} treegrid-parent-${rCount} child-row">
												<th class="hide">${rCount}${rCountChild}</th>
												<td class="menuName">${moo.menuName}</td>
												<td class="center">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" data-menuid="${moo.id}" class="custom-control-input checkbox-v checkBox${rCount}${rCountChild}v cv" id="checkBox${rCount}${rCountChild}v">
														<label class="custom-control-label" for="checkBox${rCount}${rCountChild}v"></label>
													</div>
												</td>
												<td class="center">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" data-menuid="${moo.id}" class="custom-control-input checkbox-a checkBox${rCount}${rCountChild}a ca" id="checkBox${rCount}${rCountChild}a">
														<label class="custom-control-label" for="checkBox${rCount}${rCountChild}a"></label>
													</div>
												</td>
												<td class="center">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" data-menuid="${moo.id}" class="custom-control-input checkbox-e checkBox${rCount}${rCountChild}e ce" id="checkBox${rCount}${rCountChild}e">
														<label class="custom-control-label" for="checkBox${rCount}${rCountChild}e"></label>
													</div>
												</td>
												<td class="center">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" data-menuid="${moo.id}" class="custom-control-input checkbox-d checkBox${rCount}${rCountChild}d cd" id="checkBox${rCount}${rCountChild}d">
														<label class="custom-control-label" for="checkBox${rCount}${rCountChild}d"></label>
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
					<button type="button" class="btn btn-primary roleSaveBtn" data-flag="N" onclick="saveRole(this)" disabled>Save Role</button>
					<button type="button" class="btn btn-warning" onclick="clearForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">

		$('.formCancelBtn').on('click', function() {
			reloadPage();
		});

		$('#table').treegrid({
			treeColumn : 0,
		});

		$('#roleForm').parsley();

		$('#roleForm').parsley().on('field:validated',function() {
			var parsleyFieldLength = $('#roleForm').find('.mandatory').length;
			if ($('#roleForm').find('.parsley-success').length == parsleyFieldLength) {
				$('.roleSaveBtn').prop('disabled', false);
			} else {
				$('.roleSaveBtn').prop('disabled', true);
			}
		}).on('form:submit', function() {
			return false; // Don't submit form 
		});

		$(function() {
			$('#roleForm').find('input.pv').on('change',function(){
				var index = $(this).closest('tr').attr('index-row');
				var childLength = $(this).closest('tr').attr('child-length');
				if($(this).prop('checked')){
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cv').prop('checked',true);
					$(this).closest('tr').attr('selected-cv-count',childLength);
				}else{
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cv').prop('checked',false);
					$(this).closest('tr').attr('selected-cv-count',0);
				}

				var vLength = $('input.checkbox-v').length;
				var vCheckedLength = $('input.checkbox-v:checked').length;
				if(vCheckedLength==0){
					$('#checkBoxVall').prop('checked',false);
					$('#checkBoxVall').prop('indeterminate',false);
				}else if(vLength==vCheckedLength){
					$('#checkBoxVall').prop('indeterminate',false);
					$('#checkBoxVall').prop('checked',true);
				}else if(vCheckedLength>0){
					$('#checkBoxVall').prop('checked',false);
					$('#checkBoxVall').prop('indeterminate',true);
				}
			});

			
			$('#roleForm').find('input.pa').on('change',function(){
				var index = $(this).closest('tr').attr('index-row');
				var childLength = $(this).closest('tr').attr('child-length');
				if($(this).prop('checked')){
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.ca').prop('checked',true);
					$(this).closest('tr').attr('selected-ca-count',childLength);
				}else{
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.ca').prop('checked',false);
					$(this).closest('tr').attr('selected-ca-count',0);
				}

				var aLength = $('input.checkbox-a').length;
				var aCheckedLength = $('input.checkbox-a:checked').length;
				if(aCheckedLength==0){
					$('#checkBoxAall').prop('checked',false);
					$('#checkBoxAall').prop('indeterminate',false);
				}else if(aLength==aCheckedLength){
					$('#checkBoxAall').prop('indeterminate',false);
					$('#checkBoxAall').prop('checked',true);
				}else if(aCheckedLength>0){
					$('#checkBoxAall').prop('checked',false);
					$('#checkBoxAall').prop('indeterminate',true);
				}
			});

			$('#roleForm').find('input.pe').on('change',function(){
				var index = $(this).closest('tr').attr('index-row');
				var childLength = $(this).closest('tr').attr('child-length');
				if($(this).prop('checked')){
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.ce').prop('checked',true);
					$(this).closest('tr').attr('selected-ce-count',childLength);
				}else{
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.ce').prop('checked',false);
					$(this).closest('tr').attr('selected-ce-count',0);
				}

				var eLength = $('input.checkbox-e').length;
				var eCheckedLength = $('input.checkbox-e:checked').length;

				if(eCheckedLength==0){
					$('#checkBoxEall').prop('checked',false);
					$('#checkBoxEall').prop('indeterminate',false);
				}else if(eLength==eCheckedLength){
					$('#checkBoxEall').prop('indeterminate',false);
					$('#checkBoxEall').prop('checked',true);
				}else if(eCheckedLength>0){
					$('#checkBoxEall').prop('checked',false);
					$('#checkBoxEall').prop('indeterminate',true);
				}
			});

			$('#roleForm').find('input.pd').on('change',function(){
				var index = $(this).closest('tr').attr('index-row');
				var childLength = $(this).closest('tr').attr('child-length');
				if($(this).prop('checked')){
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cd').prop('checked',true);
					$(this).closest('tr').attr('selected-cd-count',childLength);
				}else{
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cd').prop('checked',false);
					$(this).closest('tr').attr('selected-cd-count',0);
				}

				var dLength = $('input.checkbox-d').length;
				var dCheckedLength = $('input.checkbox-d:checked').length;

				if(dCheckedLength==0){
					$('#checkBoxDall').prop('checked',false);
					$('#checkBoxDall').prop('indeterminate',false);
				}else if(dLength==dCheckedLength){
					$('#checkBoxDall').prop('indeterminate',false);
					$('#checkBoxDall').prop('checked',true);
				}else if(dCheckedLength>0){
					$('#checkBoxDall').prop('checked',false);
					$('#checkBoxDall').prop('indeterminate',true);
				}
			});

			$('#roleForm').find('input.cv').on('change',function(){
				var moduleId = $(this).closest('tr').attr('data-moduleid');
				if($(this).prop('checked')){
					var selectedCVcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cv-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cv-count',parseInt(selectedCVcount)+1);
				}else{
					var selectedCVcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cv-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cv-count',parseInt(selectedCVcount)-1);
				}
				var childLength = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('child-length');
				var selectedCVcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cv-count');
				
				if(parseInt(selectedCVcount)==0){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pv').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pv').prop('checked',false);
				}else if(parseInt(childLength)==parseInt(selectedCVcount)){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pv').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pv').prop('checked',true);
				}else{
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pv').prop('checked',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pv').prop('indeterminate',true);
				}

				var vLength = $('input.checkbox-v').length;
				var vCheckedLength = $('input.checkbox-v:checked').length;
				if(vCheckedLength==0){
					$('#checkBoxVall').prop('checked',false);
					$('#checkBoxVall').prop('indeterminate',false);
				}else if(vLength==vCheckedLength){
					$('#checkBoxVall').prop('indeterminate',false);
					$('#checkBoxVall').prop('checked',true);
				}else if(vCheckedLength>0){
					$('#checkBoxVall').prop('checked',false);
					$('#checkBoxVall').prop('indeterminate',true);
				}
				
			});

			$('#roleForm').find('input.ca').on('change',function(){
				var moduleId = $(this).closest('tr').attr('data-moduleid');
				if($(this).prop('checked')){
					var selectedCAcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-ca-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-ca-count',parseInt(selectedCAcount)+1);
				}else{
					var selectedCAcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-ca-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-ca-count',parseInt(selectedCAcount)-1);
				}
				var childLength = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('child-length');
				var selectedCAcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-ca-count');
				
				if(parseInt(selectedCAcount)==0){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pa').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pa').prop('checked',false);
				}else if(parseInt(childLength)==parseInt(selectedCAcount)){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pa').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pa').prop('checked',true);
				}else{
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pa').prop('checked',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pa').prop('indeterminate',true);
				}

				var aLength = $('input.checkbox-a').length;
				var aCheckedLength = $('input.checkbox-a:checked').length;
				if(aCheckedLength==0){
					$('#checkBoxAall').prop('checked',false);
					$('#checkBoxAall').prop('indeterminate',false);
				}else if(aLength==aCheckedLength){
					$('#checkBoxAall').prop('indeterminate',false);
					$('#checkBoxAall').prop('checked',true);
				}else if(aCheckedLength>0){
					$('#checkBoxAall').prop('checked',false);
					$('#checkBoxAall').prop('indeterminate',true);
				}
				
			});

			$('#roleForm').find('input.ce').on('change',function(){
				var moduleId = $(this).closest('tr').attr('data-moduleid');
				if($(this).prop('checked')){
					var selectedCEcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-ce-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-ce-count',parseInt(selectedCEcount)+1);
				}else{
					var selectedCEcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-ce-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-ce-count',parseInt(selectedCEcount)-1);
				}
				var childLength = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('child-length');
				var selectedCEcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-ce-count');
				
				if(parseInt(selectedCEcount)==0){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pe').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pe').prop('checked',false);
				}else if(parseInt(childLength)==parseInt(selectedCEcount)){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pe').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pe').prop('checked',true);
				}else{
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pe').prop('checked',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pe').prop('indeterminate',true);
				}

				var eLength = $('input.checkbox-e').length;
				var eCheckedLength = $('input.checkbox-e:checked').length;

				if(eCheckedLength==0){
					$('#checkBoxEall').prop('checked',false);
					$('#checkBoxEall').prop('indeterminate',false);
				}else if(eLength==eCheckedLength){
					$('#checkBoxEall').prop('indeterminate',false);
					$('#checkBoxEall').prop('checked',true);
				}else if(eCheckedLength>0){
					$('#checkBoxEall').prop('checked',false);
					$('#checkBoxEall').prop('indeterminate',true);
				}
			});


			$('#roleForm').find('input.cd').on('change',function(){
				var moduleId = $(this).closest('tr').attr('data-moduleid');
				if($(this).prop('checked')){
					var selectedCDcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cd-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cd-count',parseInt(selectedCDcount)+1);
				}else{
					var selectedCDcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cd-count');
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cd-count',parseInt(selectedCDcount)-1);
				}
				var childLength = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('child-length');
				var selectedCDcount = $('tr.parent-row[data-moduleid="'+moduleId+'"]').attr('selected-cd-count');
				
				if(parseInt(selectedCDcount)==0){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pd').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pd').prop('checked',false);
				}else if(parseInt(childLength)==parseInt(selectedCDcount)){
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pd').prop('indeterminate',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pd').prop('checked',true);
				}else{
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pd').prop('checked',false);
					$('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pd').prop('indeterminate',true);
				}

				var dLength = $('input.checkbox-d').length;
				var dCheckedLength = $('input.checkbox-d:checked').length;

				if(dCheckedLength==0){
					$('#checkBoxDall').prop('checked',false);
					$('#checkBoxDall').prop('indeterminate',false);
				}else if(dLength==dCheckedLength){
					$('#checkBoxDall').prop('indeterminate',false);
					$('#checkBoxDall').prop('checked',true);
				}else if(dCheckedLength>0){
					$('#checkBoxDall').prop('checked',false);
					$('#checkBoxDall').prop('indeterminate',true);
				}
			});

			$('#checkBoxVall').on('change',function(){
				if($(this).prop('checked')){
					$('#table>tbody').find('input.pv').prop('checked',true);
					$('#table>tbody').find('input.cv').prop('checked',true);
				}else{
					$('#table>tbody').find('input.pv').prop('checked',false);
					$('#table>tbody').find('input.cv').prop('checked',false);
				}
			});

			$('#checkBoxAall').on('change',function(){
				if($(this).prop('checked')){
					$('#table>tbody').find('input.pa').prop('checked',true);
					$('#table>tbody').find('input.ca').prop('checked',true);
				}else{
					$('#table>tbody').find('input.pa').prop('checked',false);
					$('#table>tbody').find('input.ca').prop('checked',false);
				}
			});

			$('#checkBoxEall').on('change',function(){
				if($(this).prop('checked')){
					$('#table>tbody').find('input.pe').prop('checked',true);
					$('#table>tbody').find('input.ce').prop('checked',true);
				}else{
					$('#table>tbody').find('input.pe').prop('checked',false);
					$('#table>tbody').find('input.ce').prop('checked',false);
				}
			});

			$('#checkBoxDall').on('change',function(){
				if($(this).prop('checked')){
					$('#table>tbody').find('input.pd').prop('checked',true);
					$('#table>tbody').find('input.cd').prop('checked',true);
				}else{
					$('#table>tbody').find('input.pd').prop('checked',false);
					$('#table>tbody').find('input.cd').prop('checked',false);
				}
			});

			setFormData();
		});

		function setFormData() {
			if($('#roleFlag').val()!='N'){
				var roleJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("role"))%>));
				Object.keys(roleJsonObj).forEach(function(key) {
					$('#roleForm').find('#'+key).val(roleJsonObj[key]).trigger('input');
				});

				$('#checkBoxVall').prop('indeterminate',false);
				$('#checkBoxAall').prop('indeterminate',false);
				$('#checkBoxEall').prop('indeterminate',false);
				$('#checkBoxDall').prop('indeterminate',false);
				$('#checkBoxVall').prop('checked',false);
				$('#checkBoxAall').prop('checked',false);
				$('#checkBoxEall').prop('checked',false);
				$('#checkBoxDall').prop('checked',false);
				$('input.checkbox-v').prop('indeterminate',false);
				$('input.checkbox-a').prop('indeterminate',false);
				$('input.checkbox-e').prop('indeterminate',false);
				$('input.checkbox-d').prop('indeterminate',false);
				$('input.checkbox-v').prop('checked',false);
				$('input.checkbox-a').prop('checked',false);
				$('input.checkbox-e').prop('checked',false);
				$('input.checkbox-d').prop('checked',false);

				$('tr.parent-row').attr('selected-cv-count',0);
				$('tr.parent-row').attr('selected-ca-count',0);
				$('tr.parent-row').attr('selected-ce-count',0);
				$('tr.parent-row').attr('selected-cd-count',0);

				if(roleJsonObj && roleJsonObj.roleMasterRights && roleJsonObj.roleMasterRights.length > 0){
					$.each(roleJsonObj.roleMasterRights,function(i,ob){
						if(ob.menuView){
							if(!$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cv').prop('checked')){
								$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cv').prop('checked',ob.menuView).trigger('change');
							}
						}
						if(ob.menuAdd){
							if(!$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.ca').prop('checked')){
								$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.ca').prop('checked',ob.menuAdd).trigger('change');
							}
						}
						if(ob.menuEdit){
							if(!$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.ce').prop('checked')){
								$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.ce').prop('checked',ob.menuEdit).trigger('change');
							}
						}
						if(ob.menuDelete){
							if(!$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cd').prop('checked')){
								$('tr.child-row[data-menuid="'+ob.menuId+'"]').find('input.custom-control-input.cd').prop('checked',ob.menuDelete).trigger('change');
							}
						}
					});
				}
				
				$('#roleForm').parsley().validate();
			}
		}

		function saveRole(btnObj) {
			var flag = $('#roleFlag').val();
			var roleId = null;

			if (flag == 'N') {
				roleId = 0;
			} else {
				roleId = $('#roleId').val();
			}

			var rrList = [];
			$('#table>tbody').find('tr.child-row').each(function(i,tr){
				if($(tr).find('input.custom-control-input.cv').prop('checked') ||
						$(tr).find('input.custom-control-input.ca').prop('checked') ||
						$(tr).find('input.custom-control-input.ce').prop('checked') ||
						$(tr).find('input.custom-control-input.cd').prop('checked')){
					var rrObj = {};
					var moduleId = $(tr).attr('data-moduleid')
					rrObj.moduleId 		= moduleId;
					rrObj.moduleName 	= $('tr.parent-row[data-moduleid="'+moduleId+'"]').find('.moduleName').text();
					rrObj.moduleView 	= $('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pv').prop('checked');
					rrObj.moduleAdd 	= $('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pa').prop('checked');
					rrObj.moduleEdit 	= $('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pe').prop('checked');
					rrObj.moduleDelete 	= $('tr.parent-row[data-moduleid="'+moduleId+'"]').find('input.custom-control-input.pd').prop('checked');
					rrObj.menuId 		= $(tr).attr('data-menuid');
					rrObj.menuName 		= $(tr).find('.menuName').text();
					rrObj.menuView 		= $(tr).find('input.custom-control-input.cv').prop('checked');
					rrObj.menuAdd 		= $(tr).find('input.custom-control-input.ca').prop('checked');
					rrObj.menuEdit 		= $(tr).find('input.custom-control-input.ce').prop('checked');
					rrObj.menuDelete 	= $(tr).find('input.custom-control-input.cd').prop('checked');
					rrList.push(rrObj);
				}
			});

			var formData = formToJson($('#roleForm'));
			formData["flag"] = flag;
			formData["roleId"] = roleId;
			formData["rrList"] = JSON.stringify(rrList);

			console.log('formData::',formData);

			$.ajax({
				url : '${pageContext.request.contextPath }/app/admin/roleMaster/saveUpdateDeleteRole',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					console.log('resp', resp);
					if (resp.status == "success") {
						clearForm($('#roleForm'));
						$('.roleForm-div').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'
												+ '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '
												+ resp.msg + '</div>')
					} else {
						$('.roleForm-div').find('.alert').remove();
						$('.roleForm-div').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'
												+ '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '
												+ resp.msg + '</div>')
					}
				}
			});
		}

		function clearForm(formObje) {
			var formObj = formObje ? formObje : $('#roleForm');
			console.log('clearForm');
			$('.roleForm-div').find('.alert').remove();
			$('#roleForm').find('input').val('');
			$('#roleForm').find('select').val('');
			$('#roleForm').find('.select2-hidden-accessible').val(null).trigger('change');
			$('#roleForm').find('textarea').val('');
			$('#roleForm').find('input[type="radio"]:first').prop('checked',true);
			$('#roleForm').find('.alert').remove();
			$('#roleForm').find('.select2-hidden-accessible').removeClass('parsley-error');
			$('#roleForm').find('.parsley-error').removeClass('.parsley-error');
			$('#roleForm').find('.parsley-success').removeClass('.parsley-success');
			$('#roleForm').find('.select2-selection').removeClass('.parsley-error');
			$('#roleForm').find('.roleSaveBtn').prop('disabled', true);
			$('#roleForm').find('select').find('option:first').prop('selected',true);

			$('#checkBoxVall').prop('indeterminate',false);
			$('#checkBoxAall').prop('indeterminate',false);
			$('#checkBoxEall').prop('indeterminate',false);
			$('#checkBoxDall').prop('indeterminate',false);
			$('#checkBoxVall').prop('checked',false);
			$('#checkBoxAall').prop('checked',false);
			$('#checkBoxEall').prop('checked',false);
			$('#checkBoxDall').prop('checked',false);
			$('input.checkbox-v').prop('indeterminate',false);
			$('input.checkbox-a').prop('indeterminate',false);
			$('input.checkbox-e').prop('indeterminate',false);
			$('input.checkbox-d').prop('indeterminate',false);
			$('input.checkbox-v').prop('checked',false);
			$('input.checkbox-a').prop('checked',false);
			$('input.checkbox-e').prop('checked',false);
			$('input.checkbox-d').prop('checked',false);

			$('tr.parent-row').attr('selected-cv-count',0);
			$('tr.parent-row').attr('selected-ca-count',0);
			$('tr.parent-row').attr('selected-ce-count',0);
			$('tr.parent-row').attr('selected-cd-count',0);
			
			$('#roleForm').parsley().reset();
		}

		function formToJson(formObj){
			var json = {};
			$(formObj).find('.form-control').each(function(i,o){
				json[$(o).attr('id')] = $(o).val();
			});
			return json;
		}
	</script>
</body>
</html>