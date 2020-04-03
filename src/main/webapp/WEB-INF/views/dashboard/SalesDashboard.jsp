<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- <link rel="stylesheet" href="assets/css/dashforge.dashboard.css"> -->
<style type="text/css">
</style>
</head>
<body>
	<div class="d-sm-flex align-items-center justify-content-between mg-b-20 mg-lg-b-25 mg-xl-b-30">
		<div>
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb breadcrumb-style1 mg-b-10">
					<li class="breadcrumb-item">
						<a href="#">Dashboard</a>
					</li>
					<li class="breadcrumb-item active" aria-current="page">Sales Monitoring</li>
				</ol>
			</nav>
			<h4 class="mg-b-0 tx-spacing--1">Welcome to Dashboard</h4>
		</div>
		<div class="d-none d-md-block">
			<button class="btn btn-sm pd-x-15 btn-white btn-uppercase">
				<i data-feather="mail" class="wd-10 mg-r-5"></i> Email
			</button>
			<button class="btn btn-sm pd-x-15 btn-white btn-uppercase mg-l-5">
				<i data-feather="printer" class="wd-10 mg-r-5"></i> Print
			</button>
			<button class="btn btn-sm pd-x-15 btn-primary btn-uppercase mg-l-5">
				<i data-feather="file" class="wd-10 mg-r-5"></i> Generate Report
			</button>
		</div>
	</div>
	<div class="row row-xs">
		<div class="col-sm-6 col-lg-3">
			<div class="card card-body">
				<h6 class="tx-uppercase tx-11 tx-spacing-1 tx-color-02 tx-semibold mg-b-8">Conversion Rate</h6>
				<div class="d-flex d-lg-block d-xl-flex align-items-end">
					<h3 class="tx-normal tx-rubik mg-b-0 mg-r-5 lh-1">0.81%</h3>
					<p class="tx-11 tx-color-03 mg-b-0">
						<span class="tx-medium tx-success">1.2% <i class="icon ion-md-arrow-up"></i></span>
					</p>
				</div>
				<div class="chart-three">
					<div id="flotChart3" class="flot-chart ht-30"></div>
				</div>
				<!-- chart-three -->
			</div>
		</div>
		<!-- col -->
		<div class="col-sm-6 col-lg-3 mg-t-10 mg-sm-t-0">
			<div class="card card-body">
				<h6 class="tx-uppercase tx-11 tx-spacing-1 tx-color-02 tx-semibold mg-b-8">Unique Purchases</h6>
				<div class="d-flex d-lg-block d-xl-flex align-items-end">
					<h3 class="tx-normal tx-rubik mg-b-0 mg-r-5 lh-1">3,137</h3>
					<p class="tx-11 tx-color-03 mg-b-0">
						<span class="tx-medium tx-danger">0.7% <i class="icon ion-md-arrow-down"></i></span>
					</p>
				</div>
				<div class="chart-three">
					<div id="flotChart4" class="flot-chart ht-30"></div>
				</div>
				<!-- chart-three -->
			</div>
		</div>
		<!-- col -->
		<div class="col-sm-6 col-lg-3 mg-t-10 mg-lg-t-0">
			<div class="card card-body">
				<h6 class="tx-uppercase tx-11 tx-spacing-1 tx-color-02 tx-semibold mg-b-8">Avg. Order Value</h6>
				<div class="d-flex d-lg-block d-xl-flex align-items-end">
					<h3 class="tx-normal tx-rubik mg-b-0 mg-r-5 lh-1">$306.20</h3>
					<p class="tx-11 tx-color-03 mg-b-0">
						<span class="tx-medium tx-danger">0.3% <i class="icon ion-md-arrow-down"></i></span>
					</p>
				</div>
				<div class="chart-three">
					<div id="flotChart5" class="flot-chart ht-30"></div>
				</div>
				<!-- chart-three -->
			</div>
		</div>
		<!-- col -->
		<div class="col-sm-6 col-lg-3 mg-t-10 mg-lg-t-0">
			<div class="card card-body">
				<h6 class="tx-uppercase tx-11 tx-spacing-1 tx-color-02 tx-semibold mg-b-8">Order Quantity</h6>
				<div class="d-flex d-lg-block d-xl-flex align-items-end">
					<h3 class="tx-normal tx-rubik mg-b-0 mg-r-5 lh-1">1,650</h3>
					<p class="tx-11 tx-color-03 mg-b-0">
						<span class="tx-medium tx-success">2.1% <i class="icon ion-md-arrow-up"></i></span>
					</p>
				</div>
				<div class="chart-three">
					<div id="flotChart6" class="flot-chart ht-30"></div>
				</div>
				<!-- chart-three -->
			</div>
		</div>
		<!-- col -->
		<div class="col-lg-8 col-xl-7 mg-t-10">
			<div class="card">
				<div class="card-header pd-y-20 d-md-flex align-items-center justify-content-between">
					<h6 class="mg-b-0">Recurring Revenue Growth</h6>
					<ul class="list-inline d-flex mg-t-20 mg-sm-t-10 mg-md-t-0 mg-b-0">
						<li class="list-inline-item d-flex align-items-center">
							<span class="d-block wd-10 ht-10 bg-df-1 rounded mg-r-5"></span> <span class="tx-sans tx-uppercase tx-10 tx-medium tx-color-03">Growth Actual</span>
						</li>
						<li class="list-inline-item d-flex align-items-center mg-l-5">
							<span class="d-block wd-10 ht-10 bg-df-2 rounded mg-r-5"></span> <span class="tx-sans tx-uppercase tx-10 tx-medium tx-color-03">Actual</span>
						</li>
						<li class="list-inline-item d-flex align-items-center mg-l-5">
							<span class="d-block wd-10 ht-10 bg-df-3 rounded mg-r-5"></span> <span class="tx-sans tx-uppercase tx-10 tx-medium tx-color-03">Plan</span>
						</li>
					</ul>
				</div>
				<!-- card-header -->
				<div class="card-body pos-relative pd-0">
					<div class="pos-absolute t-20 l-20 wd-xl-100p z-index-10">
						<div class="row">
							<div class="col-sm-5">
								<h3 class="tx-normal tx-rubik tx-spacing--2 mg-b-5">$620,076</h3>
								<h6 class="tx-uppercase tx-11 tx-spacing-1 tx-color-02 tx-semibold mg-b-10">MRR Growth</h6>
								<p class="mg-b-0 tx-12 tx-color-03">
									Measure How Fast You’re Growing Monthly Recurring Revenue.
									<a href="">Learn More</a>
								</p>
							</div>
							<!-- col -->
							<div class="col-sm-5 mg-t-20 mg-sm-t-0">
								<h3 class="tx-normal tx-rubik tx-spacing--2 mg-b-5">$1,200</h3>
								<h6 class="tx-uppercase tx-11 tx-spacing-1 tx-color-02 tx-semibold mg-b-10">Avg. MRR/Customer</h6>
								<p class="mg-b-0 tx-12 tx-color-03">
									The revenue generated per account on a monthly or yearly basis.
									<a href="">Learn More</a>
								</p>
							</div>
							<!-- col -->
						</div>
						<!-- row -->
					</div>
					<div class="chart-one">
						<div id="flotChart" class="flot-chart" style="height: 350px"></div>
					</div>
					<!-- chart-one -->
				</div>
				<!-- card-body -->
			</div>
			<!-- card -->
		</div>
		<div class="col-lg-4 col-xl-5 mg-t-10">
			<div class="card">
				<div class="card-header pd-t-20 pd-b-0 bd-b-0">
					<h6 class="mg-b-5">Account Retention</h6>
					<p class="tx-12 tx-color-03 mg-b-0">Number of customers who have active subscription with you.</p>
				</div>
				<!-- card-header -->
				<div class="card-body pd-20">
					<div class="chart-two mg-b-20">
						<div id="flotChart2" class="flot-chart"></div>
					</div>
					<!-- chart-two -->
					<div class="row">
						<div class="col-sm">
							<h4 class="tx-normal tx-rubik tx-spacing--1 mg-b-5">
								$1,680
								<small>.50</small>
							</h4>
							<p class="tx-11 tx-uppercase tx-spacing-1 tx-semibold mg-b-10 tx-primary">Expansions</p>
							<div class="tx-12 tx-color-03">Customers who have upgraded the level of your products.</div>
						</div>
						<!-- col -->
						<div class="col-sm mg-t-20 mg-sm-t-0">
							<h4 class="tx-normal tx-rubik tx-spacing--1 mg-b-5">
								$1,520
								<small>.00</small>
							</h4>
							<p class="tx-11 tx-uppercase tx-spacing-1 tx-semibold mg-b-10 tx-pink">Cancellations</p>
							<div class="tx-12 tx-color-03">Customers who have ended their subscription.</div>
						</div>
						<!-- col -->
					</div>
					<!-- row -->
				</div>
				<!-- card-body -->
			</div>
			<!-- card -->
		</div>
		<div class="col-md-6 col-xl-4 mg-t-10 order-md-1 order-xl-0">
			<div class="card ht-lg-100p">
				<div class="card-header d-flex align-items-center justify-content-between">
					<h6 class="mg-b-0">Sales Revenue</h6>
					<div class="tx-13 d-flex align-items-center">
						<span class="mg-r-5">Country:</span>
						<a href="" class="d-flex align-items-center link-03 lh-0">
							USA <i class="icon ion-ios-arrow-down mg-l-5"></i>
						</a>
					</div>
				</div>
				<!-- card-header -->
				<div class="card-body pd-0">
					<div class="pd-y-25 pd-x-20">
						<div id="vmap" class="ht-200"></div>
					</div>
					<div class="table-responsive">
						<table class="table table-borderless table-dashboard table-dashboard-one">
							<thead>
								<tr>
									<th class="wd-40">States</th>
									<th class="wd-25 text-right">Orders</th>
									<th class="wd-35 text-right">Earnings</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="tx-medium">California</td>
									<td class="text-right">12,201</td>
									<td class="text-right">$150,200.80</td>
								</tr>
								<tr>
									<td class="tx-medium">Texas</td>
									<td class="text-right">11,950</td>
									<td class="text-right">$138,910.20</td>
								</tr>
								<tr>
									<td class="tx-medium">Wyoming</td>
									<td class="text-right">11,198</td>
									<td class="text-right">$132,050.00</td>
								</tr>
								<tr>
									<td class="tx-medium">Florida</td>
									<td class="text-right">9,885</td>
									<td class="text-right">$127,762.10</td>
								</tr>
								<tr>
									<td class="tx-medium">New York</td>
									<td class="text-right">8,560</td>
									<td class="text-right">$117,087.50</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- table-responsive -->
				</div>
				<!-- card-body -->
			</div>
			<!-- card -->
		</div>
		<!-- col -->
		<div class="col-lg-12 col-xl-8 mg-t-10">
			<div class="card mg-b-10">
				<div class="card-header pd-t-20 d-sm-flex align-items-start justify-content-between bd-b-0 pd-b-0">
					<div>
						<h6 class="mg-b-5">Your Most Recent Earnings</h6>
						<p class="tx-13 tx-color-03 mg-b-0">Your sales and referral earnings over the last 30 days</p>
					</div>
					<div class="d-flex mg-t-20 mg-sm-t-0">
						<div class="btn-group flex-fill">
							<button class="btn btn-white btn-xs active">Range</button>
							<button class="btn btn-white btn-xs">Period</button>
						</div>
					</div>
				</div>
				<!-- card-header -->
				<div class="card-body pd-y-30">
					<div class="d-sm-flex">
						<div class="media">
							<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-teal tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-6">
								<i data-feather="bar-chart-2"></i>
							</div>
							<div class="media-body">
								<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold tx-nowrap mg-b-5 mg-md-b-8">Gross Earnings</h6>
								<h4 class="tx-20 tx-sm-18 tx-md-20 tx-normal tx-rubik mg-b-0">$1,958,104</h4>
							</div>
						</div>
						<div class="media mg-t-20 mg-sm-t-0 mg-sm-l-15 mg-md-l-40">
							<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-pink tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-5">
								<i data-feather="bar-chart-2"></i>
							</div>
							<div class="media-body">
								<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Tax Withheld</h6>
								<h4 class="tx-20 tx-sm-18 tx-md-20 tx-normal tx-rubik mg-b-0">
									$234,769
									<small>.50</small>
								</h4>
							</div>
						</div>
						<div class="media mg-t-20 mg-sm-t-0 mg-sm-l-15 mg-md-l-40">
							<div class="wd-40 wd-md-50 ht-40 ht-md-50 bg-primary tx-white mg-r-10 mg-md-r-10 d-flex align-items-center justify-content-center rounded op-4">
								<i data-feather="bar-chart-2"></i>
							</div>
							<div class="media-body">
								<h6 class="tx-sans tx-uppercase tx-10 tx-spacing-1 tx-color-03 tx-semibold mg-b-5 mg-md-b-8">Net Earnings</h6>
								<h4 class="tx-20 tx-sm-18 tx-md-20 tx-normal tx-rubik mg-b-0">
									$1,608,469
									<small>.50</small>
								</h4>
							</div>
						</div>
					</div>
				</div>
				<!-- card-body -->
				<div class="table-responsive">
					<table class="table table-dashboard mg-b-0">
						<thead>
							<tr>
								<th>Date</th>
								<th class="text-right">Sales Count</th>
								<th class="text-right">Gross Earnings</th>
								<th class="text-right">Tax Withheld</th>
								<th class="text-right">Net Earnings</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="tx-color-03 tx-normal">03/05/2018</td>
								<td class="tx-medium text-right">1,050</td>
								<td class="text-right tx-teal">+ $32,580.00</td>
								<td class="text-right tx-pink">- $3,023.10</td>
								<td class="tx-medium text-right">$28,670.90 <span class="mg-l-5 tx-10 tx-normal tx-success"><i class="icon ion-md-arrow-up"></i> 4.5%</span></td>
							</tr>
							<tr>
								<td class="tx-color-03 tx-normal">03/04/2018</td>
								<td class="tx-medium text-right">980</td>
								<td class="text-right tx-teal">+ $30,065.10</td>
								<td class="text-right tx-pink">- $2,780.00</td>
								<td class="tx-medium text-right">$26,930.40 <span class="mg-l-5 tx-10 tx-normal tx-danger"><i class="icon ion-md-arrow-down"></i> 0.8%</span></td>
							</tr>
							<tr>
								<td class="tx-color-03 tx-normal">03/04/2018</td>
								<td class="tx-medium text-right">980</td>
								<td class="text-right tx-teal">+ $30,065.10</td>
								<td class="text-right tx-pink">- $2,780.00</td>
								<td class="tx-medium text-right">$26,930.40 <span class="mg-l-5 tx-10 tx-normal tx-danger"><i class="icon ion-md-arrow-down"></i> 0.8%</span></td>
							</tr>
							<tr>
								<td class="tx-color-03 tx-normal">03/04/2018</td>
								<td class="tx-medium text-right">980</td>
								<td class="text-right tx-teal">+ $30,065.10</td>
								<td class="text-right tx-pink">- $2,780.00</td>
								<td class="tx-medium text-right">$26,930.40 <span class="mg-l-5 tx-10 tx-normal tx-danger"><i class="icon ion-md-arrow-down"></i> 0.8%</span></td>
							</tr>
							<tr>
								<td class="tx-color-03 tx-normal">03/04/2018</td>
								<td class="tx-medium text-right">980</td>
								<td class="text-right tx-teal">+ $30,065.10</td>
								<td class="text-right tx-pink">- $2,780.00</td>
								<td class="tx-medium text-right">$26,930.40 <span class="mg-l-5 tx-10 tx-normal tx-danger"><i class="icon ion-md-arrow-down"></i> 0.8%</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- table-responsive -->
			</div>
			<!-- card -->
			<div class="card card-body ht-lg-100">
				<div class="media">
					<span class="tx-color-04"><i data-feather="download" class="wd-60 ht-60"></i></span>
					<div class="media-body mg-l-20">
						<h6 class="mg-b-10">Download your earnings in CSV format.</h6>
						<p class="tx-color-03 mg-b-0">Open it in a spreadsheet and perform your own calculations, graphing etc.</p>
					</div>
				</div>
				<!-- media -->
			</div>
		</div>
		<!-- col -->
		<div class="col-md-6 col-xl-4 mg-t-10">
			<div class="card ht-100p">
				<div class="card-header d-flex align-items-center justify-content-between">
					<h6 class="mg-b-0">Transaction History</h6>
					<div class="d-flex tx-18">
						<a href="" class="link-03 lh-0">
							<i class="icon ion-md-refresh"></i>
						</a>
						<a href="" class="link-03 lh-0 mg-l-10">
							<i class="icon ion-md-more"></i>
						</a>
					</div>
				</div>
				<ul class="list-group list-group-flush tx-13">
					<li class="list-group-item d-flex pd-sm-x-20">
						<div class="avatar d-none d-sm-block">
							<span class="avatar-initial rounded-circle bg-teal"><i class="icon ion-md-checkmark"></i></span>
						</div>
						<div class="pd-sm-l-10">
							<p class="tx-medium mg-b-0">Payment from #10322</p>
							<small class="tx-12 tx-color-03 mg-b-0">Mar 21, 2019, 3:30pm</small>
						</div>
						<div class="mg-l-auto text-right">
							<p class="tx-medium mg-b-0">+ $250.00</p>
							<small class="tx-12 tx-success mg-b-0">Completed</small>
						</div>
					</li>
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
					<a href="" class="link-03">
						View All Transactions <i class="icon ion-md-arrow-down mg-l-5"></i>
					</a>
				</div>
				<!-- card-footer -->
			</div>
			<!-- card -->
		</div>
		<div class="col-md-6 col-xl-4 mg-t-10">
			<div class="card ht-100p">
				<div class="card-header d-flex align-items-center justify-content-between">
					<h6 class="mg-b-0">New Customers</h6>
					<div class="d-flex align-items-center tx-18">
						<a href="" class="link-03 lh-0">
							<i class="icon ion-md-refresh"></i>
						</a>
						<a href="" class="link-03 lh-0 mg-l-10">
							<i class="icon ion-md-more"></i>
						</a>
					</div>
				</div>
				<ul class="list-group list-group-flush tx-13">
					<li class="list-group-item d-flex pd-sm-x-20">
						<div class="avatar">
							<span class="avatar-initial rounded-circle bg-gray-600">s</span>
						</div>
						<div class="pd-l-10">
							<p class="tx-medium mg-b-0">Socrates Itumay</p>
							<small class="tx-12 tx-color-03 mg-b-0">Customer ID#00222</small>
						</div>
						<div class="mg-l-auto d-flex align-self-center">
							<nav class="nav nav-icon-only">
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="mail"></i>
								</a>
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="slash"></i>
								</a>
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="user"></i>
								</a>
								<a href="" class="nav-link d-sm-none">
									<i data-feather="more-vertical"></i>
								</a>
							</nav>
						</div>
					</li>
					<li class="list-group-item d-flex pd-x-20">
						<div class="avatar">
							<img src="../../assets/img/img23.jpg" class="rounded-circle" alt="">
						</div>
						<div class="pd-l-10">
							<p class="tx-medium mg-b-0">Reynante Labares</p>
							<small class="tx-12 tx-color-03 mg-b-0">Customer ID#00221</small>
						</div>
						<div class="mg-l-auto d-flex align-self-center">
							<nav class="nav nav-icon-only">
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="mail"></i>
								</a>
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="slash"></i>
								</a>
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="user"></i>
								</a>
								<a href="" class="nav-link d-sm-none">
									<i data-feather="more-vertical"></i>
								</a>
							</nav>
						</div>
					</li>
					<li class="list-group-item d-flex pd-x-20">
						<div class="avatar">
							<img src="../../assets/img/img16.jpg" class="rounded-circle" alt="">
						</div>
						<div class="pd-l-10">
							<p class="tx-medium mg-b-0">Marianne Audrey</p>
							<small class="tx-12 tx-color-03 mg-b-0">Customer ID#00220</small>
						</div>
						<div class="mg-l-auto d-flex align-self-center">
							<nav class="nav nav-icon-only">
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="mail"></i>
								</a>
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="slash"></i>
								</a>
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="user"></i>
								</a>
								<a href="" class="nav-link d-sm-none">
									<i data-feather="more-vertical"></i>
								</a>
							</nav>
						</div>
					</li>
					<li class="list-group-item d-flex pd-x-20">
						<div class="avatar">
							<span class="avatar-initial rounded-circle bg-indigo op-5">o</span>
						</div>
						<div class="pd-l-10">
							<p class="tx-medium mg-b-0">Owen Bongcaras</p>
							<small class="tx-12 tx-color-03 mg-b-0">Customer ID#00219</small>
						</div>
						<div class="mg-l-auto d-flex align-self-center">
							<nav class="nav nav-icon-only">
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="mail"></i>
								</a>
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="slash"></i>
								</a>
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="user"></i>
								</a>
								<a href="" class="nav-link d-sm-none">
									<i data-feather="more-vertical"></i>
								</a>
							</nav>
						</div>
					</li>
					<li class="list-group-item d-flex pd-x-20">
						<div class="avatar">
							<span class="avatar-initial rounded-circle bg-primary op-5">k</span>
						</div>
						<div class="pd-l-10">
							<p class="tx-medium mg-b-0">Kirby Avendula</p>
							<small class="tx-12 tx-color-03 mg-b-0">Customer ID#00218</small>
						</div>
						<div class="mg-l-auto d-flex align-self-center">
							<nav class="nav nav-icon-only">
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="mail"></i>
								</a>
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="slash"></i>
								</a>
								<a href="" class="nav-link d-none d-sm-block">
									<i data-feather="user"></i>
								</a>
								<a href="" class="nav-link d-sm-none">
									<i data-feather="more-vertical"></i>
								</a>
							</nav>
						</div>
					</li>
				</ul>
				<div class="card-footer text-center tx-13">
					<a href="" class="link-03">
						View More Customers <i class="icon ion-md-arrow-down mg-l-5"></i>
					</a>
				</div>
				<!-- card-footer -->
			</div>
			<!-- card -->
		</div>
		<div class="col-md-6 col-xl-4 mg-t-10">
			<div class="card ht-lg-100p">
				<div class="card-header d-flex align-items-center justify-content-between">
					<h6 class="mg-b-0">Real-Time Sales</h6>
					<ul class="list-inline d-flex mg-b-0">
						<li class="list-inline-item d-flex align-items-center">
							<span class="d-block wd-10 ht-10 bg-df-2 rounded mg-r-5"></span> <span class="tx-sans tx-uppercase tx-10 tx-medium tx-color-03">Today</span>
						</li>
						<li class="list-inline-item d-flex align-items-center mg-l-10">
							<span class="d-block wd-10 ht-10 bg-df-3 rounded mg-r-5"></span> <span class="tx-sans tx-uppercase tx-10 tx-medium tx-color-03">Yesterday</span>
						</li>
					</ul>
				</div>
				<!-- card-header -->
				<div class="card-body pd-b-0">
					<div class="row mg-b-20">
						<div class="col">
							<h5 class="tx-normal tx-rubik tx-spacing--1 mg-b-10">
								$150,200
								<small class="tx-11 tx-success letter-spacing--2">
									<i class="icon ion-md-arrow-up"></i> 0.20%
								</small>
							</h5>
							<p class="tx-10 tx-uppercase tx-spacing-1 tx-medium tx-color-03">Total Sales</p>
						</div>
						<div class="col">
							<h5 class="tx-normal tx-rubik tx-spacing--1 mg-b-10">
								$21,880
								<small class="tx-11 tx-danger letter-spacing--2">
									<i class="icon ion-md-arrow-down"></i> 1.04%
								</small>
							</h5>
							<p class="tx-10 tx-uppercase tx-spacing-1 tx-medium tx-color-03">Avg. Sales Per Day</p>
						</div>
					</div>
					<!-- row -->
					<div class="chart-five">
						<div>
							<canvas id="chartBar1"></canvas>
						</div>
					</div>
				</div>
				<!-- card-body -->
			</div>
		</div>
	</div>
	<!-- row -->
	<script src="lib/jquery.flot/jquery.flot.js"></script>
	<script src="lib/jquery.flot/jquery.flot.stack.js"></script>
	<script src="lib/jquery.flot/jquery.flot.resize.js"></script>
	<script src="lib/chart.js/Chart.bundle.min.js"></script>
	<script src="lib/jqvmap/jquery.vmap.min.js"></script>
	<script src="lib/jqvmap/maps/jquery.vmap.usa.js"></script>
	<script src="assets/js/dashforge.sampledata.js"></script>
	<script src="assets/api.js"></script>
	<script>
	$(document).ready(function(){
		setTimeout(function(){
			$('#flotChart').css({'width':'100%'});
			$('#flotChart2').css({'height':'200px'});
			

			var flotChart = $('#flotChart');
			var flotChart2 = $('#flotChart2');
			var flotChart3 = $('#flotChart3');
			var flotChart4 = $('#flotChart4');
			var flotChart5 = $('#flotChart5');
			var flotChart6 = $('#flotChart6');
			//flotChart.width('100% !important');
	        var plot = $.plot(flotChart, [{
	          data: df3,
	          color: '#69b2f8'
	        },{
	          data: df1,
	          color: '#d1e6fa'
	        },{
	          data: df2,
	          color: '#d1e6fa',
	          lines: {
	            fill: false,
	            lineWidth: 1.5
	          }
	        }], {
	    			series: {
	            stack: 0,
	    				shadowSize: 0,
	            lines: {
	              show: true,
	              lineWidth: 0,
	              fill: 1
	            }
	    			},
	          grid: {
	            borderWidth: 0,
	            aboveData: true
	          },
	    			yaxis: {
	            show: false,
	    				min: 0,
	    				max: 350
	    			},
	    			xaxis: {
	            show: true,
	            ticks: [[0,''],[8,'Jan'],[20,'Feb'],[32,'Mar'],[44,'Apr'],[56,'May'],[68,'Jun'],[80,'Jul'],[92,'Aug'],[104,'Sep'],[116,'Oct'],[128,'Nov'],[140,'Dec']],
	            color: 'rgba(255,255,255,.2)'
	          }
	        });


	        $.plot(flotChart2, [{
	          data: [[0,55],[1,38],[2,20],[3,70],[4,50],[5,15],[6,30],[7,50],[8,40],[9,55],[10,60],[11,40],[12,32],[13,17],[14,28],[15,36],[16,53],[17,66],[18,58],[19,46]],
	          color: '#69b2f8'
	        },{
	          data: [[0,80],[1,80],[2,80],[3,80],[4,80],[5,80],[6,80],[7,80],[8,80],[9,80],[10,80],[11,80],[12,80],[13,80],[14,80],[15,80],[16,80],[17,80],[18,80],[19,80]],
	          color: '#f0f1f5'
	        }], {
	          series: {
	            stack: 0,
	            bars: {
	              show: true,
	              lineWidth: 0,
	              barWidth: .5,
	              fill: 1
	            }
	          },
	          grid: {
	            borderWidth: 0,
	            borderColor: '#edeff6'
	          },
	          yaxis: {
	            show: false,
	            max: 80
	          },
	          xaxis: {
	            ticks:[[0,'Jan'],[4,'Feb'],[8,'Mar'],[12,'Apr'],[16,'May'],[19,'Jun']],
	            color: '#fff',
	          }
	        });

	        $.plot(flotChart3, [{
	            data: df4,
	            color: '#9db2c6'
	          }], {
	    			series: {
	    				shadowSize: 0,
	            lines: {
	              show: true,
	              lineWidth: 2,
	              fill: true,
	              fillColor: { colors: [ { opacity: 0 }, { opacity: .5 } ] }
	            }
	    			},
	          grid: {
	            borderWidth: 0,
	            labelMargin: 0
	          },
	    			yaxis: {
	            show: false,
	            min: 0,
	            max: 60
	          },
	    			xaxis: { show: false }
	    		});

	        $.plot(flotChart4, [{
	            data: df5,
	            color: '#9db2c6'
	          }], {
	    			series: {
	    				shadowSize: 0,
	            lines: {
	              show: true,
	              lineWidth: 2,
	              fill: true,
	              fillColor: { colors: [ { opacity: 0 }, { opacity: .5 } ] }
	            }
	    			},
	          grid: {
	            borderWidth: 0,
	            labelMargin: 0
	          },
	    			yaxis: {
	            show: false,
	            min: 0,
	            max: 80
	          },
	    			xaxis: { show: false }
	    		});

	        $.plot(flotChart5, [{
	            data: df6,
	            color: '#9db2c6'
	          }], {
	    			series: {
	    				shadowSize: 0,
	            lines: {
	              show: true,
	              lineWidth: 2,
	              fill: true,
	              fillColor: { colors: [ { opacity: 0 }, { opacity: .5 } ] }
	            }
	    			},
	          grid: {
	            borderWidth: 0,
	            labelMargin: 0
	          },
	    			yaxis: {
	            show: false,
	            min: 0,
	            max: 80
	          },
	    			xaxis: { show: false }
	    		});

	        $.plot(flotChart6, [{
	            data: df4,
	            color: '#9db2c6'
	          }], {
	    			series: {
	    				shadowSize: 0,
	            lines: {
	              show: true,
	              lineWidth: 2,
	              fill: true,
	              fillColor: { colors: [ { opacity: 0 }, { opacity: .5 } ] }
	            }
	    			},
	          grid: {
	            borderWidth: 0,
	            labelMargin: 0
	          },
	    			yaxis: {
	            show: false,
	            min: 0,
	            max: 60
	          },
	    			xaxis: { show: false }
	    		});

	        $('#vmap').vectorMap({
	          map: 'usa_en',
	          showTooltip: true,
	          backgroundColor: '#fff',
	          color: '#d1e6fa',
	          colors: {
	            fl: '#69b2f8',
	            ca: '#69b2f8',
	            tx: '#69b2f8',
	            wy: '#69b2f8',
	            ny: '#69b2f8'
	          },
	          selectedColor: '#00cccc',
	          enableZoom: false,
	          borderWidth: 1,
	          borderColor: '#fff',
	          hoverOpacity: .85
	        });


	        var ctxLabel = ['6am', '10am', '1pm', '4pm', '7pm', '10pm'];
	        var ctxData1 = [20, 60, 50, 45, 50, 60];
	        var ctxData2 = [10, 40, 30, 40, 55, 25];

	        // Bar chart
	        var ctx1 = document.getElementById('chartBar1').getContext('2d');
	        new Chart(ctx1, {
	          type: 'horizontalBar',
	          data: {
	            labels: ctxLabel,
	            datasets: [{
	              data: ctxData1,
	              backgroundColor: '#69b2f8'
	            }, {
	              data: ctxData2,
	              backgroundColor: '#d1e6fa'
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
	            scales: {
	              yAxes: [{
	                gridLines: {
	                  display: false
	                },
	                ticks: {
	                  display: false,
	                  beginAtZero: true,
	                  fontSize: 10,
	                  fontColor: '#182b49'
	                }
	              }],
	              xAxes: [{
	                gridLines: {
	                  display: true,
	                  color: '#eceef4'
	                },
	                barPercentage: 0.6,
	                ticks: {
	                  beginAtZero: true,
	                  fontSize: 10,
	                  fontColor: '#8392a5',
	                  max: 80
	                }
	              }]
	            }
	          }
	        });


			
			
		},1000)
		

		
	});
      $(function(){
        'use strict'
		

      })
    </script>
</body>
</html>
