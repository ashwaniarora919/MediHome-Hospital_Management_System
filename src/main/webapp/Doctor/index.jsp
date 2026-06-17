
<%
if (session.getAttribute("docObj") == null) {
	response.sendRedirect("../doctor_login.jsp");
	return;
}
%>

<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Doctor doc = (Doctor) session.getAttribute("docObj");

if (doc == null) {
	response.sendRedirect("../doctor_login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard</title>

<%@include file="../Component/allcss.jsp"%>

<style>
.card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container p-4">

		<h2 class="text-center text-success">
			Welcome Dr.
			<%=d.getFullName()%>
		</h2>

		<p class="text-center">
			Specialist : <b><%=d.getSpecialist()%></b>
		</p>

		<div class="row mt-4">

			<div class="col-md-4">
				<a href="patient.jsp" style="text-decoration: none; color: inherit;">
					<div class="card text-center">
						<div class="card-body">
							<i class="fa-solid fa-calendar-check fa-3x text-success"></i>
							<h4 class="mt-3">Appointments</h4>
							<p>View Patient Appointments</p>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<div class="card text-center">
					<div class="card-body">
						<i class="fa-solid fa-user-doctor fa-3x text-success"></i>
						<h4 class="mt-3">Doctor Profile</h4>
						<p><%=d.getFullName()%></p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card text-center">
					<div class="card-body">
						<i class="fa-solid fa-stethoscope fa-3x text-success"></i>
						<h4 class="mt-3">Specialization</h4>
						<p><%=d.getSpecialist()%></p>
					</div>
				</div>
			</div>

		</div>

	</div>

</body>
</html>