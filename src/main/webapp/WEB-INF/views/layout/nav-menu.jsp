<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<!-- ... -->
<title>Home Page</title>
</head>
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
					<li><a href="<c:url value='/authors/'/>">Authors</a></li>
					<li><a href="<c:url value='/login'/>">Login</a></li>
					<li><a href="<c:url value='/register/'/>">Register</a></li>							
				</ul>
			</div>			
		</div>		
	</nav>	
	<br/><br/><br/><br/><br/>