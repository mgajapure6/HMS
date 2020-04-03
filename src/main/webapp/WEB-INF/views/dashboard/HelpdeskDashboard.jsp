<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="assets/css/dashforge.dashboard.css">
</head>
<body>
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="#">Dashboard</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">Helpdesk Management</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Welcome to Dashboard</h4>
		</div>
		<div class="d-none d-md-block">
			<button class="btn btn-sm pd-x-15 btn-white btn-uppercase">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-save wd-10 mg-r-5">
					<path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"></path>
					<polyline points="17 21 17 13 7 13 7 21"></polyline>
					<polyline points="7 3 7 8 15 8"></polyline></svg>
				Save
			</button>
			<button class="btn btn-sm pd-x-15 btn-white btn-uppercase mg-l-5">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-share-2 wd-10 mg-r-5">
					<circle cx="18" cy="5" r="3"></circle>
					<circle cx="6" cy="12" r="3"></circle>
					<circle cx="18" cy="19" r="3"></circle>
					<line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line>
					<line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line></svg>
				Share
			</button>
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus wd-10 mg-r-5">
					<line x1="12" y1="5" x2="12" y2="19"></line>
					<line x1="5" y1="12" x2="19" y2="12"></line></svg>
				Add New Ticket
			</button>
		</div>
	</div>
	<div class="row row-xs">
		<div class="col-lg-8">
			<div class="card">
				<div class="card-header d-sm-flex justify-content-between bd-b-0 pd-t-20 pd-b-0">
					<div class="mg-b-10 mg-sm-b-0">
						<h6 class="mg-b-5">Current Ticket Status</h6>
						<p class="tx-12 tx-color-03 mg-b-0">as of 10th to 17th of March 2019</p>
					</div>
					<ul class="list-inline tx-uppercase tx-10 tx-medium tx-spacing-1 tx-color-03 mg-b-0">
						<li class="list-inline-item">
							<span class="d-inline-block wd-7 ht-7 bg-gray-400 rounded-circle mg-r-5"></span> New<span class="d-none d-md-inline"> Tickets</span>
						</li>
						<li class="list-inline-item mg-l-10">
							<span class="d-inline-block wd-7 ht-7 bg-df-2 rounded-circle mg-r-5"></span> Solved<span class="d-none d-md-inline"> Tickets</span>
						</li>
						<li class="list-inline-item mg-l-10">
							<span class="d-inline-block wd-7 ht-7 bg-primary rounded-circle mg-r-5"></span> Open<span class="d-none d-md-inline"> Tickets</span>
						</li>
					</ul>
				</div>
				<div class="card-body">
					<div class="chart-fifteen">
						<div id="flotChart1" class="flot-chart" style="width: 100%; height: 100%;"></div>
					</div>
				</div>
				<!-- card-body -->
				<div class="card-footer pd-y-15 pd-x-20">
					<div class="row row-sm">
						<div class="col-6 col-sm-4 col-md-3 col-lg">
							<h4 class="tx-normal tx-rubik mg-b-10">156</h4>
							<div class="progress ht-2 mg-b-10">
								<div class="progress-bar wd-100p bg-df-2" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<h6 class="tx-uppercase tx-spacing-1 tx-semibold tx-10 tx-color-02 mg-b-2">New Tickets</h6>
							<p class="tx-10 tx-color-03 mg-b-0">
								<span class="tx-medium tx-success">1.2% <i class="icon ion-md-arrow-down"></i></span> than yesterday
							</p>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-lg">
							<h4 class="tx-normal tx-rubik mg-b-10">86</h4>
							<div class="progress ht-2 mg-b-10">
								<div class="progress-bar wd-85p bg-df-2" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<h6 class="tx-uppercase tx-spacing-1 tx-semibold tx-10 tx-color-02 mg-b-2">Solved Tickets</h6>
							<p class="tx-10 tx-color-03 mg-b-0">
								<span class="tx-medium tx-danger">-0.6% <i class="icon ion-md-arrow-down"></i></span> than yesterday
							</p>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-lg mg-t-20 mg-sm-t-0">
							<h4 class="tx-normal tx-rubik mg-b-10">27</h4>
							<div class="progress ht-2 mg-b-10">
								<div class="progress-bar wd-25p bg-df-2" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<h6 class="tx-uppercase tx-spacing-1 tx-semibold tx-10 tx-color-02 mg-b-2">Unresolved</h6>
							<p class="tx-10 tx-color-03 mg-b-0">
								<span class="tx-medium tx-success">0.3% <i class="icon ion-md-arrow-down"></i></span> than yesterday
							</p>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-lg mg-t-20 mg-md-t-0">
							<h4 class="tx-normal tx-rubik mg-b-10">45</h4>
							<div class="progress ht-2 mg-b-10">
								<div class="progress-bar wd-45p bg-df-2" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<h6 class="tx-uppercase tx-spacing-1 tx-semibold tx-10 tx-color-02 mg-b-2">Open Tickets</h6>
							<p class="tx-10 tx-color-03 mg-b-0">
								<span class="tx-medium tx-success">0.3% <i class="icon ion-md-arrow-down"></i></span> than yesterday
							</p>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-lg mg-t-20 mg-lg-t-0">
							<h4 class="tx-normal tx-rubik mg-b-10">30</h4>
							<div class="progress ht-2 mg-b-10">
								<div class="progress-bar wd-30p bg-df-2" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<h6 class="tx-uppercase tx-spacing-1 tx-semibold tx-10 tx-color-02 mg-b-2">Unassigned</h6>
							<p class="tx-10 tx-color-03 mg-b-0">
								<span class="tx-medium tx-success">0.3% <i class="icon ion-md-arrow-down"></i></span> than yesterday
							</p>
						</div>
						<!-- col -->
					</div>
					<!-- row -->
				</div>
				<!-- card-footer -->
			</div>
			<!-- card -->
			<div class="row row-xs mg-t-10">
				<div class="col-md-7">
					<div class="card">
						<div class="card-header pd-b-0 pd-t-20 bd-b-0">
							<h6 class="mg-b-0">Tickets By Request Type</h6>
						</div>
						<!-- card-header -->
						<div class="card-body">
							<div class="chart-seventeen">
								<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
									<div class="chartjs-size-monitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
									</div>
									<div class="chartjs-size-monitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
									</div>
								</div>
								<canvas id="chartBar2" width="395" height="260" class="chartjs-render-monitor" style="display: block; width: 395px; height: 260px;"></canvas>
							</div>
						</div>
						<!-- card-body -->
					</div>
					<!-- card -->
				</div>
				<div class="col-md-5 mg-t-10 mg-md-t-0">
					<div class="card">
						<div class="card-header pd-b-0 pd-t-20 bd-b-0">
							<h6 class="mg-b-0">Customer Satisfaction</h6>
						</div>
						<!-- card-header -->
						<div class="card-body pd-y-10">
							<div class="d-flex align-items-baseline tx-rubik">
								<h1 class="tx-40 lh-1 tx-normal tx-spacing--2 mg-b-5 mg-r-5">9.8</h1>
								<p class="tx-11 tx-color-03 mg-b-0">
									<span class="tx-medium tx-success">1.6% <i class="icon ion-md-arrow-up"></i></span>
								</p>
							</div>
							<h6 class="tx-uppercase tx-spacing-1 tx-semibold tx-10 tx-color-02 mg-b-15">Performance Score</h6>
							<div class="progress bg-transparent op-7 ht-10 mg-b-15">
								<div class="progress-bar bg-primary wd-50p" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-success wd-25p bd-l bd-white" role="progressbar" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-warning wd-5p bd-l bd-white" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-pink wd-5p bd-l bd-white" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-teal wd-10p bd-l bd-white" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
								<div class="progress-bar bg-purple wd-5p bd-l bd-white" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<table class="table-dashboard-two">
								<tbody>
									<tr>
										<td><div class="wd-12 ht-12 rounded-circle bd bd-3 bd-primary"></div></td>
										<td class="tx-medium">Excellent</td>
										<td class="text-right">3,007</td>
										<td class="text-right">50%</td>
									</tr>
									<tr>
										<td><div class="wd-12 ht-12 rounded-circle bd bd-3 bd-success"></div></td>
										<td class="tx-medium">Very Good</td>
										<td class="text-right">1,674</td>
										<td class="text-right">25%</td>
									</tr>
									<tr>
										<td><div class="wd-12 ht-12 rounded-circle bd bd-3 bd-warning"></div></td>
										<td class="tx-medium">Good</td>
										<td class="text-right">125</td>
										<td class="text-right">6%</td>
									</tr>
									<tr>
										<td><div class="wd-12 ht-12 rounded-circle bd bd-3 bd-pink"></div></td>
										<td class="tx-medium">Fair</td>
										<td class="text-right">98</td>
										<td class="text-right">5%</td>
									</tr>
									<tr>
										<td><div class="wd-12 ht-12 rounded-circle bd bd-3 bd-teal"></div></td>
										<td class="tx-medium">Poor</td>
										<td class="text-right">512</td>
										<td class="text-right">10%</td>
									</tr>
									<tr>
										<td><div class="wd-12 ht-12 rounded-circle bd bd-3 bd-purple"></div></td>
										<td class="tx-medium">Very Poor</td>
										<td class="text-right">81</td>
										<td class="text-right">4%</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- card-body -->
					</div>
					<!-- card -->
				</div>
				<div class="col-md-6 mg-t-10">
					<div class="card">
						<div class="card-header pd-b-0 pd-x-20 bd-b-0">
							<div class="d-sm-flex align-items-center justify-content-between">
								<h6 class="mg-b-0">Recent Activities</h6>
								<p class="tx-12 tx-color-03 mg-b-0">Last activity: 2 hours ago</p>
							</div>
						</div>
						<!-- card-header -->
						<div class="card-body pd-20">
							<ul class="activity tx-13">
								<li class="activity-item">
									<div class="activity-icon bg-primary-light tx-primary">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock">
											<circle cx="12" cy="12" r="10"></circle>
											<polyline points="12 6 12 12 16 14"></polyline></svg>
									</div>
									<div class="activity-body">
										<p class="mg-b-2">
											<strong>Louise</strong> added a time entry to the ticket
											<a href="#" class="link-02">
												<strong>Sales Revenue</strong>
											</a>
										</p>
										<small class="tx-color-03">2 hours ago</small>
									</div>
									<!-- activity-body -->
								</li>
								<!-- activity-item -->
								<li class="activity-item">
									<div class="activity-icon bg-success-light tx-success">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-paperclip">
											<path d="M21.44 11.05l-9.19 9.19a6 6 0 0 1-8.49-8.49l9.19-9.19a4 4 0 0 1 5.66 5.66l-9.2 9.19a2 2 0 0 1-2.83-2.83l8.49-8.48"></path></svg>
									</div>
									<div class="activity-body">
										<p class="mg-b-2">
											<strong>Kevin</strong> added new attachment to the ticket
											<a href="#" class="link-01">
												<strong>Software Bug Reporting</strong>
											</a>
										</p>
										<small class="tx-color-03">5 hours ago</small>
									</div>
									<!-- activity-body -->
								</li>
								<!-- activity-item -->
								<li class="activity-item">
									<div class="activity-icon bg-warning-light tx-orange">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-share">
											<path d="M4 12v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8"></path>
											<polyline points="16 6 12 2 8 6"></polyline>
											<line x1="12" y1="2" x2="12" y2="15"></line></svg>
									</div>
									<div class="activity-body">
										<p class="mg-b-2">
											<strong>Natalie</strong> reassigned ticket
											<a href="#" class="link-02">
												<strong>Problem installing software</strong>
											</a>
											to <strong>Katherine</strong>
										</p>
										<small class="tx-color-03">8 hours ago</small>
									</div>
									<!-- activity-body -->
								</li>
								<!-- activity-item -->
								<li class="activity-item">
									<div class="activity-icon bg-pink-light tx-pink">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle">
											<circle cx="12" cy="12" r="10"></circle>
											<line x1="12" y1="8" x2="12" y2="16"></line>
											<line x1="8" y1="12" x2="16" y2="12"></line></svg>
									</div>
									<div class="activity-body">
										<p class="mg-b-2">
											<strong>Katherine</strong> submitted new ticket
											<a href="#" class="link-02">
												<strong>Payment Method</strong>
											</a>
										</p>
										<small class="tx-color-03">Yesterday</small>
									</div>
									<!-- activity-body -->
								</li>
								<!-- activity-item -->
								<li class="activity-item">
									<div class="activity-icon bg-indigo-light tx-indigo">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings">
											<circle cx="12" cy="12" r="3"></circle>
											<path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
									</div>
									<div class="activity-body">
										<p class="mg-b-2">
											<strong>Katherine</strong> changed settings to ticket category
											<a href="#" class="link-02">
												<strong>Payment &amp; Invoice</strong>
											</a>
										</p>
										<small class="tx-color-03">2 days ago</small>
									</div>
									<!-- activity-body -->
								</li>
								<!-- activity-item -->
							</ul>
							<!-- activity -->
						</div>
						<!-- card-body -->
					</div>
					<!-- card -->
				</div>
				<div class="col-md-6 mg-t-10">
					<div class="card">
						<div class="card-header pd-b-0 pd-x-20 bd-b-0">
							<h6 class="mg-b-0">Agent Performance Points</h6>
						</div>
						<!-- card-header -->
						<div class="card-body pd-t-25">
							<div class="media">
								<div class="avatar">
									<img src="../../assets/img/img15.jpg" class="rounded-circle" alt="">
								</div>
								<div class="media-body mg-l-15">
									<h6 class="tx-13 mg-b-2">Katherine Lumaad</h6>
									<p class="tx-color-03 tx-12 mg-b-10">Technical Support</p>
									<div class="progress ht-4 op-7 mg-b-5">
										<div class="progress-bar wd-85p" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<div class="d-flex justify-content-between tx-12">
										<span class="tx-color-03">Executive Level</span> <strong class="tx-medium">12,312 points</strong>
									</div>
								</div>
								<!-- media-body -->
							</div>
							<!-- media -->
							<div class="media mg-t-25">
								<div class="avatar">
									<img src="../../assets/img/img14.jpg" class="rounded-circle" alt="">
								</div>
								<div class="media-body mg-l-15">
									<h6 class="tx-13 mg-b-2">Adrian Monino</h6>
									<p class="tx-color-03 tx-12 mg-b-10">Sales Representative</p>
									<div class="progress ht-4 op-7 mg-b-5">
										<div class="progress-bar bg-success wd-60p" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<div class="d-flex justify-content-between tx-12">
										<span class="tx-color-03">Master Level</span> <strong class="tx-medium">10,044 points</strong>
									</div>
								</div>
								<!-- media-body -->
							</div>
							<!-- media -->
							<div class="media mg-t-25">
								<div class="avatar">
									<img src="../../assets/img/img23.jpg" class="rounded-circle" alt="">
								</div>
								<div class="media-body mg-l-15">
									<h6 class="tx-13 mg-b-2">Rolando Paloso</h6>
									<p class="tx-color-03 tx-12 mg-b-10">Software Support</p>
									<div class="progress ht-4 op-7 mg-b-5">
										<div class="progress-bar bg-indigo wd-45p" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<div class="d-flex justify-content-between tx-12">
										<span class="tx-color-03">Super Elite Level</span> <strong class="tx-medium">7,500 points</strong>
									</div>
								</div>
								<!-- media-body -->
							</div>
							<!-- media -->
							<div class="media mg-t-20">
								<div class="avatar">
									<img src="../../assets/img/img22.jpg" class="rounded-circle" alt="">
								</div>
								<div class="media-body mg-l-15">
									<h6 class="tx-13 mg-b-2">Dyanne Rose Aceron</h6>
									<p class="tx-color-03 tx-12 mg-b-10">Sales Representative</p>
									<div class="progress ht-4 op-7 mg-b-5">
										<div class="progress-bar bg-pink wd-40p" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<div class="d-flex justify-content-between tx-12">
										<span class="tx-color-03">Elite Level</span> <strong class="tx-medium">6,870 points</strong>
									</div>
								</div>
								<!-- media-body -->
							</div>
							<!-- media -->
						</div>
						<!-- card-body -->
					</div>
					<!-- card -->
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- col -->
		<div class="col-lg-4 mg-t-10 mg-lg-t-0">
			<div class="row row-xs">
				<div class="col-12 col-md-6 col-lg-12">
					<div class="card card-body">
						<div class="media d-block d-sm-flex align-items-center">
							<div class="d-inline-block pos-relative">
								<span class="peity-donut" data-peity="{ &quot;fill&quot;: [&quot;#65e0e0&quot;,&quot;#e5e9f2&quot;], &quot;height&quot;: 110, &quot;width&quot;: 110, &quot;innerRadius&quot;: 46 }" style="display: none;">70,30</span>
								<svg class="peity" height="110" width="110">
									<path d="M 55 0 A 55 55 0 1 1 2.691891603766557 71.99593469062211 L 11.25140025042294 69.21478174124758 A 46 46 0 1 0 55 9" data-value="70" fill="#65e0e0"></path>
									<path d="M 2.691891603766557 71.99593469062211 A 55 55 0 0 1 54.99999999999999 0 L 54.99999999999999 9 A 46 46 0 0 0 11.25140025042294 69.21478174124758" data-value="30" fill="#e5e9f2"></path></svg>
								<div class="pos-absolute a-0 d-flex flex-column align-items-center justify-content-center">
									<h3 class="tx-rubik tx-spacing--1 mg-b-0">86%</h3>
									<span class="tx-9 tx-semibold tx-sans tx-color-03 tx-uppercase">Reached</span>
								</div>
							</div>
							<div class="media-body mg-t-20 mg-sm-t-0 mg-sm-l-20">
								<h6 class="mg-b-5">Time to Resolved Complaint</h6>
								<p class="lh-4 tx-12 tx-color-03 mg-b-15">The average time taken to resolve complaints.</p>
								<h3 class="tx-spacing--1 mg-b-0">
									7m:32s
									<small class="tx-13 tx-color-03">/ Goal: 8m:0s</small>
								</h3>
							</div>
							<!-- media-body -->
						</div>
						<!-- media -->
					</div>
				</div>
				<!-- col -->
				<div class="col-12 col-md-6 col-lg-12 mg-t-10 mg-md-t-0 mg-lg-t-10">
					<div class="card card-body">
						<div class="media d-block d-sm-flex align-items-center">
							<div class="d-inline-block pos-relative">
								<span class="peity-donut" data-peity="{ &quot;fill&quot;: [&quot;#69b2f8&quot;,&quot;#e5e9f2&quot;], &quot;height&quot;: 110, &quot;width&quot;: 110, &quot;innerRadius&quot;: 46 }" style="display: none;">69,31</span>
								<svg class="peity" height="110" width="110">
									<path d="M 55 0 A 55 55 0 1 1 3.8622932761461897 75.24685039765731 L 12.230281649140451 71.93372942349521 A 46 46 0 1 0 55 9" data-value="69" fill="#69b2f8"></path>
									<path d="M 3.8622932761461897 75.24685039765731 A 55 55 0 0 1 54.99999999999999 0 L 54.99999999999999 9 A 46 46 0 0 0 12.230281649140451 71.93372942349521" data-value="31" fill="#e5e9f2"></path></svg>
								<div class="pos-absolute a-0 d-flex flex-column align-items-center justify-content-center">
									<h3 class="tx-rubik tx-spacing--1 mg-b-0">69%</h3>
									<span class="tx-9 tx-semibold tx-sans tx-color-03 tx-uppercase">Reached</span>
								</div>
							</div>
							<div class="media-body mg-t-20 mg-sm-t-0 mg-sm-l-20">
								<h6 class="mg-b-5">Average Speed of Answer</h6>
								<p class="lh-4 tx-12 tx-color-03 mg-b-15">Measure how quickly support staff answer incoming calls.</p>
								<h3 class="tx-spacing--1 mg-b-0">
									0m:20s
									<small class="tx-13 tx-color-03">/ Goal: 0m:10s</small>
								</h3>
							</div>
							<!-- media-body -->
						</div>
						<!-- media -->
					</div>
				</div>
				<!-- col -->
				<div class="col-12 col-md-6 col-lg-12 mg-t-10">
					<div class="card">
						<div class="card-header pd-t-20 pd-b-0 bd-b-0 d-flex justify-content-between">
							<h6 class="lh-5 mg-b-0">Complaints Received</h6>
							<a href="#" class="tx-13 link-03">
								This Month <i class="icon ion-ios-arrow-down tx-12"></i>
							</a>
						</div>
						<!-- card-header -->
						<div class="card-body pd-0 pos-relative">
							<div class="pos-absolute t-10 l-20 z-index-10">
								<div class="d-flex align-items-baseline">
									<h1 class="tx-normal tx-rubik mg-b-0 mg-r-5">165</h1>
									<p class="tx-11 tx-color-03 mg-b-0">
										<span class="tx-medium tx-success">0.3% <i class="icon ion-md-arrow-down"></i></span> than last month
									</p>
								</div>
								<p class="tx-12 tx-color-03 wd-60p">The total number of complaints that have been received.</p>
							</div>
							<div class="chart-sixteen">
								<div id="flotChart2" class="flot-chart" style="width: 100%; height: 100%;"></div>
							</div>
						</div>
						<!-- card-body -->
					</div>
					<!-- card -->
				</div>
				<!-- col -->
				<div class="col-12 col-md-6 col-lg-12 mg-t-10">
					<div class="card">
						<div class="card-header pd-t-20 pd-b-0 bd-b-0">
							<h6 class="lh-5 mg-b-5">Overall Rating</h6>
							<p class="tx-12 tx-color-03 mg-b-0">Measures the quality or your support team’s efforts.</p>
						</div>
						<!-- card-header -->
						<div class="card-body pd-0">
							<div class="pd-t-10 pd-b-15 pd-x-20 d-flex align-items-baseline">
								<h1 class="tx-normal tx-rubik mg-b-0 mg-r-5">4.2</h1>
								<div class="tx-18">
									<i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i>
								</div>
							</div>
							<div class="list-group list-group-flush tx-13">
								<div class="list-group-item pd-y-5 pd-x-20 d-flex align-items-center">
									<strong class="tx-12 tx-rubik">5.0</strong>
									<div class="tx-16 mg-l-10">
										<i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i>
									</div>
									<div class="mg-l-auto tx-rubik tx-color-02">4,230</div>
									<div class="mg-l-20 tx-rubik tx-color-03 wd-10p text-right">58%</div>
								</div>
								<div class="list-group-item pd-y-5 pd-x-20 d-flex align-items-center">
									<strong class="tx-12 tx-rubik">4.0</strong>
									<div class="tx-16 mg-l-10">
										<i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i>
									</div>
									<div class="mg-l-auto tx-rubik tx-color-02">1,416</div>
									<div class="mg-l-20 tx-rubik tx-color-03 wd-10p text-right">24%</div>
								</div>
								<div class="list-group-item pd-y-5 pd-x-20 d-flex align-items-center">
									<strong class="tx-12 tx-rubik">3.0</strong>
									<div class="tx-16 mg-l-10">
										<i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i>
									</div>
									<div class="mg-l-auto tx-rubik tx-color-02">980</div>
									<div class="mg-l-20 tx-rubik tx-color-03 wd-10p text-right">16%</div>
								</div>
								<div class="list-group-item pd-y-5 pd-x-20 d-flex align-items-center">
									<strong class="tx-12 tx-rubik">2.0</strong>
									<div class="tx-16 mg-l-10">
										<i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i>
									</div>
									<div class="mg-l-auto tx-rubik tx-color-02">401</div>
									<div class="mg-l-20 tx-rubik tx-color-03 wd-10p text-right">8%</div>
								</div>
								<div class="list-group-item pd-y-5 pd-x-20 d-flex align-items-center bg-transparent">
									<strong class="tx-12 tx-rubik">1.0</strong>
									<div class="tx-16 mg-l-10">
										<i class="icon ion-md-star lh-0 tx-orange"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i> <i class="icon ion-md-star lh-0 tx-gray-300"></i>
									</div>
									<div class="mg-l-auto tx-rubik tx-color-02">798</div>
									<div class="mg-l-20 tx-rubik tx-color-03 wd-10p text-right">12%</div>
								</div>
							</div>
							<!-- list-group -->
						</div>
						<!-- card-body -->
					</div>
					<!-- card -->
				</div>
				<!-- col -->
				<div class="col-12 col-md-6 col-lg-12 mg-t-10">
					<div class="card">
						<div class="card-header d-flex align-items-center justify-content-between">
							<h6 class="mg-b-0">Transaction History</h6>
							<div class="d-flex tx-18">
								<a href="#" class="link-03 lh-0">
									<i class="icon ion-md-refresh"></i>
								</a>
								<a href="#" class="link-03 lh-0 mg-l-10">
									<i class="icon ion-md-more"></i>
								</a>
							</div>
						</div>
						<ul class="list-group list-group-flush tx-13">
							<li class="list-group-item d-flex pd-sm-x-20">
								<div class="avatar d-none d-sm-block">
									<span class="avatar-initial rounded-circle bg-indigo op-5"><i class="icon ion-md-return-left"></i></span>
								</div>
								<div class="pd-sm-l-10">
									<p class="tx-medium mg-b-2">Process refund to #00910</p>
									<small class="tx-12 tx-color-03 mg-b-0">Mar 21, 2019, 1:00pm</small>
								</div>
								<div class="mg-l-auto text-right">
									<p class="tx-medium mg-b-2">-$16.50</p>
									<small class="tx-12 tx-success mg-b-0">Completed</small>
								</div>
							</li>
							<li class="list-group-item d-flex pd-sm-x-20">
								<div class="avatar d-none d-sm-block">
									<span class="avatar-initial rounded-circle bg-orange op-5"><i class="icon ion-md-bus"></i></span>
								</div>
								<div class="pd-sm-l-10">
									<p class="tx-medium mg-b-2">Process delivery to #44333</p>
									<small class="tx-12 tx-color-03 mg-b-0">Mar 20, 2019, 11:40am</small>
								</div>
								<div class="mg-l-auto text-right">
									<p class="tx-medium mg-b-2">3 Items</p>
									<small class="tx-12 tx-info mg-b-0">For pickup</small>
								</div>
							</li>
							<li class="list-group-item d-flex pd-sm-x-20">
								<div class="avatar d-none d-sm-block">
									<span class="avatar-initial rounded-circle bg-teal"><i class="icon ion-md-checkmark"></i></span>
								</div>
								<div class="pd-sm-l-10">
									<p class="tx-medium mg-b-0">Payment from #023328</p>
									<small class="tx-12 tx-color-03 mg-b-0">Mar 20, 2019, 10:30pm</small>
								</div>
								<div class="mg-l-auto text-right">
									<p class="tx-medium mg-b-0">+ $129.50</p>
									<small class="tx-12 tx-success mg-b-0">Completed</small>
								</div>
							</li>
							<li class="list-group-item d-flex pd-sm-x-20">
								<div class="avatar d-none d-sm-block">
									<span class="avatar-initial rounded-circle bg-gray-400"><i class="icon ion-md-close"></i></span>
								</div>
								<div class="pd-sm-l-10">
									<p class="tx-medium mg-b-0">Payment failed from #087651</p>
									<small class="tx-12 tx-color-03 mg-b-0">Mar 19, 2019, 12:54pm</small>
								</div>
								<div class="mg-l-auto text-right">
									<p class="tx-medium mg-b-0">$150.00</p>
									<small class="tx-12 tx-danger mg-b-0">Declined</small>
								</div>
							</li>
						</ul>
						<div class="card-footer text-center tx-13">
							<a href="#" class="link-03">
								View All Transactions <i class="icon ion-md-arrow-down mg-l-5"></i>
							</a>
						</div>
						<!-- card-footer -->
					</div>
					<!-- card -->
				</div>
				<!-- col -->
			</div>
			<!-- row -->
		</div>
		<!-- col -->
	</div>
	<script src="lib/jquery.flot/jquery.flot.js"></script>
	<script src="lib/jquery.flot/jquery.flot.stack.js"></script>
	<script src="lib/jquery.flot/jquery.flot.resize.js"></script>
	<script src="lib/flot.curvedlines/curvedLines.js"></script>
	<script src="lib/peity/jquery.peity.min.js"></script>
	<script src="lib/chart.js/Chart.bundle.min.js"></script>
	<script src="assets/horizontal/js/dashforge.sampledata.js"></script>
	<script>
      $(function(){
        'use strict'

        $.plot('#flotChart1', [{
          data: df2,
          color: '#65e0e0'
        },{
          data: df1,
          color: '#69b2f8'
        },{
          data: df3,
          color: '#0168fa',
          lines: {
            show: true,
            lineWidth: 1.5
          },
          bars: { show: false }
        }], {
          series: {
            shadowSize: 0,
            bars: {
              show: true,
              lineWidth: 0,
              barWidth: .5,
              fill: 1
            }
          },
          grid: {
            color: '#c0ccda',
            borderWidth: 0,
            labelMargin: 10
          },
    			yaxis: {
            show: true,
            max: 90,
            tickSize: 15
          },
    			xaxis: {
            color: 'transparent',
            show: true,
            max: 37,
            ticks: [[0,'Mar 10'],[5,'Mar 11'],[10,'Mar 12'],[15,'Mar 13'],[20,'Mar 14'],[25,'Mar 15'],[30,'Mar 16'],[35,'Mar 17']]
          }
    		});

        // Donut chart
        $('.peity-donut').peity('donut');


        $.plot('#flotChart2', [{
          data: df3,
          color: '#0168fa',
          curvedLines: { apply: true }
        }], {
          series: {
            shadowSize: 0,
            lines: {
              show: true,
              lineWidth: 1.5,
              fill: .05
            }
          },
          grid: {
            borderWidth: 0,
            labelMargin: 0
          },
          yaxis: {
            show: false,
            max: 55
          },
          xaxis: {
            show: true,
            color: 'rgba(131,146,165,.08)',
            min: 48,
            max: 102,
            tickSize: 5
          }
        });
      })

      // Horizontal bar chart
      var ctx2 = document.getElementById('chartBar2').getContext('2d');
      new Chart(ctx2, {
        type: 'horizontalBar',
        data: {
          labels: ['Modification', 'Code Request', 'Feature Request', 'Bug Fix', 'Integration', 'Production'],
          datasets: [{
            data: [90, 60, 50, 95, 50, 60],
            backgroundColor: ['#65e0e0', '#69b2f8','#6fd39b','#f77eb9','#fdb16d','#c693f9']
          },{
            data: [60, 50, 70, 45, 70, 30],
            backgroundColor: '#e5e9f2'
          }]
        },
        options: {
          maintainAspectRatio: false,
          responsive: true,
          legend: {
            display: false,
            labels: {
              display: false
            }
          },
          layout: {
            padding: {
              left: 5
            }
          },
          scales: {
            yAxes: [{
              gridLines: {
                display: false
              },
              barPercentage: 0.5,
              ticks: {
                beginAtZero:true,
                fontSize: 13,
                fontColor: '#182b49',
                fontFamily: 'IBM Plex Sans'
              }
            }],
            xAxes: [{
              gridLines: {
                color: '#e5e9f2'
              },
              ticks: {
                beginAtZero: true,
                fontSize: 10,
                fontColor: '#182b49',
                max: 100
              }
            }]
          }
        }
      });
    </script>
</body>
</html>
