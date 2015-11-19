<%@ page import="org.springframework.util.StringUtils"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ include file="../layout/taglib.jsp" %>
<html>
<head>
<title>University Enrollments</title>

</head>
<body background ="http://www.lancefarrow.ca/wp-content/uploads/2014/06/triangle-background-17.png" >
<body class="jumbotron">
	<nav class="navbar navbar-default navbar-fixed-top" id="my-navbar">
		<div class="container " >
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>			
				</button>	
				<a href="<c:url value='/'/>"  class="navbar-brand">Home</a>	
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse">
			
				<!-- Search bar -->
				<div class="col-sm-3 col-md-3 pull-right">
				<c:url  var="action" value="/authors/" />
			        <form class="navbar-form" name="f" action="${action}" role="form" method="POST">
				        <div class="input-group">
				            <input type="text" class="form-control" placeholder="Search Author" name="search">
				            <div class="input-group-btn">
				                <button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-search"></i></button>
				            </div>
				        </div>
				        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
			        </form>
				</div>		    
			    <ul class="nav navbar-nav">
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
		<h2 class="text-info">List of Authors</h2>
		
	
		<div class="btn-group">
			<c:choose>
				<c:when test="${emptyListOfAuthors}">
					<h3 class="text-center">The list of authors is empty!!!</h3>
				</c:when>
				<c:otherwise>			
					<table class="table">
						<tr>
							<th>Name</th>
							<th>Country</th>
						</tr>
						<c:forEach items="${authors}" var="author">
							<tr>
								<td>${author.name}</td>
								<td>${author.country}</td>
								<security:authorize access="hasAnyAuthority('USER','ADMIN')">
								<td><form:form action="../authors/${author.id}"
										method="GET">
										<input type="submit" value="Edit" class="btn btn-sm btn-info"/>
									</form:form></td>
								<td><form:form action="../authors/${author.id}"
										method="DELETE">
										<input type="submit" value="Delete" class="btn btn-sm btn-danger"/>
									</form:form></td>
								<td>
								</security:authorize>
								<td><form:form action="../authors/${author.id}/books"
										method="GET">
										<input type="submit" value="List of books" class="btn btn-sm btn-warning" />
									</form:form>
								</td>
							</tr>								
						</c:forEach>
					</table>
				</c:otherwise>		
			</c:choose>
		</div>
		<br />
		<security:authorize access="hasAnyAuthority('USER','ADMIN')">
			<a href="<c:url value='../authors/new' />" class="btn btn-sm btn-info">Add New Author</a>	
		</security:authorize>	
	</div>	
<!-- <tg:paging pagedLink="${pagedLink}" pagedListHolder="${pagedListHolder}"></tg:paging>
	 -->	

</body>
</html>