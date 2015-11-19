<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp" %>
<%@ include file="../layout/nav-menu.jsp" %>
<body background ="http://www.lancefarrow.ca/wp-content/uploads/2014/06/triangle-background-17.png" >
	<form:form commandName="user" cssClass="form-horizontal registrationForm" >
	<div class="btn-group">	
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label"><h4 class="text-success">Name:</h4></label>
			<div class="col-sm-10">
				<form:input path="username" cssClass="form-control" placeholder="Enter name"/>
				<form:errors path="username" />
			</div>
		</div>
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label"><h4 class="text-success">Email:</h4></label>
			<div class="col-sm-10">
				<form:input path="email" cssClass="form-control" placeholder="Enter email"/>
				<form:errors path="email" />
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-sm-2 control-label"><h4 class="text-success">Password:</h4></label>
			<div class="col-sm-10">
				<form:password path="password" cssClass="form-control" placeholder="Enter password" />
				<form:errors path="password" />
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-sm-2 control-label"><h4 class="text-success">Password again:</h4></label>
			<div class="col-sm-10">
				<input type="password" name="password_again" id="password_again" class="form-control" placeholder="Repeat the password" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-2">			
				<form:form action="../users/${user.id_user}" method="POST" >
					<input type="submit" value="Save" class="btn btn-sm btn-success"/>										
				</form:form>	
			</div>
		</div>
		</div>
	</form:form>
<script type="text/javascript">
$(document).ready(function() {	
	$(".registrationForm").validate(
		{
			rules: {
				name: {
					required : true,
					minlength : 3,
					remote : {
						data: {
							username: function() {
								return $("#name").val();
							}
						}
					}
				},
				email: {
					required : true,
					email: true
				},
				password: {
					required : true,
					minlength : 5
				},
				password_again: {
					required : true,
					minlength : 5,
					equalTo: "#password"
				}
			},
			highlight: function(element) {
				$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
			},
			unhighlight: function(element) {
				$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
			},
			messages: {
				name: {
					remote: "Such username already exists!"
				}
			}
		}
	);
});
</script>

<%@ include file="../layout/footer.jsp" %>