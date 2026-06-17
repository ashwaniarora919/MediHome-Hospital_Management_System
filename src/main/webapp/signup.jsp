<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<%@include file="Component/allcss.jsp"%>
<style>
.card-body {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<%@include file="Component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card">
					<div class="card-body">

						<p class="fs-4 text-center">User Register</p>

						<form action="userRegister" method="post">

							<div class="mb-3">
								<label>Full Name</label> <input type="text" name="fullName"
									class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Email</label> <input type="email" name="email"
									class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Password</label> <input type="password" name="password"
									class="form-control" required>
							</div>

							<button class="btn btn-success col-md-12">Register</button>

						</form>

						<br> Already have an account? <a href="user_login.jsp">
							Login Here </a>

					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>