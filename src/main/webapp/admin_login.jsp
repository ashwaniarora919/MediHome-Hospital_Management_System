<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<%@include file="Component/allcss.jsp"%>
<style type="text/css">
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
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-4 text-center">Admin Login</p>

						<%
						String errorMsg = (String) session.getAttribute("errorMsg");

						if (errorMsg != null) {
						%>

						<div class="alert alert-danger text-center">
							<%=errorMsg%>
						</div>

						<%
						session.removeAttribute("errorMsg");
						}
						%>

						<form action="adminLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email Address</label> <input required
									name="email" type="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>