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
<style>
.infoTable tr:first-child th:first-child,.infoTable tr:first-child td:first-child{
	border: none;
}
</style>
<link href="${pageContext.request.contextPath }/assets/css/avatarSquare.css" rel="stylesheet">
<div class="contact-content">
	<div class="contact-content-header">
		<nav class="nav">
			<a href="#informationTab" class="nav-link active" data-toggle="tab">
				Doctor Info<span>rmation</span>
			</a>
		</nav>
		<a href="javascript:;" id="contactOptions" class="text-secondary mg-l-auto d-xl-none">
			<i data-feather="more-horizontal"></i>
		</a>
	</div>
	<!-- contact-content-header -->
	<div class="contact-content-body">
		<div class="tab-content">
			<div id="informationTab" class="tab-pane show active pd-15 pd-xl-15">
				<table class="table infoTable">
					<tr>
						<th colspan="4">
							<div class="tx-bold tx-pink tx-14 pd-b-10 pd-t-10">
								<i data-feather="minus"></i> Doctor Personal Information
							</div>
						</th>
						<td colspan="2" style="border: none;">
							<div class="d-flex" style="float: right;">
								<a href="javascript:;" data-contactid="${contact.id }" onclick="loadContactFormEdit(this)" class="btn btn-sm btn-white d-flex align-items-center mg-r-5 editRecordBtn">
									<i data-feather="edit-2"></i><span class="d-none d-sm-inline mg-l-5"> Edit</span>
								</a>
								<a href="javascript:;" data-contactid="${contact.id }" onclick="deleteContact(this)" class="btn btn-sm btn-white d-flex align-items-center deleteRecordBtn">
									<i data-feather="trash"></i><span class="d-none d-sm-inline mg-l-5"> Delete</span>
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<th><b>Doctor name  </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd"><span class="avalue doctFName"></span> <span class="avalue doctMName"></span> <span class="avalue doctLName"></span></td>
						<td colspan="3" rowspan="7" >
							<div style="text-align: center;">
								<div class="avatar-upload" style="margin: auto;">
									<!-- <button type="button" class="btn btn-default avatar-edit" id="avatar-edit-btn">
										<i class="fa fa-pencil-alt"></i>
									</button> -->
									<input type='file' class="hide" id="avatarImageUpload" accept=".png, .jpg, .jpeg" />
									<div class="avatar-preview">
										<div id="avatarImagePreview" style="background-image: url(${pageContext.request.contextPath }/img/avatar.png);"></div>
										<%-- <c:choose>
									<c:when test="${loan.customer.imageString()==''}">
										<div id="avatarImagePreview" style="background-image: url(img/avatar.png);"></div>
									</c:when>
									<c:otherwise>
										<div id="avatarImagePreview" style="background-image: url(${loan.customer.imageString()});"></div>
									</c:otherwise>
									</c:choose> --%>
									</div>
								</div>
								<label for="" class="mg-t-15"></label>
							</div>
						</td>
						<!-- <th><b> : </b></th>
						 -->
					</tr>
					<tr>
						<th><b>Gender </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctGender"></td>
					</tr>
					<tr>
						<th><b>Date Of Birth </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctDob"></td>
					</tr>
					<tr>
						<th><b>Mobile Number </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctMob"></td>
					</tr>
					<tr>
						<th><b>Alternate Mobile Number </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctAltMob"></td>
					</tr>
					<tr>
						<th><b>Marital Status </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctMaritalStatus"></td>
					</tr>
					<tr>
						<th><b>Address </b></th>
						<th class="dotTd">:</th>
						<td colspan="4" class="valueTd avalue doctHomeAddr1"></td>
					</tr>
					<tr class="hide">
						<th><b>Land Line Number </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctHomeLLNo"></td>
					</tr>
					
					<tr class="hide">
						<th><b>Address Line 2 </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd  "><span class="avalue doctHomeAddr2"></span> <span class="avalue doctCity"></span> <span class="avalue doctState"></span> <span class="avalue doctZip"></span></td>
					</tr>
					<tr class="hide">
						<th><b>Education </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctEducation1"></td>
					</tr>
					<tr class="hide">
						<th><b>Occupation </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctOccup"></td>
					</tr>
					
					<tr>
						<th colspan="6">
							<div class="tx-bold tx-pink tx-14 pd-b-10 pd-t-10">
								<i data-feather="minus"></i> Doctor Official Information
							</div>
						</th>
					</tr>
					<tr>
						<th><b>Doctor Code </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctCode"></td>
						<th><b>Doctor Type </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctType"></td>
						
					</tr>
					
					<tr>
						<th><b>Joining Date </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue doctJoinDate"></td>
						<th><b> Department </b></th>
						<th class="dotTd">:</th>
						<td class="valueTd avalue department"></td>
					</tr>
				</table>
			</div>
			<div id="contactLogs" class="tab-pane pd-20 pd-xl-25">
				<div class="d-flex align-items-center justify-content-between mg-b-30">
					<h6 class="tx-15 mg-b-0">Call &amp; Message Logs</h6>
					<a href="javascript:;" class="btn btn-sm btn-white d-flex align-items-center">
						<i class="icon ion-md-time mg-r-5 tx-16 lh--9"></i> Clear History
					</a>
				</div>
			</div>
			<!-- tab-pane -->
		</div>
		<!-- tab-content -->
	</div>
	<!-- contact-content-body -->
	<div class="contact-content-sidebar">
		<div class="clearfix mg-b-25">
			<div id="contactAvatar" class="pos-relative float-left">
				<div class="avatar avatar-xl">
					<span class="avatar-initial rounded-circle bg-gray-700 tx-normal">A</span>
				</div>
				<a href="javascript:;" class="contact-edit-photo" data-toggle="tooltip" title="Upload Photo">
					<i data-feather="edit-2"></i>
				</a>
			</div>
		</div>
		<h5 id="contactName" class="tx-18 tx-xl-20 mg-b-5">${doctor.doctFName }${doctor.doctLName }</h5>
		<p class="tx-13 tx-lg-12 tx-xl-13 tx-color-03 mg-b-20">${doctor.doctJobPost }- ${doctor.doctCompany }</p>
		<nav class="contact-call-nav mg-b-20">
			<a href="javascript:;" class="nav-call" data-toggle="tooltip" title="Make a Phone Call">
				<i data-feather="phone"></i>
			</a>
			<a href="javascript:;" class="nav-video" data-toggle="tooltip" title="Make a Video Call">
				<i data-feather="video"></i>
			</a>
			<a href="javascript:;" class="nav-msg" data-toggle="tooltip" title="Send Message">
				<i data-feather="message-square"></i>
			</a>
		</nav>
		<!-- contact-call-nav -->
		<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Notes</label>
		<p class="tx-13 mg-b-0">${doctor.doctNotes }</p>
		<hr class="mg-y-20">
		<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-15">Options</label>
		<nav class="nav flex-column contact-content-nav mg-b-25">
			<a href="javascript:;" class="nav-link">
				<i data-feather="share"></i> Share this Doctor
			</a>
			<a href="javascript:;" class="nav-link">
				<i data-feather="star"></i> Add to Favorites
			</a>
			<a href="javascript:;" class="nav-link">
				<i data-feather="slash"></i> Block this Doctor
			</a>
		</nav>
	</div>
	<!-- contact-content-sidebar -->
</div>
<script>
	new PerfectScrollbar('.contact-content-body', {
		suppressScrollX : true
	});

	new PerfectScrollbar('.contact-content-sidebar', {
		suppressScrollX : true
	});

	var cName = $(this).find('h6').text();
	$('#doctorName').text(cName);

	var cAvatar = $(this).find('.avatar').clone();

	cAvatar.removeClass(function(index, className) {
		return (className.match(/(^|\s)avatar-\S+/g) || []).join(' ');
	});
	cAvatar.addClass('avatar-xl');

	$('#doctorAvatar .avatar').replaceWith(cAvatar);


	var doctorJsonObj = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(request.getAttribute("doctor"))%>));
	console.log('doctorJsonObj::', doctorJsonObj);
	Object.keys(doctorJsonObj).forEach(function(key) {
		$('#informationTab').find('.avalue.'+key).text(doctorJsonObj[key]);
	});
	if(doctorJsonObj.doctGender=='M'){
		$('#avatarImagePreview').css('background-image','url(${pageContext.request.contextPath }/img/avatar/doctor-m.png)');
	}else{
		$('#avatarImagePreview').css('background-image','url(${pageContext.request.contextPath }/img/avatar/doctor-f.png)');
	}

	function loadDoctorFormEdit(btnObj) {
		$('.loading').removeClass('hide');
		$('.mainContainer').addClass('hide');
		$('.footer').addClass('hide');
		var doctorid = $(btnObj).attr('data-doctorid');
		$.ajax({
			url : "${pageContext.request.contextPath }/app/doctor/doctorMaster/doctorForm",
			async : true,
			data : {
				'flag' : 'E',
				'doctorid' : doctorid
			},
			success : function(resp) {
				$('.mainContainer').empty().html(resp);
				$('.content-body').removeClass('pd-0');
				$('body').removeClass('app-contact');
				$('.mainContainer').removeClass('ht-100p');
				$('#ui-datepicker-div').remove();
				feather.replace();
				setTimeout(function() {
					$('.loading').addClass('hide');
					$('.mainContainer').removeClass('hide');
					$('.footer').removeClass('hide');
				}, 1000);
				$('html,body').animate({
					scrollTop : parseInt($('body').offset().top)
				}, 1000);
			}
		});
	}

	function deleteDoctor(ob) {

	}
</script>