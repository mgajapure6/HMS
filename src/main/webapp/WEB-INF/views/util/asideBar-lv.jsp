<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.nav-item.show .fa-circle {
	float: left;
	margin-top: 6px;
	margin-right: 10px;
	font-size: 5px;
}

.nav-item.show .fa-angle-right, .nav-item.show .fa-angle-down {
	float: right;
	margin-top: 4px;
}
</style>
<aside class="aside aside-fixed aside-main-new">
	<div class="aside-header">
		<a href="http://themepixels.me/dashforge/index.html" class="aside-logo">
			HM <span>System</span>
		</a>
		<a href="#" class="aside-menu-link">
			<i data-feather="menu"></i> <i data-feather="x"></i>
		</a>
	</div>
	<div class="aside-body">
		<div class="aside-loggedin hide">
			<div class="d-flex align-items-center justify-content-start">
				<a href="#" class="avatar">
					<img src="${pageContext.request.contextPath }/img/avatar.png" class="rounded-circle" alt="">
				</a>
				<div class="aside-alert-link">
					<a href="#" class="new" data-toggle="tooltip" title="You have 2 unread messages">
						<i data-feather="message-square"></i>
					</a>
					<a href="#" class="new" data-toggle="tooltip" title="You have 4 new notifications">
						<i data-feather="bell"></i>
					</a>
					<a href="#" data-toggle="tooltip" title="Sign out">
						<i data-feather="log-out"></i>
					</a>
				</div>
			</div>
			<div class="aside-loggedin-user">
				<a href="#loggedinMenu" class="d-flex align-items-center justify-content-between mg-b-2" data-toggle="collapse">
					<h6 class="tx-semibold mg-b-0">Unkonwn User</h6>
					<i data-feather="chevron-down"></i>
				</a>
				<p class="tx-color-03 tx-12 mg-b-0">Administrator</p>
			</div>
			<div class="collapse" id="loggedinMenu">
				<ul class="nav nav-aside mg-b-0">
					<li class="nav-item">
						<a href="#" class="nav-link">
							<i data-feather="edit"></i> <span>Edit Profile</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link">
							<i data-feather="user"></i> <span>View Profile</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link">
							<i data-feather="settings"></i> <span>Account Settings</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link">
							<i data-feather="help-circle"></i> <span>Help Center</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link">
							<i data-feather="log-out"></i> <span>Sign Out</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- aside-loggedin -->
		<ul class="nav nav-aside navbar-common">
			<c:set var="moduleCount" value="0"></c:set>
			<c:set var="moduleTitle" value="true"></c:set>
			<c:forEach items="${menu}" var="module">
				<c:set var="moduleCount" value="${moduleCount+1}"></c:set>
				<c:choose>
					<c:when test="${fn:contains(module.moduleCssClasses, 'dashboardModule')}">
						<li class="nav-label mg-t-15">DASHBOARDS</li>
						<li class="moduleLi_${moduleCount} moduleLi nav-item with-sub ${module.moduleCssClasses}">
							<a href="javascript:;" class="nav-link ">
								<i data-feather="${module.moduleIcon}"></i> <span>${module.moduleName}</span>
							</a>
							<ul style="padding-left: 18px;">
								<c:set var="m1Count" value="0"></c:set>
								<c:forEach items="${module.menus}" var="m1" varStatus="c1">
									<c:set var="m1Count" value="${m1Count+1}"></c:set>
									<li class="nav-item menuLi" style="display: flex;">
										<a href="javascript:;" class="m-link_${m1Count} nav-link-new ${m1.menuCssClasses}" 
											data-linkcount="${m1Count}" 
											data-viewRight="${m1.viewRight}"
											data-addRight="${m1.addRight}"
											data-editRight="${m1.editRight}"
											data-deleteRight="${m1.delRight}"
											onclick="loadPage(this,'${m1.link}','m-link_${m1Count}','moduleLi_${moduleCount}','${VorH}')">
											<i class="fa fa-minus" style="margin-top: 6px; margin-right: 10px; font-size: 13px;"></i> <span>${m1.menuName}</span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<c:if test="${moduleTitle==true}">
							<li class="nav-label mg-t-25">MODULES</li>
							<c:set var="moduleTitle" value="false"></c:set>
						</c:if>
					
						<li class="moduleLi_${moduleCount} moduleLi nav-item with-sub ${module.moduleCssClasses}">
							<a href="javascript:;" class="nav-link ">
								<i data-feather="${module.moduleIcon}"></i> <span>${module.moduleName}</span>
							</a>
							<ul style="padding-left: 18px;">
								<c:set var="m1Count" value="0"></c:set>
								<c:forEach items="${module.menus}" var="m1" varStatus="c1">
									<c:set var="m1Count" value="${m1Count+1}"></c:set>
									<li class="nav-item menuLi" style="display: flex;">
										<a href="javascript:;" 
											class="m-link_${m1Count} nav-link-new ${m1.menuCssClasses}" 
											data-linkcount="${m1Count}" 
											data-viewRight="${m1.viewRight}"
											data-addRight="${m1.addRight}"
											data-editRight="${m1.editRight}"
											data-deleteRight="${m1.delRight}"
											onclick="loadPage(this,'${m1.link}','m-link_${m1Count}','moduleLi_${moduleCount}','${VorH}')">
											<i class="fa fa-minus" style="margin-top: 6px; margin-right: 10px; font-size: 13px;"></i> <span>${m1.menuName}</span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
	</div>
</aside>