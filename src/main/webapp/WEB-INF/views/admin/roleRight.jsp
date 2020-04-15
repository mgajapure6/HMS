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
	background-color: #d1e5ff;
}

.table thead th {
	background-color: #398bff !important;
	color: #fff;
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
	<div data-label="Permissions" class="df-example">
		<div id="table-div">
			<table id="table" class="table table-bordered table-hover">
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
				</tbody>
			</table>
		</div>
	</div>
	<script>
		var $table = $('#table');
		
		$.ajax({
			url : '${pageContext.request.contextPath }/json_files/modules.json',
			method : 'GET',
			async : false,
			success : function(resp){
				if(resp && resp.length){
					var tbody = '';
					$.each(resp,function(i,o){
						tbody = tbody + '<tr class="parent-row treegrid-'+(i+1)+'"><td class="hide">'+(i+1)+'</td><td class="">'+o.module_name+'</td><td class="center" index-row="'+(i+1)+'" child-length="'+(o.menu && o.menu.length ? o.menu.length : 0)+'">'+getCheckbox((i+1),'r','pr')+'</td><td class="center" index-row="'+(i+1)+'" child-length="'+(o.menu && o.menu.length ? o.menu.length : 0)+'">'+getCheckbox((i+1),'w','pw')+'</td></tr>';
						if(o.menu){
							$.each(o.menu,function(j,m){
								tbody = tbody + '<tr class="treegrid-'+(i+1)+''+(j+1)+' treegrid-parent-'+(i+1)+'"><td class="hide">'+(i+1)+'-'+(j+1)+'</td><td>'+m.menu_name+'</td><td class="center">'+getCheckbox((i+1)+''+(j+1),'r','cr')+'</td><td class="center">'+getCheckbox((i+1)+''+(j+1),'w','cw')+'</td></tr>';
							});
						}
					});
					$('#table>tbody').empty().append(tbody);
					$('#table').treegrid({
						treeColumn : 1,
					});
				}
			}
		});

		function getCheckbox(index,flag,classes){
			return '<div class="custom-control custom-checkbox">'+
			  '<input type="checkbox" class="custom-control-input checkBox'+index+''+flag+' '+(classes ? classes : '')+'" id="checkBox'+index+''+flag+'">'+
			  '<label class="custom-control-label" for="checkBox'+index+''+flag+'"></label>'+
			'</div>';
		}

		$(function() {
			$(document).find('input.pr').on('change',function(){
				var index = $(this).closest('td').attr('index-row');
				var childLength = $(this).closest('td').attr('child-length');
				console.log('index,childLength::',index,childLength)
				if($(this).prop('checked')){
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cr').prop('checked',true);
				}else{
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cr').prop('checked',false);
				}
			});

			$(document).find('input.pw').on('change',function(){
				var index = $(this).closest('td').attr('index-row');
				var childLength = $(this).closest('td').attr('child-length');
				console.log('index,childLength::',index,childLength)
				if($(this).prop('checked')){
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cw').prop('checked',true);
				}else{
					$('#table>tbody').find('tr.treegrid-parent-'+index).find('input.cw').prop('checked',false);
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


		

		

		/* $(function() {
			$table.bootstrapTable({
				url : '${pageContext.request.contextPath }/json_files/modules.json',
				striped : true,
				//sidePagination : 'server',
				// idField : 'id',
				//showColumns : true,
				columns : [ {
					field : 'module_name',
					title : 'Name',
					formatter : 'nameFormatter'
				}, {
					field : 'status',
					title : 'Status',
					sortable : true,
					align : 'center',
					formatter : 'statusFormatter'
				}, {
					field : 'permissionValue',
					title : 'Permission Value'
				} ],
				treeShowField : 'name',
				parentIdField : 'pid',
				onPostBody : function() {
					var columns = $table.bootstrapTable('getOptions').columns

					if (columns && columns[0][1].visible) {
						$table.treegrid({
							treeColumn : 0,
							onChange : function() {
								$table.bootstrapTable('resetWidth')
							}
						})
					}
				}
			});
		}); */

		function nameFormatter(value, row, index){
			console.log('value, row, index::',value, row, index);
			return value;
		}

		function snFormatter(value, row, index){
			return index+1;
		}

		function typeFormatter(value, row, index) {
			if (value === 'menu') {
				return '菜单'
			}
			if (value === 'button') {
				return '按钮'
			}
			if (value === 'api') {
				return '接口'
			}
			return '-'
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