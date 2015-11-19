<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 

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
<body class="jumbotron" >
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
					<li><a href="<c:url value='/authors/' />">Back to Authors</a></li>			
				</ul>
			</div>			
		</div>		
	</nav>
	
	<div class="col-sm-4">
	<div class="container text-center">
		<h2 class="text-success">Create Author</h2>
		<div class="btn-group">
			<form:form modelAttribute="author" >
				<form:input type="hidden" path="id" id="id" />
				<div >
					<table class="table" >				
						<tr>
							<td><label for="name"><h4 class="text-success">Name: </h4></label></td>
							<td><form:input path="name" id="name" /></td>
							<td><form:errors path="name" cssClass="error" /></td>
						</tr>
						<tr>
							<td><label for="country"><h4 class="text-success">Country: </h4></label></td>
							<td><form:input path="country" id="country" /></td>
							<td><form:errors path="country" cssClass="error" /></td>						
						</tr>				
						<tr>						
							<td colspan="2">										
								<c:choose>
									<c:when test="${edit}">    							
										<form:form action="../authors/${author.id}" method="PUT" >
												<input type="submit" value="Update" class="btn btn-sm btn-success"/>										
										</form:form>								
									</c:when>
									<c:otherwise>
										<form:form action="../authors/new" method="GET">
											<input type="submit" value="Add" class="btn btn-sm btn-success"/>
										</form:form>										
									</c:otherwise>
								</c:choose>								
							</td>						
						</tr>
					</table>
				</div>
			</form:form>
		</div>
	</div>
	</div>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>		
	
</body>
</html>