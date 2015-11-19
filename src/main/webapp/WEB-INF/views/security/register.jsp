<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<title>SoftServe Library Login page</title>
</head>
<body background ="http://www.lancefarrow.ca/wp-content/uploads/2014/06/triangle-background-17.png" >
<body>
	<div class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<ul class="nav navbar-nav">
					<li><a href="/MyLibrary/authors/">Authors</a></li>
					<li><a href="/MyLibrary/login/">Login</a></li>
					<li><a href="/MyLibrary/register/">Register</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div align="center">
	<div class="containter-fluid">
		<form:form modelAttribute="user" class="form-horizontal" role="form">
			<div>
				<div>
					<div class="register-form">
						<form action="/register" method="post" class="form-horizontal">
							<c:if test="${param.error != null}">
								<div class="alert alert-danger">
									<p>Invalid username and password.</p>
								</div>
							</c:if>
							<form:input type="hidden" path="id_user" id="id" />
							<div class="input-group input-sm">
								<div class="col-md-2">
									<label for="username" class="input-group-addon">Username:</label>
								</div>
								<div class="col-md-10">
									<form:input path="username" id="username" class="form-control"
										autocomplete="off" />
									<form:errors path="username" />
								</div>
							</div>
							<div class="input-group input-sm">
								<div class="col-md-2">
									<label for="password" class="input-group-addon">Password:</label>
								</div>
								<div class="col-md-10">
									<form:input path="password" id="password" class="form-control"
										autocomplete="off" />
									<form:errors path="password" />
								</div>
							</div>
							
							<div class="input-group input-sm">
								<div class="col-md-2">
									<label for="email" class="input-group-addon">Email:</label>
								</div>
								<div class="col-md-10">
									<form:input path="email" id="email" class="form-control"
										autocomplete="off" type="email" />
									<form:errors path="email" />
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="form-actions">
								<input type="submit"
									class="btn btn-block btn-primary btn-default" value="Register">
							</div>
						</form>
					</div>
				</div>
			</div>
		</form:form>
	</div>
	</div>
</body>
</html>