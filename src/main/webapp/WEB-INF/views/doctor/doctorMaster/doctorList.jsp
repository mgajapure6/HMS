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
.mini-loading {
    position: fixed;
    top: 55%;
    left: 67%;
    margin: -14px 0 0 -42px;
    padding: 10px;
    background: #f8f9fc;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
}

.icon-fill-primary{
	fill: #0158d4; 
	color: #0158d4;
}

.pointer{
	cursor: pointer;
}

.contact-sidebar {
	width: 280px;
    left: 0;
}

.contact-content {
    left: 280px;
}

/* .doct-title {
    position: fixed;
    top: 55%;
    left: 67%;
    margin: -14px 0 0 -42px;
    padding: 10px;
    background: #f8f9fc;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
} */
</style>

</head>
<body>
	<div class="contact-wrapper contact-wrapper-two">
		<div class="contact-navleft hide">
			<nav class="nav flex-column">
				<a href="#tabContact" class="nav-link active" data-toggle="tab">
					<span data-toggle="tooltip" title="All Contacts" data-placement="right"><i data-feather="users"></i></span>
				</a>
				<!-- <a href="#tabPhoneCall" class="nav-link hide" data-toggle="tab">
					<span data-toggle="tooltip" title="Recently Contacted" data-placement="right"><i data-feather="phone-call"></i></span>
				</a> -->
				<a href="#tabFavorites" class="nav-link" data-toggle="tab">
					<span data-toggle="tooltip" title="Favorites" data-placement="right"><i data-feather="star"></i></span>
				</a>
				<a href="#tabTags" class="nav-link" data-toggle="tab">
					<span data-toggle="tooltip" title="Doctor Labels" data-placement="right"><i data-feather="tag"></i></span>
				</a>
				<a href="#tabExport" class="nav-link" data-toggle="tab">
					<span data-toggle="tooltip" title="Export Contacts" data-placement="right"><i data-feather="upload"></i></span>
				</a>
				<a href="#" class="nav-link">
					<span data-toggle="tooltip" title="Doctor Settings" data-placement="right"><i data-feather="settings"></i></span>
				</a>
			</nav>
		</div>
		<!-- contact-navleft -->
		<div class="contact-sidebar">
			<div class="contact-sidebar-header">
				<i data-feather="search"></i>
				<div class="search-form">
					<input type="search" class="form-control" placeholder="Search doctors">
				</div>
				<a href="javascript:;" class="btn btn-xs btn-icon btn-primary addNewBtn" onclick="loadDoctorForm(this,'N')">
					<span data-toggle="tooltip" title="Add New Doctor"><i data-feather="user-plus"></i></span>
				</a>
				<!-- contact-add -->
			</div>
			<!-- contact-sidebar-header -->
			<div class="contact-sidebar-body">
				<div class="tab-content">
					<div id="tabContact" class="tab-pane fade active show">
						<div class="pd-y-20 pd-x-10 contact-list">
							<c:set var="sLetter" value=""></c:set>
							<c:forEach items="${doctors}" var="doct">
								<c:if test="${sLetter != doct.doctStartLatter}">
									<label id="doct${doct.doctStartLatter}" class="contact-list-divider">${doct.doctStartLatter}</label>
									<c:set var="sLetter" value="${doct.doctStartLatter}"></c:set>
								</c:if>
								<div class="media">
									<div class="avatar avatar-sm pointer" data-doctorid="${doct.id}" onclick="showContactDetail(this)">
										<span class="avatar-initial rounded-circle bg-gray-700">${doct.doctStartLatter}</span>
									</div>
									<div class="media-body mg-l-10 pointer" data-doctorid="${doct.id}" onclick="showContactDetail(this)">
										<h6 class="tx-13 mg-b-3">${doct.doctFName } ${doct.doctLName }</h6>
										<span class="tx-12">${doct.doctMob }</span>
									</div>
									<!-- media-body -->
									<nav>
										<a href="javascript:;" class="editRecordBtn" title="Edit Doctor" data-doctorid="${doct.id}" onclick="loadDoctorForm(this,'E')">
											<i data-feather="edit-2"></i>
										</a>
									</nav>
								</div>
							</c:forEach>
						</div>
						<!-- contact-list -->
					</div>
					<!-- tab-pane -->
				</div>
				<!-- tab-content -->
			</div>
			<!-- contact-sidebar-body -->
		</div>
		<!-- contact-sidebar -->
		<div class="contact-detail-side">
			<div class="mini-loading hide">
				<div class="loading-dot"></div>
				<div class="loading-dot"></div>
				<div class="loading-dot"></div>
				<div class="loading-dot"></div>
			</div>
			<div class="doctor-detail-main-div">
				<div class="doct-title doct-title h1 text-muted">Doctor Information Section</div>
			</div>
		</div>
		<!-- contact-content -->
	</div>
	<script src="${pageContext.request.contextPath }/assets/js/dashforge.contacts.js"></script>
	<script type="text/javascript">
	
		setTimeout(function(){
			$('.content-body').addClass('pd-0');
			$('body').addClass('app-contact');
			$('.mainContainer').addClass('ht-100p');
		},500);

		function showContactDetail(ob){
			$('.media').removeClass('active');
			$('.mini-loading').removeClass('hide');
			$('.doctor-detail-main-div').addClass('hide');
			var doctorid = $(ob).attr('data-doctorid');
			$.ajax({
				  url : "${pageContext.request.contextPath }/app/doctor/doctorMaster/doctorMasterDetail",
				  async : true,
				  data : {
					  'doctorid' : doctorid
				  },
				  success : function(resp) {
					  $(ob).addClass('active');
					  $('.doctor-detail-main-div').empty().html(resp);
					  feather.replace();
					  setTimeout(function() {
						  if($('.nav-item.menuLi>a.activeLink').attr('data-addright')=="false"){
							  $('.addNewBtn').addClass('hide');
						  }
						  if($('.nav-item.menuLi>a.activeLink').attr('data-editright')=="false"){
							  $('.editRecordBtn').addClass('hide');				  
						  }
						  if($('.nav-item.menuLi>a.activeLink').attr('data-deleteright')=="false"){
							  $('.deleteRecordBtn').addClass('hide');  
						  }
						  $('.mini-loading').addClass('hide');
						  $('.doctor-detail-main-div').removeClass('hide');
					  }, 500);
					  $('html,body').animate({
						  scrollTop : parseInt($('body').offset().top)
					  }, 500);
				  }
			});
		}


		function loadDoctorForm(btnObj,flag){
			$('.loading').removeClass('hide');
			$('.mainContainer').addClass('hide');
			$('.footer').addClass('hide');
			var doctorid = $(btnObj).attr('data-doctorid');
			$.ajax({
				  url : "${pageContext.request.contextPath }/app/doctor/doctorMaster/doctorMasterFrom",
				  async : true,
				  data : {
					  'flag' : flag,
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

		$('.doct-title').css({
	        'position' : 'absolute',
	        'left' : '50%',
	        'top' : '50%',
	        'margin-left' : function() {return -$(this).outerWidth()/2},
	        'margin-top' : function() {return -$(this).outerHeight()/2}
	    });
	</script>
</body>
</html>