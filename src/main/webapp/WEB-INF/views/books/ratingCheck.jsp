<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
    <%@include file="../libs/css/bootstrap-theme.min.css" %>
    <%@include file="../libs/css/bootstrap.min.css" %>
</style>
<link rel="stylesheet"
	href="../../../../resources/rating-plugin/css/star-rating.min.css"
	media="all" rel="stylesheet" type="text/css" />
<title>Rating Check</title>
</head>
<body background ="http://www.lancefarrow.ca/wp-content/uploads/2014/06/triangle-background-17.png" >
<body class="jumbotron">
	<nav class="navbar navbar-default navbar-fixed-top" id="my-navbar">
		<div class="container" >
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>			
				</button>	
				<a href="<c:url value='/'/>"  class="navbar-brand">Home</a>	
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value='/authors/' />">Authors</a></li>	
									
					<security:authorize access="!isAuthenticated()">
						<li><a href="<c:url value='/login'/>">Login</a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<li><a href="<c:url value='/logout'/>" >Logout</a></li>
					</security:authorize>
				</ul>				
			</div>			
		</div>		
	</nav>
	<div align="center">
	<div class="container text-center"">

		<div class="row">
			<div class="col-md-3 col-xs-6 text-center">
				<h2>Title</h2>
			</div>
			<div class="col-md-3 col-xs-6 text-center">
				<h2>Status</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-xs-6 text-center">
				<h4>${book.title}</h4>
			</div>
			<div class="col-md-3 col-xs-6 text-center">
				<h4>${book.status}</h4>
			</div>
		</div>
		<div class="row">
			<input id="input-21f" class="form-control rating" min='1' max='5'
				step='0.1' data-size="lg" type="number" />
		</div>
		<br /> <a href="<c:url value='../' />"> <img
			class="img-responsive"
			src="http://cdn.mysitemyway.com/etc-mysitemyway/icons/legacy-previews/icons/glowing-green-neon-icons-media/111645-glowing-green-neon-icon-media-a-media31-back.png"
			alt="Back" height="42" width="42">
		</a>
	</div>
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="../../../../resources/rating-plugin/js/star-rating.min.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$('#input-21f').rating('create', {
			disabled : true
		});
		$('#input-21f').rating('update', '${book.averageRating}');
	</script>
</body>
</html>