<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/dashforge.filemgr.css">
<style type="text/css">
.footer {
	display: none;
}
</style>
</head>
<body>
	<div class="filemgr-wrapper filemgr-wrapper-two">
		<div class="filemgr-sidebar">
			<div class="filemgr-sidebar-header">
				<div class="dropdown dropdown-icon flex-fill">
					<button class="btn btn-xs btn-block btn-white" data-toggle="dropdown">
						New <i data-feather="chevron-down"></i>
					</button>
					<div class="dropdown-menu tx-13">
						<a href="#" class="dropdown-item">
							<i data-feather="folder"></i><span>Folder</span>
						</a>
						<a href="#" class="dropdown-item">
							<i data-feather="file"></i><span>Notes</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item">
							<i data-feather="file-text"></i><span>Word Document</span>
						</a>
						<a href="#" class="dropdown-item">
							<i data-feather="file-text"></i><span>Powepoint</span>
						</a>
						<a href="#" class="dropdown-item">
							<i data-feather="file-text"></i><span>Excel Spreadsheet</span>
						</a>
					</div>
					<!-- dropdown-menu -->
				</div>
				<!-- dropdown -->
				<div class="dropdown dropdown-icon flex-fill mg-l-10">
					<button class="btn btn-xs btn-block btn-primary" data-toggle="dropdown">
						Upload <i data-feather="chevron-down"></i>
					</button>
					<div class="dropdown-menu tx-13">
						<a href="#" class="dropdown-item">
							<i data-feather="file"></i><span>File</span>
						</a>
						<a href="#" class="dropdown-item">
							<i data-feather="folder"></i><span>Folder</span>
						</a>
					</div>
					<!-- dropdown-menu -->
				</div>
				<!-- dropdown -->
			</div>
			<!-- filemgr-sidebar-header -->
			<div class="filemgr-sidebar-body">
				<div class="pd-t-20 pd-b-10 pd-x-10">
					<label class="tx-sans tx-uppercase tx-medium tx-10 tx-spacing-1 tx-color-03 pd-l-10">My Drive</label>
					<nav class="nav nav-sidebar tx-13">
						<a href="#" class="nav-link active">
							<i data-feather="folder"></i> <span>All Files</span>
						</a>
						<a href="#" class="nav-link">
							<i data-feather="monitor"></i> <span>My Devices</span>
						</a>
						<a href="#" class="nav-link">
							<i data-feather="clock"></i> <span>Recents</span>
						</a>
						<a href="#" class="nav-link">
							<i data-feather="star"></i> <span>Important</span>
						</a>
						<a href="#" class="nav-link">
							<i data-feather="trash"></i> <span>Deleted Files</span>
						</a>
					</nav>
				</div>
				<div class="pd-10">
					<label class="tx-sans tx-uppercase tx-medium tx-10 tx-spacing-1 tx-color-03 pd-l-10">File Library</label>
					<nav class="nav nav-sidebar tx-13">
						<a href="#" class="nav-link">
							<i data-feather="file"></i> <span>Documents</span>
						</a>
						<a href="#" class="nav-link">
							<i data-feather="image"></i> <span>Images</span>
						</a>
						<a href="#" class="nav-link">
							<i data-feather="video"></i> <span>Videos</span>
						</a>
						<a href="#" class="nav-link">
							<i data-feather="music"></i> <span>Audio</span>
						</a>
						<a href="#" class="nav-link">
							<i data-feather="package"></i> <span>Zip Files</span>
						</a>
					</nav>
				</div>
				<div class="pd-y-10 pd-x-20">
					<label class="tx-sans tx-uppercase tx-medium tx-10 tx-spacing-1 tx-color-03 mg-b-15">Storage Status</label>
					<div class="media">
						<i data-feather="database" class="wd-30 ht-30"></i>
						<div class="media-body mg-l-10">
							<div class="tx-12 mg-b-4">10.2GB used of 50GB</div>
							<div class="progress ht-3 mg-b-20">
								<div class="progress-bar wd-15p" role="progressbar" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<!-- media-body -->
					</div>
					<!-- media -->
					<p class="tx-12">
						Get 2TB (2,000GB) of storage now and get 40% off. Offers ends soon.
						<a href="#">Learn more</a>
					</p>
				</div>
			</div>
			<!-- filemgr-sidebar-body -->
		</div>
		<!-- filemgr-sidebar -->
		<div class="filemgr-content">
			<div class="filemgr-content-header">
				<h4 class="mg-b-0">All Files</h4>
				<nav class="nav d-none d-sm-flex mg-l-auto">
					<a href="#" class="nav-link">
						<i data-feather="list"></i>
					</a>
					<a href="#" class="nav-link">
						<i data-feather="alert-circle"></i>
					</a>
					<a href="#" class="nav-link">
						<i data-feather="settings"></i>
					</a>
				</nav>
			</div>
			<!-- filemgr-content-header -->
			<div class="filemgr-content-body">
				<div class="pd-20 pd-lg-25 pd-xl-30">
					<label class="d-block tx-medium tx-10 tx-uppercase tx-sans tx-spacing-1 tx-color-03 mg-b-15">Recently Accessed Files</label>
					<div class="row row-xs">
						<div class="col-6 col-sm-4 col-md-3 col-xl">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-danger">
									<i class="far fa-file-pdf"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">Medical Certificate.pdf</a>
									</h6>
									<span>10.45kb</span>
								</div>
								<div class="card-footer">
									<span class="d-none d-sm-inline">Last accessed: </span>2 hours ago
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-primary">
									<i class="far fa-file-word"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">Job Contract.docx</a>
									</h6>
									<span>22.67kb</span>
								</div>
								<div class="card-footer">
									<span class="d-none d-sm-inline">Last accessed: </span>5 hours ago
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10 mg-sm-t-0">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-indigo">
									<i class="far fa-file-image"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">IMG_063037.jpg</a>
									</h6>
									<span>4.1mb</span>
								</div>
								<div class="tx-11 tx-color-04 mg-t-10">
									<span class="d-none d-sm-inline">Last accessed: </span>6 hours ago
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10 mg-md-t-0">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-info">
									<i class="far fa-file-audio"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">Music_One.mp3</a>
									</h6>
									<span>3.40mb</span>
								</div>
								<div class="card-footer">
									<span class="d-none d-sm-inline">Last accessed: </span>6 hours ago
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10 mg-xl-t-0">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-primary">
									<i class="far fa-file-word"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">Job Requirements.docx</a>
									</h6>
									<span>17.19kb</span>
								</div>
								<div class="card-footer">
									<span class="d-none d-sm-inline">Last accessed: </span>7 hours ago
								</div>
							</div>
						</div>
						<!-- col -->
					</div>
					<!-- row -->
					<hr class="mg-y-40 bd-0">
					<label class="d-block tx-medium tx-10 tx-uppercase tx-sans tx-spacing-1 tx-color-03 mg-b-15">Folders</label>
					<div class="row row-xs">
						<div class="col-sm-6 col-lg-4 col-xl-3">
							<div class="media media-folder">
								<i data-feather="folder"></i>
								<div class="media-body">
									<h6>
										<a href="#" class="link-02">Downloads</a>
									</h6>
									<span>2 files, 14.05mb</span>
								</div>
								<!-- media-body -->
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
							</div>
							<!-- media -->
						</div>
						<!-- col -->
						<div class="col-sm-6 col-lg-4 col-xl-3 mg-t-10 mg-sm-t-0">
							<div class="media media-folder">
								<i data-feather="folder"></i>
								<div class="media-body">
									<h6>
										<a href="#" class="link-02">Personal Stuff</a>
									</h6>
									<span>8 files, 76.3mb</span>
								</div>
								<!-- media-body -->
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
							</div>
							<!-- media -->
						</div>
						<!-- col -->
						<div class="col-sm-6 col-lg-4 col-xl-3 mg-t-10 mg-lg-t-0">
							<div class="media media-folder">
								<i data-feather="folder"></i>
								<div class="media-body">
									<h6>
										<a href="#" class="link-02">3D Objects</a>
									</h6>
									<span>5 files, 126.3mb</span>
								</div>
								<!-- media-body -->
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
							</div>
							<!-- media -->
						</div>
						<!-- col -->
						<div class="col-sm-6 col-lg-4 col-xl-3 mg-t-10 mg-xl-t-0">
							<div class="media media-folder">
								<i data-feather="folder"></i>
								<div class="media-body">
									<h6>
										<a href="#" class="link-02">Recordings</a>
									</h6>
									<span>0 files</span>
								</div>
								<!-- media-body -->
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
							</div>
							<!-- media -->
						</div>
						<!-- col -->
						<div class="col-sm-6 col-lg-4 col-xl-3 mg-t-10">
							<div class="media media-folder">
								<i data-feather="folder"></i>
								<div class="media-body">
									<h6>
										<a href="#" class="link-02">Support</a>
									</h6>
									<span>1 file, 20mb</span>
								</div>
								<!-- media-body -->
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
							</div>
							<!-- media -->
						</div>
						<!-- col -->
					</div>
					<!-- row -->
					<hr class="mg-y-40 bd-0">
					<label class="d-block tx-medium tx-10 tx-uppercase tx-sans tx-spacing-1 tx-color-03 mg-b-15">Files</label>
					<div class="row row-xs">
						<div class="col-6 col-sm-4 col-md-3 col-xl">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-primary">
									<i class="far fa-file-word"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">Job Requirements.docx</a>
									</h6>
									<p>Word Document</p>
									<span>10.45kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-orange">
									<i class="far fa-file-powerpoint"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">My Presentation.ppt</a>
									</h6>
									<p>Presentation File</p>
									<span>135kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10 mg-sm-t-0">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-success">
									<i class="far fa-file-excel"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">Inventory.xls</a>
									</h6>
									<p>Spreadsheet File</p>
									<span>22.67kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10 mg-md-t-0">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-danger">
									<i class="far fa-file-pdf"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">GettingStarted.pdf</a>
									</h6>
									<p>PDF File</p>
									<span>94kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10 mg-xl-t-0">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-success">
									<i class="far fa-file-excel"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">Financial_Final.xls</a>
									</h6>
									<p>Spreadsheet File</p>
									<span>61.1kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="d-none d-xl-block wd-100p ht-10"></div>
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-indigo">
									<i class="far fa-file-image"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">DesignMockup.psd</a>
									</h6>
									<p>Photoshop File</p>
									<span>105.4mb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-gray-600">
									<i class="far fa-file-alt"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">Instructions.txt</a>
									</h6>
									<p>Text Document</p>
									<span>43.9kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-primary">
									<i class="far fa-file-word"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">Journal.docx</a>
									</h6>
									<p>Word Document</p>
									<span>33.4kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-info">
									<i class="far fa-file-audio"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">MusicTwo.mp3</a>
									</h6>
									<p>Mp3 File</p>
									<span>4.1mb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-gray-600">
									<i class="far fa-file-alt"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">ReadMe.txt</a>
									</h6>
									<p>Text Document</p>
									<span>43.9kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="d-none d-xl-block wd-100p ht-10"></div>
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-pink">
									<i class="far fa-file-video"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">MiniMovie.mp4</a>
									</h6>
									<p>MP4 File</p>
									<span>22.2mb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-orange">
									<i class="far fa-file-code"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">home.html</a>
									</h6>
									<p>HTML Document</p>
									<span>43.9kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-primary">
									<i class="far fa-file-code"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">style.css</a>
									</h6>
									<p>CSS File</p>
									<span>43.9kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10">
							<div class="card card-file">
								<div class="dropdown-file">
									<a href="#" class="dropdown-link" data-toggle="dropdown">
										<i data-feather="more-vertical"></i>
									</a>
									<div class="dropdown-menu dropdown-menu-right">
										<a href="#modalViewDetails" data-toggle="modal" class="dropdown-item details">
											<i data-feather="info"></i>View Details
										</a>
										<a href="#" class="dropdown-item important">
											<i data-feather="star"></i>Mark as Important
										</a>
										<a href="#modalShare" data-toggle="modal" class="dropdown-item share">
											<i data-feather="share"></i>Share
										</a>
										<a href="#" class="dropdown-item download">
											<i data-feather="download"></i>Download
										</a>
										<a href="#modalCopy" data-toggle="modal" class="dropdown-item copy">
											<i data-feather="copy"></i>Copy to
										</a>
										<a href="#modalMove" data-toggle="modal" class="dropdown-item move">
											<i data-feather="folder"></i>Move to
										</a>
										<a href="#" class="dropdown-item rename">
											<i data-feather="edit"></i>Rename
										</a>
										<a href="#" class="dropdown-item delete">
											<i data-feather="trash"></i>Delete
										</a>
									</div>
								</div>
								<!-- dropdown -->
								<div class="card-file-thumb tx-purple">
									<i class="far fa-file-code"></i>
								</div>
								<div class="card-body">
									<h6>
										<a href="#" class="link-02">package.json</a>
									</h6>
									<p>JSON File</p>
									<span>2.3kb</span>
								</div>
							</div>
						</div>
						<!-- col -->
						<div class="col-6 col-sm-4 col-md-3 col-xl mg-t-10"></div>
						<!-- col -->
					</div>
					<!-- row -->
				</div>
			</div>
			<!-- filemgr-content-body -->
		</div>
		<!-- filemgr-content -->
	</div>
	<!-- filemgr-wrapper -->
	<div class="modal fade effect-scale" id="modalViewDetails" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body pd-20 pd-sm-30">
					<button type="button" class="close pos-absolute t-15 r-20" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="tx-18 tx-sm-20 mg-b-30">View Details</h5>
					<div class="row mg-b-10">
						<div class="col-4">Filename:</div>
						<div class="col-8">Medical Certificate.pdf</div>
					</div>
					<!-- row -->
					<div class="row mg-b-10">
						<div class="col-4">File ype:</div>
						<div class="col-8">PDF File</div>
					</div>
					<!-- row -->
					<div class="row mg-b-10">
						<div class="col-4">File Size:</div>
						<div class="col-8">10.45 KB</div>
					</div>
					<!-- row -->
					<div class="row mg-b-10">
						<div class="col-4">Created:</div>
						<div class="col-8">Monday, July 02, 2018 9:34am</div>
					</div>
					<!-- row -->
					<div class="row mg-b-10">
						<div class="col-4">Modified:</div>
						<div class="col-8">Monday, July 02, 2018 9:34am</div>
					</div>
					<!-- row -->
					<div class="row mg-b-10">
						<div class="col-4">Accessed:</div>
						<div class="col-8">Monday, July 02, 2018 9:34am</div>
					</div>
					<!-- row -->
					<div class="row mg-b-10">
						<div class="col-4">Description:</div>
						<div class="col-8">
							<textarea class="form-control mg-t-5" rows="2" placeholder="Add description"></textarea>
						</div>
					</div>
					<!-- row -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary mg-sm-l-5" data-dismiss="modal">Close</button>
				</div>
				<!-- modal-footer -->
			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->
	<div class="modal fade effect-scale" id="modalShare" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body pd-20 pd-sm-30">
					<button type="button" class="close pos-absolute t-15 r-20" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="tx-18 tx-sm-20 mg-b-30">Share With Others</h5>
					<div class="mg-t-20">
						<label class="d-block">Other users:</label>
						<input class="form-control" placeholder="Enter names or email addresses">
						<div class="dropdown mg-t-10">
							Rights:
							<a href="#" class="dropdown-link" data-toggle="dropdown">
								Allow editing <i class="icon ion-chevron-down tx-12"></i>
							</a>
						</div>
						<!-- dropdown -->
						<hr>
						<label class="d-block">More:</label>
						<nav class="nav nav-social">
							<a href="#" class="nav-link">
								<i data-feather="facebook"></i>
							</a>
							<a href="#" class="nav-link">
								<i data-feather="twitter"></i>
							</a>
						</nav>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">Share</button>
				</div>
				<!-- modal-footer -->
			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->
	<div class="modal fade effect-scale" id="modalCopy" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body pd-20 pd-sm-30">
					<button type="button" class="close pos-absolute t-15 r-20" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="tx-18 tx-sm-20 mg-b-0">Copy Item to</h5>
					<p class="mg-b-25 tx-color-03">Please select a folder</p>
					<div class="bd bg-ui-01 pd-10">
						<ul class="nav nav-sidebar flex-column tx-13">
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i data-feather="folder"></i> Downloads
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i data-feather="folder"></i> Personal Stuff
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i data-feather="folder"></i> 3d Objects
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i data-feather="folder"></i> Recordings
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i data-feather="folder"></i> Support
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary mg-sm-r-5" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Copy</button>
				</div>
				<!-- modal-footer -->
			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->
	<div class="modal fade effect-scale" id="modalMove" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body pd-20 pd-sm-30">
					<button type="button" class="close pos-absolute t-15 r-20" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="tx-18 tx-sm-20 mg-b-0">Move Item to</h5>
					<p class="mg-b-25 tx-color-03">Please select a folder</p>
					<div class="bd bg-ui-01 pd-10">
						<ul class="nav nav-sidebar flex-column tx-13">
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i data-feather="folder"></i> Downloads
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i data-feather="folder"></i> Personal Stuff
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i data-feather="folder"></i> 3d Objects
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i data-feather="folder"></i> Recordings
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<i data-feather="folder"></i> Support
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary mg-sm-r-5" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Move</button>
				</div>
				<!-- modal-footer -->
			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->
	<div class="pos-fixed b-10 r-10">
		<div id="toast" class="toast bg-dark bd-0 wd-300" data-delay="3000" role="alert" aria-live="assertive" aria-atomic="true">
			<div class="toast-header bg-transparent bd-white-1">
				<h6 class="tx-white mg-b-0 mg-r-auto">Downloading</h6>
				<button type="button" class="ml-2 mb-1 close tx-normal tx-shadow-none" data-dismiss="toast" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="toast-body pd-10 tx-white">
				<h6 class="mg-b-0">Medical_Certificate.pdf</h6>
				<span class="tx-color-03 tx-11">1.2mb of 4.5mb</span>
				<div class="progress ht-5 mg-t-5">
					<div class="progress-bar wd-50p" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
			</div>
		</div>
		<!-- toast -->
	</div>
	<script src="${pageContext.request.contextPath }/assets/js/dashforge.filemgr.js"></script>
	<script>
      'use strict'

      $(document).ready(function(){
        if(window.matchMedia('(min-width: 1200px)').matches) {
          $('.aside').addClass('minimize');
        }
      })
    </script>
</body>
</html>