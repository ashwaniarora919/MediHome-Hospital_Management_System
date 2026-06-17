<%
if(session.getAttribute("adminObj")==null){
	response.sendRedirect("../admin_login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Doctor</title>

<%@include file="../Component/allcss.jsp"%>

</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container p-5">

		<div class="row">

			<div class="col-md-5 offset-md-3">

				<div class="card">

					<div class="card-body">

						<p class="fs-3 text-center">Add Doctor</p>

						<%
						String succMsg = (String) session.getAttribute("succMsg");

						if (succMsg != null) {
						%>

						<p class="text-center text-success">
							<%=succMsg%>
						</p>

						<%
						session.removeAttribute("succMsg");
						}
						%>

						<form action="../addDoctor" method="post">

							<div class="mb-3">
								<label>Full Name</label> <input type="text" name="fullName"
									required class="form-control">
							</div>

							<div class="mb-3">
								<label>Email</label> <input type="email" name="email" required
									class="form-control">
							</div>

							<div class="mb-3">
								<label>Password</label> <input type="password" name="password"
									required class="form-control">
							</div>

							<div class="mb-3">
								<label>Specialist</label> <input type="text" name="specialist"
									required class="form-control">
							</div>

							<button class="btn btn-success col-md-12">Add Doctor</button>

						</form>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>