<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp" %>
<title>Home Page</title>
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
			
			<div class="col-sm-3 col-md-3 pull-right">
				<c:url  var="action" value="/users/" />
			        <form class="navbar-form" name="f" action="${action}" role="form" method="POST">
				        <div class="input-group">
				            <input type="text" class="form-control" placeholder="Search User" name="search">
				            <div class="input-group-btn">
				                <button class="btn btn-success" type="submit"><i class="glyphicon glyphicon-search"></i></button>
				            </div>
				        </div>
				        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
			        </form>
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
	<%@ include file="../layout/emptySpace.jsp" %>
	<c:choose>
		<c:when test="${emptyListOfUsers}">
			<h3 class="text-center">The list of users is empty!!!</h3>
		</c:when>
	<c:otherwise>						
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th><h3>User Name</h3></th>
				</tr>
			</thead>
			<tbody>
				<security:authorize access="hasAuthority('ADMIN')">
				<c:forEach items="${users}" var="user">
					<tr>
						<td>
							<h4>  <a href='<spring:url value="${user.id_user}/comments"></spring:url>'>
								${user.username}
								</a>
								</h4>				
						</td>			
					</tr>
				</c:forEach>
				</security:authorize>
				<security:authorize access="hasAuthority('USER')">	
				<c:forEach items="${users}" var="user">			
					<tr>
						<td>
							<h4>  <a href='<spring:url value="${user.id_user}/comments"></spring:url>'>
								${userDetails}
								</a>
							</h4>				
						</td>			
					</tr>
					</c:forEach>c:forEach >
				</security:authorize>				
			</tbody>
		</table>
	</c:otherwise>
</c:choose>
<%@ include file="../layout/footer.jsp" %>
