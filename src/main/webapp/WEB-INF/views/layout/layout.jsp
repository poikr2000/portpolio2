<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- bootstrap-->

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.min.css">
<script src="resources/js/jquery-1.12.4.js"></script>
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/nomalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demo.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/set1.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/set2.css">
<!-- DataTables -->
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.jqueryui.min.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Fonts-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/fonts/fontawesome/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/fonts/themify-icons/themify-icons.css">
<!-- Vendors-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendors/bootstrap4/bootstrap-grid.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendors/magnific-popup/magnific-popup.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendors/owl.carousel/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendors/_jquery/jquery.min.css">
<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendors/bootstrap4/bootstrap-grid.min.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/vendors/bootstrap4/bootstrap-grid.min.css"> -->
<!-- App & fonts-->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i&amp;amp;subset=latin-ext">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/main.css?ver=15"><!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>K.O.K FITNESS</title>
</head>
<body>
<div>
	<page:applyDecorator name="layoutheader"/>
</div>
<div>
	<decorator:body></decorator:body>
</div>
<div>
	<page:applyDecorator name="layoutfooter"/>
</div>

<decorator:getProperty property="page.local_script"></decorator:getProperty>
		<script src="resources/js/jquery-ui.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
		<script src="https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script>
	<!-- Vendors-->
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/imagesloaded/imagesloaded.pkgd.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/imagesloaded/imagesloaded.pkgd.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/isotope-layout/isotope.pkgd.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/jquery.countdown/jquery.countdown.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/jquery.countTo/jquery.countTo.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/jquery.countUp/jquery.countup.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/jquery.matchHeight/jquery.matchHeight.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/jquery.mb.ytplayer/jquery.mb.YTPlayer.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/magnific-popup/jquery.magnific-popup.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/masonry-layout/masonry.pkgd.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/owl.carousel/owl.carousel.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/jquery.waypoints/jquery.waypoints.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/menu/menu.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/assets/vendors/smoothscroll/SmoothScroll.min.js"/>"></script>
		<!-- App-->
		<script type="text/javascript" src="<c:url value="/resources/assets/js/main.js?ver=2"/>"></script>
</body>
</html>