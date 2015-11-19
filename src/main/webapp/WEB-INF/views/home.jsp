<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/taglib.jsp" %>
<%@ page session="false"%>
<html>
<head>

<title>Home Page</title>
</head>
<body background ="http://www.lancefarrow.ca/wp-content/uploads/2014/06/triangle-background-17.png" >
<body class="jumbotron">
	<nav class="navbar navbar-default navbar-fixed-top" id="my-navbar">
	<div align="center">
		<div class="container" >
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>				
				</button>	
				<a href="<c:url value='/authors/'/>"  class="navbar-brand">Authors</a>	
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse">
		
		<!-- Search bar -->			
				<div class="col-sm-3 col-md-3 pull-right">
				<c:url  var="action" value="/authors/" />
			        <form class="navbar-form" name="f" action="${action}" role="form" method="POST">
				        <div class="input-group">
				            <input type="text" class="form-control" placeholder="Search" name="search">
				            <div class="input-group-btn">
				                <button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-search"></i></button>
				            </div>
				        </div>
				        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
			        </form>
				</div>		
			        	 
		<!-- Trigger the modal with a button -->	   		           
			<security:authorize access="hasAuthority('ADMIN')">
  				<a href="<c:url value='/users/'/>" class="btn btn-success navbar-btn navbar-right btn-sm">Users</a>
       		</security:authorize>           			
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
		</div>		
	</nav>
	<%@ include file="layout/emptySpace.jsp" %>
	<div class="container text-center">		
				<h1 class="text-success">"Welcome to The Library"  
						<c:choose>
							<c:when test="${logged}">
								${user}
							</c:when>
			        		<c:otherwise>			        			
			        		</c:otherwise>
		        		</c:choose>			
				</h1>				
	</div>
	
	<%@ include file="layout/emptySpace2.jsp" %>
	<footer>
	<div class="container text-center">
	<div class="row">
       <div class="span12">
       		<div id="footer">
			
			<h6 class="fixed-bottom">&copy; Designed by SD 2015</h6>
		    </div>
		</div>
		</div>
	</div>
	</footer>	
</body>
</html>