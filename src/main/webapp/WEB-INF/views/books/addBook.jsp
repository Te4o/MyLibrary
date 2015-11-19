<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Registration Form</title>

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
			
				</ul>
			</div>			
		</div>		
	</nav>
	<div align="center">
	<div>
		<h2 class="text-success">Add Book</h2>	
		<form:form modelAttribute="book">
			<form:input type="hidden" path="id" id="id" />
			<table>
				<tr>
					<td><label for="title">Title: </label></td>
					<td><form:input path="title" id="title" /></td>
					<td><form:errors path="title" cssClass="error" /></td>
				</tr>
				<tr>
					<td><label for="status">Status: </label></td>
					<td><form:input path="status" id="status" /></td>
					<td><form:errors path="status" cssClass="error" /></td>
				</tr>
	
				<tr>
					<td colspan="3"><c:choose>
							<c:when test="${edit}">
								<form:form action="../${author.id}/books/${book.id}" method="PUT">
									<input type="submit" value="Update" class="btn btn-sm btn-success"/>
								</form:form>
							</c:when>
							<c:otherwise>
								<form:form action="../${author.id}/books/new" method="POST">
									<input type="submit" value="Add" class="btn btn-sm btn-success" />
								</form:form>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</form:form>
		<br />	
	</div>
	</div>	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>	
	
</body>
</html>