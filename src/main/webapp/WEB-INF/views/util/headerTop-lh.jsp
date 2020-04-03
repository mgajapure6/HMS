<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
</style>
<header class="navbar navbar-header navbar-header-fixed">
	<a href="#" id="mainMenuOpen" class="burger-menu">
		<i data-feather="menu"></i>
	</a>
	<div class="navbar-brand">
		<a href="#" class="df-logo">
			HM <span>System</span>
		</a>
	</div>
	<!-- navbar-brand -->
	<div id="navbarMenu" class="navbar-menu-wrapper">
		<div class="navbar-menu-header">
			<a href="#" class="df-logo">
				HM <span>System</span>
			</a>
			<a id="mainMenuClose" href="#">
				<i data-feather="x"></i>
			</a>
		</div>
		<!-- navbar-menu-header -->
		<ul class="nav navbar-menu navbar-common">
			<li class="nav-label pd-l-20 pd-lg-l-25 d-lg-none">Main Navigation</li>
			<c:set var="moduleCount" value="0"></c:set>
			<c:set var="moduUnder" value="null"></c:set>
			<c:forEach items="${menu}" var="module">
				<c:set var="moduleCount" value="${moduleCount+1}"></c:set>
				<c:choose>
					<c:when test="${moduUnder=='null'}">
						<li class="moduleLi_${moduleCount} nav-item with-sub moduleLi ">
							<a href="javascript:;" data-page-link="${module.link}" class="nav-link nav-link-new"> ${module.moduleUnder}</a>
							<div class="navbar-menu-sub">
								<div class="d-lg-flex">
									<ul>
										<c:set var="m1Count" value="0"></c:set>
										<c:forEach items="${menu}" var="m1" varStatus="c1">
											<c:set var="m1Count" value="${m1Count+1}"></c:set>
											<c:if test="${m1.moduleUnder == module.moduleUnder}">
												<li class="nav-sub-item">
													<a href="javascript:;" class="m-link_${m1Count} nav-sub-link nav-sub-link-new" data-page-link="${m1.link}">
														<i data-feather="${m1.moduleIcon}"></i>${m1.moduleName}
													</a>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>
						</li>
						<c:set var="moduUnder" value="${module.moduleUnder}"></c:set>
					</c:when>
					<c:when test="${moduUnder!=module.moduleUnder}">
						<li class="moduleLi_${moduleCount} nav-item with-sub moduleLi ">
							<a href="javascript:;" class="nav-link nav-link-new"> ${module.moduleUnder}</a>
							<div class="navbar-menu-sub ${(module.moduleUnder).toLowerCase()}">
								<div class="d-lg-flex">
									<c:choose>
										<c:when test="${(module.moduleUnder).toLowerCase()=='modules'}">
											<div class="flex-fill flexLvl_1">
												<ul class="nav nav-tabs flex-column wd-150 moduleLvl" role="tablist">
													<c:set var="tabCount" value="0"></c:set>
													<c:set var="m1Count" value="0"></c:set>
													<c:forEach items="${menu}" var="mo" varStatus="c1">
														<c:set var="m1Count" value="${m1Count+1}"></c:set>
														<c:if test="${mo.moduleUnder == module.moduleUnder}">
															<c:set var="tabCount" value="${tabCount+1}"></c:set>
															<li class="nav-sub-item">
																<a href="javascript:;" onclick="getModuleSUbMenu(this)" class="m-link_${m1Count} nav-sub-link nav-sub-link-tab nav-sub-link-tab-click" data-parentid="0" data-menuid="0" data-moduleid="${mo.id}" data-menutype="ML_1" data-flexlvl="1">
																	<i data-feather="${mo.moduleIcon}"></i>${mo.moduleName} <i class="fa fa-angle-right mg-l-auto"></i>
																</a>
															</li>
														</c:if>
													</c:forEach>
												</ul>
											</div>
										</c:when>
										<c:when test="${moduUnder!=module.moduleUnder && fn:length(module.subMenus) le 0}">
											<ul>
												<c:set var="m1Count" value="0"></c:set>
												<c:forEach items="${menu}" var="m1" varStatus="c1">
													<c:set var="m1Count" value="${m1Count+1}"></c:set>
													<c:if test="${m1.moduleUnder == module.moduleUnder}">
														<li class="nav-sub-item">
															<a href="javascript:;" class="m-link_${m1Count} nav-sub-link nav-sub-link-new" data-page-link="${m1.link}">
																<i data-feather="${m1.moduleIcon}"></i>${m1.moduleName}
															</a>
														</li>
													</c:if>
												</c:forEach>
											</ul>
										</c:when>
										<c:otherwise>
											<ul>
												<c:set var="m1Count" value="0"></c:set>
												<c:forEach items="${module.subMenus}" var="sm1" varStatus="c1">
													<c:set var="m1Count" value="${m1Count+1}"></c:set>
													<li class="nav-sub-item">
														<a href="javascript:;" data-page-link="${sm1.link}" class="m-link_${m1Count} nav-sub-link nav-sub-link-new">${sm1.menuName}</a>
													</li>
												</c:forEach>
											</ul>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</li>
						<c:set var="moduUnder" value="${module.moduleUnder}"></c:set>
					</c:when>
				</c:choose>
				<%-- <c:if test="${moduUnder=='null' && fn:length(module.subMenus) gt 0}">
					<c:set var="moduUnder" value="${module.moduleUnder}"></c:set>
					<li class="nav-item with-sub"><a href="javascript:;" class="nav-link nav-link-new"> ${module.moduleUnder}</a>
						<div class="navbar-menu-sub">
							<div class="d-lg-flex">
								<c:choose>
									<c:when test="${module.moduleUnder=='Modules'}"></c:when>
									<c:otherwise>
										<ul>
											<c:set var="m1Count" value="0"></c:set>
											<c:forEach items="${module.subMenus}" var="m1" varStatus="c1">
												<c:set var="m1Count" value="${m1Count+1}"></c:set>
												<c:if test="${fn:length(m1.subMenus) le 0}">
													<li class="nav-sub-item nav-sub-item-new">
														<a href="javascript:;" class="nav-sub-link nav-sub-link-new" data-page-link="${m1.link}">
															<i data-feather="bar-chart-2"></i>${m1.menuName}
														</a>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</li>
				</c:if>  --%>
			</c:forEach>
			<!-- <li class="nav-item with-sub"><a href="#" class="nav-link"><i data-feather="pie-chart"></i> Dashboard</a>
				<ul class="navbar-menu-sub">
					<li class="nav-sub-item"><a href="javascript:;" class="l1 nav-sub-link default-link" data-page-link="/dashboard/s"><i data-feather="bar-chart-2"></i>Sales Monitoring</a></li>
					<li class="nav-sub-item"><a href="javascript:;" class="l2 nav-sub-link" data-page-link="/dashboard/w"><i data-feather="bar-chart-2"></i>Website Analytics</a></li>
					<li class="nav-sub-item"><a href="javascript:;" class="l3 nav-sub-link" data-page-link="/dashboard/c"><i data-feather="bar-chart-2"></i>Cryptocurrency</a></li>
					<li class="nav-sub-item"><a href="javascript:;" class="l4 nav-sub-link" data-page-link="/dashboard/h"><i data-feather="bar-chart-2"></i>Helpdesk Management</a></li>
				</ul></li>
			<li class="nav-item with-sub"><a href="#" class="nav-link"><i data-feather="package"></i> Apps</a>
				<ul class="navbar-menu-sub">
					<li class="nav-sub-item"><a href="javascript:;" class="l5 nav-sub-link"><i data-feather="calendar"></i>Calendar</a></li>
					<li class="nav-sub-item"><a href="javascript:;" class="l6 nav-sub-link"><i data-feather="message-square"></i>Chat</a></li>
					<li class="nav-sub-item"><a href="javascript:;" class="l7 nav-sub-link"><i data-feather="users"></i>Contacts</a></li>
					<li class="nav-sub-item"><a href="javascript:;" class="l8 nav-sub-link"><i data-feather="file-text"></i>File Manager</a></li>
					<li class="nav-sub-item"><a href="javascript:;" class="l9 nav-sub-link"><i data-feather="mail"></i>Mail</a></li>
				</ul></li>
			<li class="nav-item with-sub"><a href="#" class="nav-link"><i data-feather="layers"></i> Pages</a>
				<div class="navbar-menu-sub">
					<div class="d-lg-flex">
						<ul>
							<li class="nav-label">Authentication</li>
							<li class="nav-sub-item"><a href="page-signin.html" class="nav-sub-link"><i data-feather="log-in"></i> Sign In</a></li>
							<li class="nav-sub-item"><a href="page-signup.html" class="nav-sub-link"><i data-feather="user-plus"></i> Sign Up</a></li>
							<li class="nav-sub-item"><a href="page-verify.html" class="nav-sub-link"><i data-feather="user-check"></i> Verify Account</a></li>
							<li class="nav-sub-item"><a href="page-forgot.html" class="nav-sub-link"><i data-feather="shield-off"></i> Forgot Password</a></li>
							<li class="nav-label mg-t-20">User Pages</li>
							<li class="nav-sub-item"><a href="page-profile-view.html" class="nav-sub-link"><i data-feather="user"></i> View Profile</a></li>
							<li class="nav-sub-item"><a href="page-connections.html" class="nav-sub-link"><i data-feather="users"></i> Connections</a></li>
							<li class="nav-sub-item"><a href="page-groups.html" class="nav-sub-link"><i data-feather="users"></i> Groups</a></li>
							<li class="nav-sub-item"><a href="page-events.html" class="nav-sub-link"><i data-feather="calendar"></i> Events</a></li>
						</ul>
						<ul>
							<li class="nav-label">Error Pages</li>
							<li class="nav-sub-item"><a href="page-404.html" class="nav-sub-link"><i data-feather="file"></i> 404 Page Not Found</a></li>
							<li class="nav-sub-item"><a href="page-500.html" class="nav-sub-link"><i data-feather="file"></i> 500 Internal Server</a></li>
							<li class="nav-sub-item"><a href="page-503.html" class="nav-sub-link"><i data-feather="file"></i> 503 Service Unavailable</a></li>
							<li class="nav-sub-item"><a href="page-505.html" class="nav-sub-link"><i data-feather="file"></i> 505 Forbidden</a></li>
							<li class="nav-label mg-t-20">Other Pages</li>
							<li class="nav-sub-item"><a href="page-timeline.html" class="nav-sub-link"><i data-feather="file-text"></i> Timeline</a></li>
							<li class="nav-sub-item"><a href="page-pricing.html" class="nav-sub-link"><i data-feather="file-text"></i> Pricing</a></li>
							<li class="nav-sub-item"><a href="page-help-center.html" class="nav-sub-link"><i data-feather="file-text"></i> Help Center</a></li>
							<li class="nav-sub-item"><a href="page-invoice.html" class="nav-sub-link"><i data-feather="file-text"></i> Invoice</a></li>
						</ul>
					</div>
				</div> nav-sub</li>
			<li class="nav-item"><a href="http://themepixels.me/dashforge/components/" class="nav-link"><i data-feather="box"></i> Components</a></li>
			<li class="nav-item"><a href="http://themepixels.me/dashforge/collections/" class="nav-link"><i data-feather="archive"></i> Collections</a></li> -->
		</ul>
		<jsp:include page="asideBody-common.jsp"></jsp:include>
	</div>
	<!-- navbar-menu-wrapper -->
	<div class="navbar-right">
		<a id="navbarSearch" href="#" class="search-link">
			<i data-feather="search"></i>
		</a>
		<div class="dropdown dropdown-message">
			<a href="#" class="dropdown-link new-indicator" data-toggle="dropdown">
				<i data-feather="message-square"></i> <span>5</span>
			</a>
			<div class="dropdown-menu dropdown-menu-right">
				<div class="dropdown-header">New Messages</div>
				<a href="#" class="dropdown-item">
					<div class="media">
						<div class="avatar avatar-sm avatar-online">
							<img src="assets/img/img6.jpg" class="rounded-circle" alt="">
						</div>
						<div class="media-body mg-l-15">
							<strong>Socrates Itumay</strong>
							<p>nam libero tempore cum so...</p>
							<span>Mar 15 12:32pm</span>
						</div>
						<!-- media-body -->
					</div>
					<!-- media -->
				</a>
				<a href="#" class="dropdown-item">
					<div class="media">
						<div class="avatar avatar-sm avatar-online">
							<img src="assets/img/img8.jpg" class="rounded-circle" alt="">
						</div>
						<div class="media-body mg-l-15">
							<strong>Joyce Chua</strong>
							<p>on the other hand we denounce...</p>
							<span>Mar 13 04:16am</span>
						</div>
						<!-- media-body -->
					</div>
					<!-- media -->
				</a>
				<a href="#" class="dropdown-item">
					<div class="media">
						<div class="avatar avatar-sm avatar-online">
							<img src="assets/img/img7.jpg" class="rounded-circle" alt="">
						</div>
						<div class="media-body mg-l-15">
							<strong>Althea Cabardo</strong>
							<p>is there anyone who loves...</p>
							<span>Mar 13 02:56am</span>
						</div>
						<!-- media-body -->
					</div>
					<!-- media -->
				</a>
				<a href="#" class="dropdown-item">
					<div class="media">
						<div class="avatar avatar-sm avatar-online">
							<img src="assets/img/img9.jpg" class="rounded-circle" alt="">
						</div>
						<div class="media-body mg-l-15">
							<strong>Adrian Monino</strong>
							<p>duis aute irure dolor in repre...</p>
							<span>Mar 12 10:40pm</span>
						</div>
						<!-- media-body -->
					</div>
					<!-- media -->
				</a>
				<div class="dropdown-footer">
					<a href="#">View all Messages</a>
				</div>
			</div>
			<!-- dropdown-menu -->
		</div>
		<!-- dropdown -->
		<div class="dropdown dropdown-notification">
			<a href="#" class="dropdown-link new-indicator" data-toggle="dropdown">
				<i data-feather="bell"></i> <span>2</span>
			</a>
			<div class="dropdown-menu dropdown-menu-right">
				<div class="dropdown-header">Notifications</div>
				<a href="#" class="dropdown-item">
					<div class="media">
						<div class="avatar avatar-sm avatar-online">
							<img src="assets/img/img6.jpg" class="rounded-circle" alt="">
						</div>
						<div class="media-body mg-l-15">
							<p>
								Congratulate <strong>Socrates Itumay</strong> for work anniversaries
							</p>
							<span>Mar 15 12:32pm</span>
						</div>
						<!-- media-body -->
					</div>
					<!-- media -->
				</a>
				<a href="#" class="dropdown-item">
					<div class="media">
						<div class="avatar avatar-sm avatar-online">
							<img src="assets/img/img8.jpg" class="rounded-circle" alt="">
						</div>
						<div class="media-body mg-l-15">
							<p>
								<strong>Joyce Chua</strong> just created a new blog post
							</p>
							<span>Mar 13 04:16am</span>
						</div>
						<!-- media-body -->
					</div>
					<!-- media -->
				</a>
				<a href="#" class="dropdown-item">
					<div class="media">
						<div class="avatar avatar-sm avatar-online">
							<img src="assets/img/img7.jpg" class="rounded-circle" alt="">
						</div>
						<div class="media-body mg-l-15">
							<p>
								<strong>Althea Cabardo</strong> just created a new blog post
							</p>
							<span>Mar 13 02:56am</span>
						</div>
						<!-- media-body -->
					</div>
					<!-- media -->
				</a>
				<a href="#" class="dropdown-item">
					<div class="media">
						<div class="avatar avatar-sm avatar-online">
							<img src="assets/img/img9.jpg" class="rounded-circle" alt="">
						</div>
						<div class="media-body mg-l-15">
							<p>
								<strong>Adrian Monino</strong> added new comment on your photo
							</p>
							<span>Mar 12 10:40pm</span>
						</div>
						<!-- media-body -->
					</div>
					<!-- media -->
				</a>
				<div class="dropdown-footer">
					<a href="#">View all Notifications</a>
				</div>
			</div>
			<!-- dropdown-menu -->
		</div>
		<!-- dropdown -->
		<div class="dropdown dropdown-profile">
			<a href="#" class="dropdown-link" data-toggle="dropdown" data-display="static">
				<div class="avatar avatar-sm">
					<img src="assets/img/img1.png" class="rounded-circle" alt="">
				</div>
			</a>
			<!-- dropdown-link -->
			<div class="dropdown-menu dropdown-menu-right tx-13">
				<div class="avatar avatar-lg mg-b-15">
					<img src="assets/img/img1.png" class="rounded-circle" alt="">
				</div>
				<h6 class="tx-semibold mg-b-5">Katherine Pechon</h6>
				<p class="mg-b-25 tx-12 tx-color-03">Administrator</p>
				<a href="#" class="dropdown-item">
					<i data-feather="edit-3"></i> Edit Profile
				</a>
				<a href="page-profile-view.html" class="dropdown-item">
					<i data-feather="user"></i> View Profile
				</a>
				<div class="dropdown-divider"></div>
				<a href="page-help-center.html" class="dropdown-item">
					<i data-feather="help-circle"></i> Help Center
				</a>
				<a href="#" class="dropdown-item">
					<i data-feather="life-buoy"></i> Forum
				</a>
				<a href="#" class="dropdown-item">
					<i data-feather="settings"></i> Account Settings
				</a>
				<a href="#" class="dropdown-item">
					<i data-feather="settings"></i> Privacy Settings
				</a>
				<a href="page-signin.html" class="dropdown-item">
					<i data-feather="log-out"></i> Sign Out
				</a>
			</div>
			<!-- dropdown-menu -->
		</div>
		<!-- dropdown -->
	</div>
	<!-- navbar-right -->
	<div class="navbar-search">
		<div class="navbar-search-header">
			<input type="search" class="form-control" placeholder="Type and hit enter to search...">
			<button class="btn">
				<i data-feather="search"></i>
			</button>
			<a id="navbarSearchClose" href="#" class="link-03 mg-l-5 mg-lg-l-10">
				<i data-feather="x"></i>
			</a>
		</div>
		<!-- navbar-search-header -->
		<div class="navbar-search-body">
			<label class="tx-10 tx-medium tx-uppercase tx-spacing-1 tx-color-03 mg-b-10 d-flex align-items-center">Recent Searches</label>
			<ul class="list-unstyled">
				<li>
					<a href="dashboard-one.html">modern dashboard</a>
				</li>
				<li>
					<a href="app-calendar.html">calendar app</a>
				</li>
				<li>
					<a href="http://themepixels.me/dashforge/collections/modal.html">modal examples</a>
				</li>
				<li>
					<a href="http://themepixels.me/dashforge/components/el-avatar.html">avatar</a>
				</li>
			</ul>
			<hr class="mg-y-30 bd-0">
			<label class="tx-10 tx-medium tx-uppercase tx-spacing-1 tx-color-03 mg-b-10 d-flex align-items-center">Search Suggestions</label>
			<ul class="list-unstyled">
				<li>
					<a href="dashboard-one.html">cryptocurrency</a>
				</li>
				<li>
					<a href="app-calendar.html">button groups</a>
				</li>
				<li>
					<a href="http://themepixels.me/dashforge/collections/modal.html">form elements</a>
				</li>
				<li>
					<a href="http://themepixels.me/dashforge/components/el-avatar.html">contact app</a>
				</li>
			</ul>
		</div>
		<!-- navbar-search-body -->
	</div>
	<!-- navbar-search -->
</header>
<!-- navbar -->