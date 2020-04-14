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
    left: 70%;
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
</style>

</head>
<body>
	<div class="contact-wrapper contact-wrapper-two">
		<div class="contact-navleft">
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
					<span data-toggle="tooltip" title="Contact Labels" data-placement="right"><i data-feather="tag"></i></span>
				</a>
				<a href="#tabExport" class="nav-link" data-toggle="tab">
					<span data-toggle="tooltip" title="Export Contacts" data-placement="right"><i data-feather="upload"></i></span>
				</a>
				<a href="#" class="nav-link">
					<span data-toggle="tooltip" title="Contact Settings" data-placement="right"><i data-feather="settings"></i></span>
				</a>
			</nav>
		</div>
		<!-- contact-navleft -->
		<div class="contact-sidebar">
			<div class="contact-sidebar-header">
				<i data-feather="search"></i>
				<div class="search-form">
					<input type="search" class="form-control" placeholder="Search contacts">
				</div>
				<a href="javascript:;" class="btn btn-xs btn-icon btn-primary addNewBtn" onclick="loadContactForm(this,'N')">
					<span data-toggle="tooltip" title="Add New Contact"><i data-feather="user-plus"></i></span>
				</a>
				<!-- contact-add -->
			</div>
			<!-- contact-sidebar-header -->
			<div class="contact-sidebar-body">
				<div class="tab-content">
					<div id="tabContact" class="tab-pane fade active show">
						<div class="pd-y-20 pd-x-10 contact-list">
							<c:set var="sLetter" value=""></c:set>
							<c:forEach items="${allContacts}" var="contact">
								<c:if test="${sLetter != contact.contStartLatter}">
									<label id="contact${contact.contStartLatter}" class="contact-list-divider">${contact.contStartLatter}</label>
									<c:set var="sLetter" value="${contact.contStartLatter}"></c:set>
								</c:if>
								<div class="media">
									<div class="avatar avatar-sm pointer" data-contactid="${contact.id}" onclick="showContactDetail(this)">
										<span class="avatar-initial rounded-circle bg-gray-700">${contact.contStartLatter}</span>
									</div>
									<div class="media-body mg-l-10 pointer" data-contactid="${contact.id}" onclick="showContactDetail(this)">
										<h6 class="tx-13 mg-b-3">${contact.contFName } ${contact.contLName }</h6>
										<span class="tx-12">${contact.contMob }</span>
									</div>
									<!-- media-body -->
									<nav>
										<c:choose>
											<c:when test="${contact.contFavoriteFlag =='Y'}">
												<a href="javascript:;" title="Remove From Favorite" data-contactid="${contact.id}" onclick="removeFavorite(this)">
													<i data-feather="star" class="icon-fill-primary"></i>
												</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:;" title="Make Favorite" data-contactid="${contact.id}" onclick="makeFavorite(this)">
													<i data-feather="star"></i>
												</a>
											</c:otherwise>
										</c:choose>
										<a href="javascript:;" class="editRecordBtn" title="Edit Contact" data-contactid="${contact.id}" onclick="loadContactForm(this,'E')">
											<i data-feather="edit-2"></i>
										</a>
									</nav>
								</div>
							</c:forEach>
						</div>
						<!-- contact-list -->
					</div>
					<!-- tab-pane -->
					
					<!-- tab-pane -->
					<div id="tabFavorites" class="tab-pane fade">
						<div class="pd-y-20 pd-x-10 contact-list">
							<label class="contact-list-divider">My Favorites</label>
							<c:forEach items="${allContacts}" var="contact">
								<div class="media">
									<div class="avatar avatar-sm pointer" data-contactid="${contact.id}" onclick="showContactDetail(this)">
										<span class="avatar-initial rounded-circle bg-gray-700">${contact.contStartLatter}</span>
									</div>
									<div class="media-body mg-l-10 pointer" data-contactid="${contact.id}" onclick="showContactDetail(this)">
										<h6 class="tx-13 mg-b-3">${contact.contFName } ${contact.contLName }</h6>
										<span class="tx-12">${contact.contMob }</span>
									</div>
									<!-- media-body -->
									<nav>
										<c:choose>
											<c:when test="${contact.contFavoriteFlag =='Y'}">
												<a href="javascript:;" title="Remove From Favorite" data-contactid="${contact.id}" onclick="removeFavorite(this)">
													<i data-feather="star" class="icon-fill-primary"></i>
												</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:;" title="Make Favorite" data-contactid="${contact.id}" onclick="makeFavorite(this)">
													<i data-feather="star"></i>
												</a>
											</c:otherwise>
										</c:choose>
										<a href="javascript:;" class="editRecordBtn" title="Edit Contact" data-contactid="${contact.id}" onclick="loadContactForm(this,'E')">
											<i data-feather="edit-2"></i>
										</a>
									</nav>
								</div>
							</c:forEach>
							<!-- media -->
						</div>
						<!-- contact-list -->
					</div>
					<!-- tab-pane -->
					<div id="tabTags" class="tab-pane fade">
						<div class="pd-y-20 pd-x-10 contact-list">
							<label class="contact-list-divider">My Family</label>
							<c:forEach items="${allContacts}" var="contact">
								<div class="media">
									<div class="avatar avatar-sm pointer" data-contactid="${contact.id}" onclick="showContactDetail(this)">
										<span class="avatar-initial rounded-circle bg-gray-700">${contact.contStartLatter}</span>
									</div>
									<div class="media-body mg-l-10 pointer" data-contactid="${contact.id}" onclick="showContactDetail(this)">
										<h6 class="tx-13 mg-b-3">${contact.contFName } ${contact.contLName }</h6>
										<span class="tx-12">${contact.contMob }</span>
									</div>
									<!-- media-body -->
									<nav>
										<c:choose>
											<c:when test="${contact.contFavoriteFlag =='Y'}">
												<a href="javascript:;" title="Remove From Favorite" data-contactid="${contact.id}" onclick="removeFavorite(this)">
													<i data-feather="star" class="icon-fill-primary"></i>
												</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:;" title="Make Favorite" data-contactid="${contact.id}" onclick="makeFavorite(this)">
													<i data-feather="star"></i>
												</a>
											</c:otherwise>
										</c:choose>
										<a href="javascript:;" class="editRecordBtn" title="Edit Contact" data-contactid="${contact.id}" onclick="loadContactForm(this,'E')">
											<i data-feather="edit-2"></i>
										</a>
									</nav>
								</div>
							</c:forEach>
							<!-- media -->
						</div>
						<!-- contact-list -->
					</div>
					<!-- tab-pane -->
					<div id="tabExport" class="tab-pane fade">
						<div class="pd-y-25 pd-x-20">
							<h6 class="tx-12 tx-semibold tx-spacing-1 tx-uppercase">Export Contacts</h6>
							<p class="tx-13 tx-color-03 mg-b-20">You can export your contacts and import them into other email apps.</p>
							<div class="form-group">
								<label class="tx-13">Which contacts do you want to export?</label>
								<select class="custom-select tx-13">
									<option value="1" selected>All Contacts</option>
									<option value="2">My Favorites</option>
									<option value="3">My Family</option>
									<option value="4">My Friends</option>
									<option value="4">My Officemates</option>
								</select>
							</div>
							<!-- form-group -->
							<button class="btn btn-sm btn-primary">Export</button>
						</div>
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
			<div class="contact-detail-main-div">
			
			</div>
		</div>
		<!-- contact-content -->
	</div>
	<script src="/assets/js/dashforge.contacts.js"></script>
	<script type="text/javascript">
	
		setTimeout(function(){
			$('.content-body').addClass('pd-0');
			$('body').addClass('app-contact');
			$('.mainContainer').addClass('ht-100p');
		},500);

		function showContactDetail(ob){
			$('.media').removeClass('active');
			$('.mini-loading').removeClass('hide');
			$('.contact-detail-main-div').addClass('hide');
			var contactid = $(ob).attr('data-contactid');
			$.ajax({
				  url : "/app/contactBook/contactDetail",
				  async : true,
				  data : {
					  'contactid' : contactid
				  },
				  success : function(resp) {
					  $(ob).addClass('active');
					  $('.contact-detail-main-div').empty().html(resp);
					  feather.replace();
					  setTimeout(function() {
						  if($('a.activeLink').attr('data-addright')=="false"){
							  $('.addNewBtn').addClass('hide');
						  }
						  if($('a.activeLink').attr('data-editright')=="false"){
							  $('.editRecordBtn').addClass('hide');			  
						  }
						  if($('a.activeLink').attr('data-deleteright')=="false"){
							  $('.deleteRecordBtn').addClass('hide');
						  }
						  $('.mini-loading').addClass('hide');
						  $('.contact-detail-main-div').removeClass('hide');
					  }, 500);
					  $('html,body').animate({
						  scrollTop : parseInt($('body').offset().top)
					  }, 500);
				  }
			});
		}


		function loadContactForm(btnObj,flag){
			$('.loading').removeClass('hide');
			$('.mainContainer').addClass('hide');
			$('.footer').addClass('hide');
			var contactid = $(btnObj).attr('data-contactid');
			$.ajax({
				  url : "/app/contactBook/contactForm",
				  async : true,
				  data : {
					  'flag' : flag,
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

		function removeFavorite(ob){
			var contactid = $(ob).attr('data-contactid');
			$.ajax({
				  url : "/app/contactBook/removeFavorite",
				  async : true,
				  data : {
					  'contactid' : contactid
				  },
				  success : function(resp) {
					  if(resp.status=="success"){
						  $(ob).attr('onclick','makeFavorite(this)');
						  $(ob).attr('title','Make Favorite');
						  $(ob).empty().append('<i data-feather="star"></i>');
						  feather.replace();
					  }
				  }
			});
		}

		function makeFavorite(ob){
			var contactid = $(ob).attr('data-contactid');
			$.ajax({
				  url : "/app/contactBook/makeFavorite",
				  async : true,
				  data : {
					  'contactid' : contactid
				  },
				  success : function(resp) {
					  if(resp.status=="success"){
						$(ob).attr('onclick','removeFavorite(this)');
						$(ob).attr('title','Remove From Favorite');
						$(ob).empty().append('<i data-feather="star" class="icon-fill-primary"></i>');
						feather.replace();
					  }
				  }
			});
		}
		
	</script>
</body>
</html>