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
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../util/headTag-lv.jsp"></jsp:include>
<link href="${pageContext.request.contextPath }/assets/css/loading.css" rel="stylesheet">
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
			<div class="mainContainer pd-x-0"></div>
			<jsp:include page="../util/footer-lv.jsp"></jsp:include>
		</div>
	</div>
	<jsp:include page="../util/scriptTag-lv.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath }/assets/commonJs.js"></script>
	<script type="text/javascript">
		console.log('contextPath::' + contextPath());

		function contextPath() {
			return "${pageContext.request.contextPath}";
		}

		var sessionObject = JSON.parse(JSON.stringify(<%=mapper.writeValueAsString(session.getAttribute("loggedUser"))%>));
		console.log('sessionObject::', sessionObject);

		feather.replace();
	</script>
</body>
</html>