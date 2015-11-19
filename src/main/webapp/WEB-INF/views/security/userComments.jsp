<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>University Enrollments</title>

<style type="text/css">
    <%@include file="../libs/css/bootstrap-theme.min.css" %>
    <%@include file="../libs/css/bootstrap.min.css" %>
</style>
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
					<li><a href="<c:url value='/authors/${author.id}/books/'/>">Books</a></li>
					<li><a href="<c:url value='/register/'/>">Register</a></li>									
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
    <h2 class="text-warning">${user.username}/List of Comments</h2>  
    <div class="btn-group">			
			<c:choose>
				<c:when test="${isEmptyComment}">
					<h3 class="text-center">The list of comments is empty!!!</h3>
				</c:when>
        		<c:otherwise>
        		<table class="table">
        			<tr>
        				<th>Book</th>
           				<th>Comment</th>
        			</tr>
						<c:forEach items="${comments}" var="comment">
						<tr>
			            	<td>${comment.book.title}</td>
			            	<td>${comment.comment}</td>
						</tr>       
						</c:forEach>
					</table>
				</c:otherwise>		
			</c:choose>
		</div>
    <br/>			
	</div>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>		
</body>
</html>
</body>
</html>