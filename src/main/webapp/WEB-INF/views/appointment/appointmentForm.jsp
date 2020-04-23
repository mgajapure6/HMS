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
	<input type="hidden" value="${lineList.id == null ? 0 : lineList.id}" id="id">
	<input type="hidden" value="${flag}" id="appointmentFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="#">Admin</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Employee' : 'Update Appointment'}</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Appointment' : 'Update Appointment'}</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-danger btn-uppercase mg-l-5 formCancelBtn">
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
			</button>
			<!-- <button type="button" class="btn btn-primary appointmentSaveBtn">Save Employee</button> -->
			<button class="btn btn-sm pd-x-15 btn-success btn-uppercase mg-l-5 appointmentSaveBtn" data-flag="N" onclick="saveAppointment(this)" disabled>
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Save </span>
			</button>
			<button class="btn btn-sm pd-x-15 btn-warning btn-uppercase mg-l-5 formClearBtn" onclick="clearForm()">
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Clear</span>
			</button>
			<!-- <button type="button" class="btn btn-warning" onclick="clearForm()">Clear</button> -->
		</div>
	</div>
	<div data-label="Employee Form" class="df-example appointmentForm-div">
		<form id="appointmentForm">
			<input type="hidden" class="trno" value="0">
			<div class="form-group row">
				<label for="appointment_date" class="col-sm-2 col-form-label">Appointment Date </label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="appointment_date" placeholder="Appointment Date">
				</div>
			</div>
			<div class="form-group row">
				
				<label for="from_time" class="col-sm-2 col-form-label mandlabel">From Time </label>
				<div class="col-sm-4">
					<input type="text" class="form-control mandatory" id="from_time" placeholder="From Time" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character. ">
				</div>
				<label for="to_time" class="col-sm-2 col-form-label mandlabel">To Time </label>
				<div class="col-sm-4">
					<input type="text" class="form-control mandatory" id="to_time" placeholder="To Time" data-parsley-trigger="keyup" data-parsley-minlength="2" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="please enter at least 2 character. ">
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
			
	<div style="text-align:right;">
		<button type="button" class="btn btn-info" onclick="addRow()">Add Entry</button>
	</div>
	<div data-label="appointment table" class="appointmentTable-div df-example">
		<div class="table-responsive">
			<table class="table mg-b-0" id="appointmentEntryTable">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Patient Name</th>
						<th scope="col">Visit Time</th>
						<th scope="col">Visiting Doctor</th>
						<th scope="col">Status</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<!-- table-responsive -->
	</div>
			
		</form>
	</div>
	<script type="text/javascript">
	var doctorList="";
	var statusList="";
	
	 $(function(){
		
		$('#appointment_date').datepicker({
			  dateFormat: 'dd-mm-yy',
			  showOtherMonths: true,
			  selectOtherMonths: true,
			  changeMonth: true,
			  changeYear: true,
		});

		$('#appointment_date').datepicker().on('changeDate', function(e) {
			$('#appointment_date').parsley().validate();
	    });


		/* ----------------Doctor List & Status List---------------------- */
		var doc = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("doctorList"))%>));

		$.each(doc,function(index,value)
		{
			doctorList = doctorList + "<option value='"+doc[index].id+"'>"+doc[index].doctFName+" "+doc[index].doctLName+"</option>";	
		});

		var stat = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("statusList"))%>));

		$.each(stat,function(index,value)
		{
			statusList = statusList + "<option value='"+stat[index].id+"'>"+stat[index].name+"</option>";	
		});
		/* -------------------------------------------------------------- */
		
	}); 
	
		$('.formCancelBtn').on('click', function() {
			reloadPage();
		});
		
		$('#appointmentForm').parsley();

		$('#appointmentForm').parsley().on('field:validated',function() {
			var parsleyFieldLength = $('#appointmentForm').find('.mandatory').length;
			var isValidForm = false;
			if ($('#appointmentForm').find('.parsley-success').length == parsleyFieldLength) {
				isValidForm = true;
			} else {
				isValidForm = false;
			}
			
			if (isValidForm) {
				$('.appointmentSaveBtn').prop('disabled', false);
			} else {
				$('.appointmentSaveBtn').prop('disabled', true);
			}
		}).on('form:submit', function() {
			return false; // Don't submit form 
		});

		setFormData();

		function setFormData() {
			if($('#appointmentFlag').val()!='N'){
				var headJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("headList"))%>));
				console.log('headJsonObj::',headJsonObj);
				$('.appointmentForm-div').find('.alert').remove();
				$('#appointment_date').val(headJsonObj.appointment_date);
				$('#from_time').val(headJsonObj.from_time);
				$('#to_time').val(headJsonObj.to_time);
				$("#type").val(headJsonObj.typeId);
				if (headJsonObj.status == "E") {
					$('#mStatusE').prop("checked", true);
				} else {
					$('#mStatusD').prop("checked", true);
				}
				$('#appointmentForm').find('input.trno').val(headJsonObj.headTrno);
				$('#appointmentForm').find('.appointmentSaveBtn').attr('data-flag', $('#appointmentFlag').val());
				$('#appointmentForm').parsley().validate();
			}
		}
		
		function addRow()
		{
			var rowCount = $("#appointmentEntryTable tr").length;
			
			var row = 	"<tr>" +
						"<input class='form-control' type='text' id ='id"+rowCount+"' hidden/>" +
						"<td><label class='form-label' id ='srno"+rowCount+"'>"+rowCount+"</label></td>" +
						"<td><input class='form-control' type='text' id = 'patientName"+rowCount+"'/></td>" +
						"<td><input class='form-control' type='text' id ='visitTime"+rowCount+"'/></td>" +
						"<td><select class='form-control' id ='doctorId"+rowCount+"'>"+doctorList+"</select></td>" +
						"<td><select class='form-control' id ='statusId"+rowCount+"'>"+statusList+"</select></td>" +
					  "</tr>";
			$("#appointmentEntryTable tbody").append(row);  
		}
		
		function saveAppointment(btnObj) {
			var flag = $('#appointmentFlag').val();
			var trno = null;

			var id = [];
			var srno = [];
			var patientName = [];
			var doctorName = [];
			var doctorId = [];
			var visitTime = [];
			var statusId = [];
			var lineCount = $("#appointmentEntryTable tr").length;

			for(i = 1; i < lineCount; i++)
				{
				id.push($("#id"+i).val());         
				srno.push($("#srno"+i).text());       
				patientName.push($("#patientName"+i).val());
				doctorName.push($("#doctorId"+i).find("option:selected").text()); 
				doctorId.push($("#doctorId"+i).find("option:selected").val());   
				visitTime.push($("#visitTime"+i).val());  
				statusId.push($("#statusId"+i).find("option:selected").val());   
				}
			if (flag == 'N') {
				trno = 0;
			} else {
				trno = $('.trno').val();
			}

			var formData = {
				'flag'				: $(".appointmentSaveBtn").data("flag"),	
				'trno' 				: $('.trno').val(),
				'appointment_date' 	: $('#appointment_date').val(),
				'from_time' 		: $('#from_time').val(),
				'to_time' 			: $('#to_time').val(),
				'status' 			: $('#status').val(),
				'id' 			: id,
				'srno'  		: srno,
				'patientName' 	: patientName,
				'doctorName' 	: doctorName,
				'doctorId' 		: doctorId,
				'visitTime' 	: visitTime,
				'statusId' 		: statusId,
			};

			$.ajax({
				url : '${pageContext.request.contextPath }/app/appointment/appointmentMaster/saveAppointmentDetails',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					console.log('resp', resp);
					if (resp.status == "success") {
						needPageReload = true;
						clearForm($('#appointmentForm'));
						$('.appointmentForm-div').append('<div class="alert alert-solid alert-success d-flex align-items-center mg-b-0" role="alert">'
												+ '<i class="fa fa-check-circle" style="font-size: 22px;margin-right: 10px;"></i> '
												+ resp.msg + '</div>')
					} else {
						needPageReload = false;
						$('.appointmentForm-div').find('.alert').remove();
						$('.appointmentForm-div').append('<div class="alert alert-solid alert-danger d-flex align-items-center mg-b-0" role="alert">'
												+ '<i class="fa fa-times-circle" style="font-size: 22px;margin-right: 10px;"></i> '
												+ resp.msg + '</div>')
					}
				}
			});
		}

		function clearForm(formObje) {
			var formObj = formObje ? formObje : $('#appointmentForm');
			
			$('.appointmentForm-div').find('.alert').remove();
			$('#appointmentForm').find('input').val('');
			$('#appointmentForm').find('select').val('');
			$('#appointmentForm').find('.select2-hidden-accessible').val(null)
					.trigger('change');
			$('#appointmentForm').find('textarea').val('');
			$('#mStatusE').val('E');
			$('#mStatusD').val('D');
			$('#appointmentForm').find('input[type="radio"]:first').prop('checked',
					true);
			$('#appointmentForm').find('.alert').remove();
			$('#appointmentForm').find('.select2-hidden-accessible').removeClass(
					'parsley-error');
			$('#appointmentForm').find('.parsley-error').removeClass(
					'.parsley-error');
			$('#appointmentForm').find('.parsley-success').removeClass(
					'.parsley-success');
			$('#appointmentForm').find('.select2-selection').removeClass(
					'.parsley-error');
			$('#appointmentForm').find('input.trno').val("0"), $('#appointmentForm')
					.find('.appointmentSaveBtn').attr('data-flag', "N");
			$('#appointmentForm').find('.appointmentSaveBtn').removeClass('btn-danger')
					.addClass('btn-primary');
			$('#appointmentForm').find('.appointmentSaveBtn').text('Save Employee');
			$('#appointmentForm').find('.appointmentSaveBtn').prop('disabled', true);
			$('#appointmentForm').parsley().reset();
		}
	</script>
</body>
</html>