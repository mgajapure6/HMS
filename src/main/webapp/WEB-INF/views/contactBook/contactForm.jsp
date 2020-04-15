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
<html>
<head>
	<style type="text/css">
		.border-t-b{
			border-top: 1px solid #ccc !important; 
			border-bottom: 1px solid #ccc !important; 
		}
		
		.border-b-t{
			border-top: 1px solid #ccc !important; 
			border-bottom: 1px solid #ccc !important; 
		}
	</style>
</head>
<body>
	<input type="hidden" value="${contact.id == null ? 0 : contact.id}" id="contactId">
	<input type="hidden" value="${flag}" id="contactFlag">
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="javascript:;">Contact</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">${flag=='N' ? 'Add New Contact' : 'Update Contact'}</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">${flag=='N' ? 'Add New Contact' : 'Update Contact'}</h4>
		</div>
		<div class="d-md-block">
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5 formCancelBtn">
				<i class="fa fa-times"></i> <span class="spinner-border spinner-border-sm hide spinIcon"></span> <span class="title"> Cancel</span>
			</button>
		</div>
	</div>
	<div data-label="Contact Form" class="df-example contactForm-div">
		<form id="contactForm">
			<table class="table table-borderless">
				<tr>
					<th colspan="6" class="">
						<div class="tx-bold tx-pink tx-14">
							<i data-feather="minus"></i> Personal Information
						</div>
					</th>
				</tr>
				<tr>
					<td class="label mandlabel"><label class="mandlabel">First Name</label></td>
					<td><input type="text" id="contFName" class="form-control  mandatory" placeholder="Enter First Name" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. "></td>
					<td class="label">Middle Name</td>
					<td><input type="text" id="contMName" class="form-control  " placeholder="Enter Middle Name" ></td>
					<td class="label mandlabel"><label class="mandlabel">Last Name</label></td>
					<td><input type="text" id="contLName" class="form-control  mandatory" placeholder="Enter Last Name" required data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-validation-threshold="0" data-parsley-maxlength="100" data-parsley-minlength-message="Enter at least 3 characters. "></td>
				</tr>
				<tr>
					<td class="label">Date Of Birth</td>
					<td><input type="text" id="contDob" class="form-control dateCleave" placeholder="DD-MM-YYYY" ></td>
					<td class="label">Gender</td>
					<td><select id="contGender" class="form-control">
							<option selected value="M">Male</option>
							<option value="F">Female</option>
							<option value="O">Other</option>
						</select></td>
					<td class="label"></td>
					<td></td>
				</tr>
				<tr>
					<th colspan="6" class="">
						<div class="tx-bold tx-pink tx-14">
							<i data-feather="minus"></i> Contact Information
						</div>
					</th>
				</tr>
				<tr>
					<td class="label mandlabel"><label class="mandlabel">Mobile No</label></td>
					<td><input type="text" id="contMob" class="form-control mandatory mobCleave1" placeholder="Enter Mobile No" required data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-validation-threshold="0" data-parsley-maxlength="10"></td>
					<td class="label">What's App No</td>
					<td><input type="text" id="contWhatsupMob" class="form-control mobCleave2" placeholder="Enter What's App No" ></td>
					<td class="label">Alternate Mobile No</td>
					<td><input type="text" id="contAltMob" class="form-control mobCleave3" placeholder="Enter Alternate Mobile No" ></td>
				</tr>
				<tr>
					<td class="label">Home Land Line No</td>
					<td><input type="text" id="contHomeLLNo" class="form-control llCleave1" placeholder="Enter Home Land Line No" ></td>
					<td class="label">Home Mobile No</td>
					<td><input type="text" id="contHomeMob" class="form-control mobCleave4" placeholder="Enter Home Mobile No" ></td>
					<td class="label">Email</td>
					<td><input type="text" id="contEmail" class="form-control" placeholder="Enter Email" ></td>
				</tr>
				<tr>
					<th colspan="6" class="">
						<div class="tx-bold tx-pink tx-14">
							<i data-feather="minus"></i> Work Information
						</div>
					</th>
				</tr>
				<tr>
					<td class="label">Company Name</td>
					<td><input type="text" id="contCompany" class="form-control  " placeholder="Enter Company Name" ></td>
					<td class="label">Job Post</td>
					<td><input type="text" id="contJobPost" class="form-control  " placeholder="Enter Job Post" ></td>
					<td class="label">Work Land Line No</td>
					<td><input type="text" id="contWorkLLNo" class="form-control llCleave2" placeholder="Enter Work Land Line No" ></td>
				</tr>
				<tr>
					<td class="label">Education</td>
					<td><input type="text" id="contEducation" class="form-control  " placeholder="Enter Education" ></td>
					<td class="label">Occupation</td>
					<td><input type="text" id="contOccupation" class="form-control  " placeholder="Enter Occupation" ></td>
					<td class="label"></td>
					<td></td>
				</tr>
				<tr>
					<th colspan="6" class="">
						<div class="tx-bold tx-pink tx-14">
							<i data-feather="minus"></i> Social Information
						</div>
					</th>
				</tr>
				<tr>
					<td class="label">Facebook Profile Link</td>
					<td><input type="text" id="contFbLink" class="form-control  " placeholder="Enter Facebook Profile Link" ></td>
					<td class="label">Twitter Profile Link</td>
					<td><input type="text" id="contTwitLink" class="form-control  " placeholder="Enter Twitter Profile Link" ></td>
					<td class="label">Instagram Profile Link</td>
					<td><input type="text" id="contInstaLink" class="form-control  " placeholder="Enter Instagram Profile Link" ></td>
					<!-- <td class="label">Other Profile Link</td>
					<td><input type="text" id="contOtherLink" class="form-control  " placeholder="Enter " ></td> -->
				</tr>
				<tr>
					<th colspan="6" class="">
						<div class="tx-bold tx-pink tx-14">
							<i data-feather="minus"></i> Address Information
						</div>
					</th>
				</tr>
				<tr>
					<td class="label">Home Address</td>
					<td colspan="2"><input type="text" id="contHomeAddr" class="form-control  " placeholder="Enter Home Address" ></td>
					<td class="label">Work Address</td>
					<td colspan="2"><input type="text" id="contWorkAddr" class="form-control  " placeholder="Enter Work Address" ></td>
				</tr>
				<tr>
					<th colspan="6" class="">
						<div class="tx-bold tx-pink tx-14">
							<i data-feather="minus"></i> Website Information
						</div>
					</th>
				</tr>
				<tr>
					<td class="label">Work Website</td>
					<td colspan="2"><input type="text" id="contWorkWeb" class="form-control  " placeholder="Enter Work Website" ></td>
					<td class="label">Personal Website</td>
					<td colspan="2"><input type="text" id="contPersonalWeb" class="form-control  " placeholder="Enter Personal Website" ></td>
				</tr>
				
				<tr>
					<th colspan="6" class="">
						<div class="tx-bold tx-pink tx-14">
							<i data-feather="minus"></i> Personal Note About Contact
						</div>
					</th>
				</tr>
				<tr>
					<td class="label">Notes</td>
					<td colspan="5"><input type="text" id="contNotes" class="form-control  " placeholder="Enter Notes About Contact" ></td>
				</tr>
				<tr>
					<td class="label"></td>
					<td><button type="button" type="button" class="btn btn-primary contactSave wd-100p mg-t-25" onclick="saveContact(this)" disabled>Save Contact</button></td>
					<td class="label"><button type="button" class="btn btn-warning wd-100p mg-t-25" onclick="clearContactForm()">Clear</button></td>
					<td></td>
					<td class="label"></td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$('.formCancelBtn').on('click', function() {
			reloadPage();
		});

		$('#contDob').datepicker({
			  dateFormat: 'dd-mm-yy',
			  showOtherMonths: true,
			  selectOtherMonths: true,
			  changeMonth: true,
			  changeYear: true,
		});

		$('#contDob').datepicker().on('changeDate', function(e) {
			$('#contDob').parsley().validate();
	    });

		new Cleave('.dateCleave', {
			 date: true,
			 delimiter: '-',
			 datePattern: ['d', 'm', 'Y']
		});

		new Cleave('.mobCleave1', {
        	numeral: true,
        	numeralIntegerScale: 10,
        	numeralPositiveOnly: true,
        	delimiter: ''
        });

		new Cleave('.mobCleave2', {
        	numeral: true,
        	numeralIntegerScale: 10,
        	numeralPositiveOnly: true,
        	delimiter: ''
        });

		new Cleave('.mobCleave3', {
        	numeral: true,
        	numeralIntegerScale: 10,
        	numeralPositiveOnly: true,
        	delimiter: ''
        });

		new Cleave('.mobCleave4', {
        	numeral: true,
        	numeralIntegerScale: 10,
        	numeralPositiveOnly: true,
        	delimiter: ''
        });

		new Cleave('.llCleave1', {
        	numeral: true,
        	numeralIntegerScale: 15,
        	numeralPositiveOnly: true,
        	delimiter: ''
        });

		new Cleave('.llCleave2', {
        	numeral: true,
        	numeralIntegerScale: 15,
        	numeralPositiveOnly: true,
        	delimiter: ''
        });

        $(function(){
        	$('#contactForm').parsley();

    	    $('#contactForm').parsley().on('field:validated', function() {
    		    var parsleyFieldLength = $('#contactForm').find('.mandatory').length;
    		    if ($('#contactForm').find('.parsley-success').length == parsleyFieldLength) {
    		    	$('.contactSave').prop('disabled', false);
    		    } else {
    		    	 $('.contactSave').prop('disabled', true);
    		    }
    	    }).on('form:submit', function() {
    		    return false; // Don't submit form for this demo
    	    });
    	    
        	setFormData();
        });

		function setFormData() {
			if ($('#contactFlag').val() != 'N') {
				var contactJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("contact"))%>));
				console.log('contactJsonObj::', contactJsonObj);
				Object.keys(contactJsonObj).forEach(function(key) {
					$('#contactForm').find('#'+key).val(contactJsonObj[key]).trigger('keyup');
				});
				$('#contactForm').parsley().validate();
			}
		}

		function saveContact(btnObj) {
			var flag = $('#contactFlag').val();
			var contactId = null;

			if (flag == 'N') {
				contactId = 0;
			} else {
				contactId = $('#contactId').val();
			}

			
			var formData = formToJson($('#contactForm'));
			formData["flag"] = flag;
			formData["contactid"] = contactId;

			$.ajax({
				url : '${pageContext.request.contextPath }/app/contactBook/saveUpdateDeleteContact',
				method : 'POST',
				data : formData,
				async : false,
				success : function(resp) {
					console.log('resp', resp);
					if (resp.status == "success") {
						clearContactForm($('#contactForm'));
						$.confirm({
							icon: 'fa fa-check-circle',
						    title: 'Success !',
						    columnClass: 'medium',
						    content: resp.msg,
						    type: 'green',
						    theme: 'bootstrap',
						    animationSpeed: 100,
						    typeAnimated: true,
						    buttons: {
						        Ok: {
						            text: 'Ok',
						            btnClass: 'btn-green',
						            keys: ['enter'],
						            action: function(){
							            
						            }
						        }
						    }
						});
					} else {
						alert(resp.msg,'E')
					}
				}
			});
		}

		function clearContactForm(formObj) {
		    console.log('clearContactForm')
		    $('#contactForm').find('input').val('');
		    $('#contactForm').find('select').val('');
		    $('#contactForm').find('.select2-hidden-accessible').val(null).trigger('change');
		    $('#contactForm').find('textarea').val('');
		    $('#contactForm').find('.alert').remove();
		    $('#contactForm').find('.select2-hidden-accessible').removeClass('parsley-error');
		    $('#contactForm').find('.parsley-error').removeClass('.parsley-error');
		    $('#contactForm').find('.parsley-success').removeClass('.parsley-success');
		    $('#contactForm').find('.select2-selection').removeClass('.parsley-error');
		    $('#contactForm').find('select').find('option:first').prop('selected',true).trigger('change');

		    $('#contactId').val(0);
		    $('#contactFlag').val('N');
		    $('#contactForm').parsley().reset();
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