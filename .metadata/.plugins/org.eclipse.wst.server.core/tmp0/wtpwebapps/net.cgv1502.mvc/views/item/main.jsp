<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <c:set var="context" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="메인페이지" />
<meta name="Description" content="메인페이지" />
<title>yeSooL homepage</title>
		<link rel="stylesheet" href="../css/main.css" type="text/css" media="screen" />
		<link href="../css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="../images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
	    <!---strat-slider---->
	    <script type="text/javascript" src="../js/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="../css/slider-style.css" />
		<script type="text/javascript" src="../js/modernizr.custom.28468.js"></script>
		<!---//strat-slider---->
		<!---start-login-script--->
		<script src="../js/login.js"></script>
		<!---//End-login-script--->
		<!-----768px-menu----->
		<link type="text/css" rel="stylesheet" href="../css/jquery.mmenu.all.css" />
		<script type="text/javascript" src="../js/jquery.mmenu.js"></script>
			<script type="text/javascript">
				//	The menu on the left
				$(function() {
					$('nav#menu-left').mmenu();
				});
		</script>

	</head>
	
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/header.jsp" />
		</div>
		<div id="main-menu" style='width: 100%;'>
			<jsp:include page="main_menu.jsp" />
		</div>
		<div class='container-item'>
				<c:choose>
				<c:when test="${result eq 'detail'}">
					<jsp:include page="detail.jsp"/>
				</c:when>
				<c:when test="${result eq 'imglist'}">
					<jsp:include page="imglist.jsp"/>
				</c:when>
					<c:when test="${result eq 'soju'}">
					<jsp:include page="itemlist_soju.jsp"/>
				</c:when>
				<c:when test="${result eq 'beer'}">
					<jsp:include page="imglist.jsp"/>
				</c:when>
				<c:when test="${result eq 'yangju'}">
					<jsp:include page="itemlist_yangju.jsp"/>
				</c:when>
				<c:otherwise> 
					<jsp:include page="list.jsp"/>	
				 </c:otherwise>
				</c:choose> 
		</div>
		
		<div class="extra"> <!-- Center _ right _ images start -->
		<jsp:include page="right_menu.jsp" />		
	</div> <!-- Center _ right _ images end -->		
		<jsp:include page="../common/bottom.jsp" />
	</div>
</body>
</html>