<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../util/headTag-lv.jsp"></jsp:include>
<link href="assets/css/loading.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../util/asideBar-lv.jsp"></jsp:include>
	<div class="content ht-100v pd-0">
		<!-- ht-100v -->
		<jsp:include page="../util/headerTop-lv.jsp"></jsp:include>
		<div class="content-body">
			<input type="hidden" class="currentPageLink" value="${activeLink}">
			<input type="hidden" class="currentLinkClass" value="${activeLinkClass}">
			<input type="hidden" class="currentLinkLiClass" value="${activeLinkLiClass}">
			<input type="hidden" class="currentLayout" value="V">
			<div class="loading hide">
				<div class="loading-dot"></div>
				<div class="loading-dot"></div>
				<div class="loading-dot"></div>
				<div class="loading-dot"></div>
			</div>
			<div class="container mainContainer pd-x-0" style="max-width: 98%;"></div>
			<jsp:include page="../util/footer-lv.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="../util/scriptTag-lv.jsp"></jsp:include>
	<script src="assets/commonJs.js"></script>
	<script type="text/javascript">
		
    /* START YOUR JAVASCRIPT CODE FORM HERE */
    /* $(document).ready(function() {
    	if($('.currentPageLink').val()!= null && $('.currentPageLink').val()!= ''){
    		console.log('link found');
    		loadPage(null,''+$('.currentPageLink').val());
    	}else{
    		console.log('link not found');
    		loadPage(null,'/dashboard/c');
    	}
    });

    function loadPage(obj, link) {
    	let slash = link.charAt(0);
    	if (slash != "/") {
    		link = "/" + link;
    	}
    	let url = "${pageContext.request.contextPath}" + link;
    	$.ajax({
    		url : url,
    		async : false,
    		success : function(resp) {
    			$('.mainContainer').empty().html(resp);
    			$('html,body').animate({
    				scrollTop : parseInt($('body').offset().top)
    			}, 1000);
    		},
    		error : function(e) {
    			if (e.status == 404) {
    				//$('.busy-load-container-item').empty().append('<div style="font-size:4vw">404 Page Not Found</div>')
    			} else {
    				//$('.busy-load-container-item').empty().append('<div style="font-size:3vw">Error.. Unable to load web page.</div>')
    			}
    		},
    	});
    }

    $(function() {
    	if (window.history && window.history.pushState) {
    		window.history.pushState('', null, loadPage(null,
    				'/dashboard/c'));
    		$(window).on('popstate', function() {
    			// alert('Browser Back button was pressed.');
    			document.location.href = '#';

    		});
    	}
    }); */
	</script>
</body>
</html>