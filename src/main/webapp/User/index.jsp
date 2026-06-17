<%
if(session.getAttribute("userObj")==null){
	response.sendRedirect("../user_login.jsp");
	return;
}
%>

<%@page import="com.entity.User"%>
<%
User user = (User) session.getAttribute("userObj");

if (user == null) {
	response.sendRedirect("../user_login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<%@include file="../Component/allcss.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container p-5">

		<div class="card shadow">
			<div class="card-body text-center">

				<h2 class="text-success">
					Welcome
					<%=user.getFullName()%>
				</h2>

				<hr>

				<h5>Email :</h5>
				<p><%=user.getEmail()%></p>

				<a href="../userLogout" class="btn btn-danger"> Logout </a>

				<div class="row mt-4">

					<div class="col-md-4">

						<div class="card shadow text-center">

							<div class="card-body">

								<i class="fa-solid fa-calendar-check fa-3x text-success"></i>

								<h4 class="mt-2">Book Appointment</h4>

								<a href="../appointment.jsp" class="btn btn-success"> Book Now </a>

							</div>

						</div>

					</div>

				</div>

			</div>
		</div>

	</div>

</body>
</html>