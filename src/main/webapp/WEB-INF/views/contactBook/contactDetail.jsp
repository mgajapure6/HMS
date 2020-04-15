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

<div class="contact-content">
	<div class="contact-content-header">
		<nav class="nav">
			<a href="#contactInformation" class="nav-link active" data-toggle="tab">
				Contact Info<span>rmation</span>
			</a>
			<a href="#contactLogs" class="nav-link" data-toggle="tab">
				<span>Call &amp; Message </span>Logs
			</a>
		</nav>
		<a href="javascript:;" id="contactOptions" class="text-secondary mg-l-auto d-xl-none">
			<i data-feather="more-horizontal"></i>
		</a>
	</div>
	<!-- contact-content-header -->
	<div class="contact-content-body">
		<div class="tab-content">
			<div id="contactInformation" class="tab-pane show active pd-20 pd-xl-25">
				<div class="d-flex align-items-center justify-content-between mg-b-25">
					<h6 class="mg-b-0">Personal Details</h6>
					<div class="d-flex">
						<a href="javascript:;" data-contactid="${contact.id }" onclick="loadContactFormEdit(this)" class="btn btn-sm btn-white d-flex align-items-center mg-r-5 editRecordBtn">
							<i data-feather="edit-2"></i><span class="d-none d-sm-inline mg-l-5"> Edit</span>
						</a>
						<a href="javascript:;" data-contactid="${contact.id }" onclick="deleteContact(this)" class="btn btn-sm btn-white d-flex align-items-center deleteRecordBtn">
							<i data-feather="trash"></i><span class="d-none d-sm-inline mg-l-5"> Delete</span>
						</a>
					</div>
				</div>
				<div class="row">
					<div class="col-6 col-sm">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">First Name</label>
						<p class="mg-b-0">${contact.contFName }</p>
					</div>
					<!-- col -->
					<div class="col-6 col-sm">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Middle Name</label>
						<p class="mg-b-0">${contact.contMName == null ? '-' : contact.contMName }</p>
					</div>
					<!-- col -->
					<div class="col-sm mg-t-20 mg-sm-t-0">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Last Name</label>
						<p class="mg-b-0">${contact.contLName }</p>
					</div>
					<!-- col -->
					<div class="col-sm mg-t-20 mg-sm-t-0">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Date Of Birth</label>
						<p class="mg-b-0"><fmt:formatDate pattern="dd-MM-yyyy" value="${contact.contDob == null ? '-' : contact.contDob}" /></p>
					</div>
					<!-- col -->
				</div>
				<!-- row -->
				<h6 class="mg-t-40 mg-b-20">Contact Details</h6>
				<div class="row row-sm">
					<div class="col-6 col-sm-4">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Mobile Phone</label>
						<p class="tx-primary tx-rubik mg-b-0">${contact.contMob == null ? '-' : contact.contMob}</p>
					</div>
					<div class="col-6 col-sm-4">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Home Phone</label>
						<p class="tx-primary tx-rubik mg-b-0">${contact.contHomeLLNo == null ? '-' : contact.contHomeLLNo} ${contact.contHomeMob== null ? '' : ', '} ${contact.contHomeMob== null ? '' : contact.contHomeMob } </p>
					</div>
					<div class="col-6 col-sm-4 mg-t-20 mg-sm-t-0">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Work Phone</label>
						<p class="tx-primary tx-rubik mg-b-0">${contact.contWorkLLNo == null ? '-' : contact.contWorkLLNo}</p>
					</div>
					<div class="col-sm-4 mg-t-20 mg-sm-t-30">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Email Address</label>
						<p class="tx-primary mg-b-0">${contact.contEmail == null ? '-' : contact.contEmail}</p>
					</div>
					<div class="col-sm-4 mg-t-20 mg-sm-t-30">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Company</label>
						<p class="mg-b-0">${contact.contCompany == null ? '-' : contact.contCompany}</p>
					</div>
					<div class="col-sm-4 mg-t-20 mg-sm-t-30">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Job Position</label>
						<p class="mg-b-0">${contact.contJobPost == null ? '-' : contact.contJobPost}</p>
					</div>
					<div class="col-sm-6 mg-t-20 mg-sm-t-30">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Home Address</label>
						<p class="mg-b-0">
							${contact.contHomeAddr == null ? '-' : contact.contHomeAddr}
						</p>
					</div>
					<div class="col-sm-6 mg-t-20 mg-sm-t-30">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Work Address</label>
						<p class="mg-b-0">
							${contact.contWorkAddr == null ? '-' : contact.contWorkAddr}
						</p>
					</div>
					<div class="col-sm-6 mg-t-20 mg-sm-t-30">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Personal Website</label>
						<p class="tx-primary mg-b-0">${contact.contPersonalWeb == null ? '-' : contact.contPersonalWeb}</p>
					</div>
					<div class="col-sm-6 mg-t-20 mg-sm-t-30">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Social Profiles</label>
						<nav class="nav nav-social">
							<a href="${contact.contFbLink }" class="nav-link" target="_blank">
								<i data-feather="facebook"></i>
							</a>
							<a href="${contact.contTwitLink }" class="nav-link" target="_blank">
								<i data-feather="twitter"></i>
							</a>
							<a href="${contact.contInstaLink }" class="nav-link" target="_blank">
								<i data-feather="instagram"></i>
							</a>
							<a href="${contact.contOtherLink }" class="nav-link" target="_blank">
								<i data-feather="github"></i>
							</a>
						</nav>
					</div>
					<!-- col -->
					<div class="col-sm mg-t-20 mg-sm-t-30">
						<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-10">Notes</label>
						<p class="tx-13 mg-b-0">${contact.contNotes == null ? '-' : contact.contNotes}</p>
					</div>
				</div>
				<!-- row -->
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
		<h5 id="contactName" class="tx-18 tx-xl-20 mg-b-5">${contact.contFName } ${contact.contLName }</h5>
		<p class="tx-13 tx-lg-12 tx-xl-13 tx-color-03 mg-b-20">${contact.contJobPost } - ${contact.contCompany }</p>
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
		<p class="tx-13 mg-b-0">${contact.contNotes }</p>
		<hr class="mg-y-20">
		<label class="tx-10 tx-medium tx-spacing-1 tx-color-03 tx-uppercase tx-sans mg-b-15">Options</label>
		<nav class="nav flex-column contact-content-nav mg-b-25">
			<a href="javascript:;" class="nav-link">
				<i data-feather="share"></i> Share this Contact
			</a>
			<a href="javascript:;" class="nav-link">
				<i data-feather="star"></i> Add to Favorites
			</a>
			<a href="javascript:;" class="nav-link">
				<i data-feather="slash"></i> Block this Contact
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
	    suppressScrollX: true
	});
	
	var cName = $(this).find('h6').text();
    $('#contactName').text(cName);

    var cAvatar = $(this).find('.avatar').clone();

    cAvatar.removeClass (function (index, className) {
      return (className.match (/(^|\s)avatar-\S+/g) || []).join(' ');
    });
    cAvatar.addClass('avatar-xl');

    $('#contactAvatar .avatar').replaceWith(cAvatar);


    function loadContactFormEdit(btnObj){
		$('.loading').removeClass('hide');
		$('.mainContainer').addClass('hide');
		$('.footer').addClass('hide');
		var contactid = $(btnObj).attr('data-contactid');
		$.ajax({
			  url : "${pageContext.request.contextPath }/app/contactBook/contactForm",
			  async : true,
			  data : {
				  'flag' : 'E',
				  'contactid' : contactid
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

	function deleteContact(ob){

	}
</script>