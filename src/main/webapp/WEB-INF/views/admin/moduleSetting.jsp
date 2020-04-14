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
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="#">Admin</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">Module Setting</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Module Setting</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 listToFormBtn">
				<i class="fa fa-plus"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Add new module</span>
			</button>
		</div>
	</div>
	<div data-label="Module Form" class="df-example moduleForm-div hide">
		<form id="moduleForm">
			<input type="hidden" class="moduleId" value="0">
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label mandlabel">Module name </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="moduleName" placeholder="Module name" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character. ">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Module name ol </label>
				<div class="col-sm-10">
					<input type="text" class="form-control mandatory" id="moduleNameOl" placeholder="Module name other language">
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
				<label class="col-form-label col-sm-2 pt-0"></label>
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary moduleSaveBtn" data-flag="N" onclick="saveModule(this)" disabled>Save Module</button>
					<button type="button" class="btn btn-warning" onclick="clearForm()">Clear</button>
				</div>
			</div>
		</form>
	</div>
	<div data-label="module List" class="moduleTable-div df-example">
		<div class="table-responsive">
			<table class="table mg-b-0" id="moduleListTable">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Module Name</th>
						<th scope="col">Module Name Ol</th>
						<th scope="col">Status</th>
						<th scope="col" class="center">Total Menus</th>
						<th scope="col" class="center">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:set value="0" var="rCount"></c:set>
					<c:forEach items="${allModules}" var="module">
						<c:set value="${rCount + 1}" var="rCount"></c:set>
						<tr>
							<td class="modCount">${rCount}</td>
							<td class="modName">${module.moduleName}</td>
							<td class="modNameOl">${module.moduleNameOl}</td>
							<td class="modStatus">${module.status}<span class="modStatus hide">${module.status}</span></td>
							<td class="modTotMenu center">${fn:length(module.menus)}</td>
							<td class="center">
								<div class="text-center">
									<button type="button" onclick="setFormData(this,'M')" data-moduleid="${module.id}" class="btn btn-success btn-icon btn-sm editRecordBtn">
										<i class="fa fa-pencil-alt" aria-hidden="true"></i>
									</button>
									<button type="button" onclick="setFormData(this,'D')" data-moduleid="${module.id}" class="btn btn-danger btn-icon btn-sm deleteRecordBtn">
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

		$('#moduleListTable').DataTable({
			language : {
				searchPlaceholder : 'Search...',
				sSearch : '',
				lengthMenu : '_MENU_ items/page',
			}
		});

		
		$('.listToFormBtn').on('click', function() {
			var that = $(this);
			if ($('.moduleTable-div').hasClass('hide')) {
				if (needPageReload) {
					reloadPage();
				} else {
					needPageReload = false;
					$(that).find('.fa').toggleClass('hide');
					$(that).find('.spinIcon').toggleClass('hide');
					setTimeout(function() {
						$('.moduleTable-div').removeClass('hide');
						$('.moduleForm-div').addClass('hide');
						$(that).find('span.title').text('Add new module');
						$(that).find('.fa').toggleClass('hide');
						$(that).find('.spinIcon').toggleClass('hide');
					}, 500);
				}
			} else {
				clearForm();
				$(that).find('.fa').toggleClass('hide');
				$(that).find('.spinIcon').toggleClass('hide');
				setTimeout(function() {
					$('.moduleTable-div').addClass('hide');
					$('.moduleForm-div').removeClass('hide');
					$(that).find('span.title').text('All modules');
					$(that).find('.fa').toggleClass('hide');
					$(that).find('.spinIcon').toggleClass('hide');
				}, 500);
			}

		});

		$('#moduleForm')
				.parsley()
				.on(
						'field:validated',
						function() {
							var parsleyFieldLength = $('#moduleForm').find(
									'.mandatory').length;
							var isValidForm = false;
							if ($('#moduleForm').find('.parsley-success').length == parsleyFieldLength) {
								isValidForm = true;
							} else {
								isValidForm = false;
							}
							if (isValidForm) {
								$('.moduleSaveBtn').prop('disabled', false);
							} else {
								$('.moduleSaveBtn').prop('disabled', true);
							}
						}).on('form:submit', function() {
					return false; // Don't submit form 
				});

		function setFormData(btnObj, flg) {
			$('.listToFormBtn').click();
			needPageReload = false;
			$('.moduleForm-div').find('.alert').remove();
			var tr = $(btnObj).closest('tr');
			var modId = $(btnObj).attr('data-moduleid');
			$('#moduleName').val($(tr).find('.modName').text().trim());
			$('#moduleNameOl').val($(tr).find('.modNameOl').text().trim());
			if ($(tr).find('span.modStatus').text() == "E") {
				$('#mStatusE').prop("checked", true);
			} else {
				$('#mStatusD').prop("checked", true);
			}

			$('#moduleForm').find('input.moduleId').val(modId);
			$('#moduleForm').find('.moduleSaveBtn').attr('data-flag', flg);
			$('#moduleForm').parsley().validate();
		}

		function saveModule(btnObj) {
			var flag = $(btnObj).data('flag');
			var moduleId = null;

			if (flag == 'N') {
				moduleId = 0;
			} else {
				moduleId = $('#moduleForm').find('.moduleId').val();
			}

			var formData = {
				'moduleName' : $('#moduleName').val(),
				'moduleNameOl' : $('#moduleNameOl').val(),
				'status' : $('#moduleForm').find(
						'input[name="mStatus"]:checked').val(),
				'moduleId' : moduleId,
				'flag' : flag
			}

			$.ajax({
						url : '/app/admin/moduleMaster/saveUpdateDeleteModule',
						method : 'POST',
						data : formData,
						async : false,
						success : function(resp) {
							console.log('resp', resp);
							if (resp.status == "success") {
								needPageReload = true;
								clearForm($('#moduleForm'));
								$('.moduleForm-div')
										.append(
												'<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'
														+ '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '
														+ resp.msg + '</div>')
							} else {
								needPageReload = false;
								$('.moduleForm-div').find('.alert').remove();
								$('.moduleForm-div')
										.append(
												'<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'
														+ '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '
														+ resp.msg + '</div>')
							}
						}
					});
		}

		function clearForm(formObje) {
			var formObj = formObje ? formObje : $('#moduleForm');
			console.log('clearForm');
			$('.moduleForm-div').find('.alert').remove();
			$('#moduleForm').find('input').val('');
			$('#moduleForm').find('select').val('');
			$('#moduleForm').find('.select2-hidden-accessible').val(null)
					.trigger('change');
			$('#moduleForm').find('textarea').val('');
			$('#mStatusE').val('E');
			$('#mStatusD').val('D');
			$('#moduleForm').find('input[type="radio"]:first').prop('checked',
					true);
			$('#moduleForm').find('.alert').remove();
			$('#moduleForm').find('.select2-hidden-accessible').removeClass(
					'parsley-error');
			$('#moduleForm').find('.parsley-error').removeClass(
					'.parsley-error');
			$('#moduleForm').find('.parsley-success').removeClass(
					'.parsley-success');
			$('#moduleForm').find('.select2-selection').removeClass(
					'.parsley-error');
			$('#moduleForm').find('input.moduleId').val("0"), $('#moduleForm')
					.find('.moduleSaveBtn').attr('data-flag', "N");
			$('#moduleForm').find('.moduleSaveBtn').removeClass('btn-danger')
					.addClass('btn-primary');
			$('#moduleForm').find('.moduleSaveBtn').text('Save Module');
			$('#moduleForm').find('.moduleSaveBtn').prop('disabled', true);
			$('#moduleForm').parsley().reset();
		}
	</script>
</body>
</html>