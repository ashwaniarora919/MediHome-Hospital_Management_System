
<%
if (session.getAttribute("adminObj") == null) {
	response.sendRedirect("../admin_login.jsp");
	return;
}
%>

<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.db.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../Component/allcss.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<h1 class="text-success text-center pt-3">Admin Dashboard</h1>

	<%
	DoctorDAO ddao = new DoctorDAO(DBConnect.getConn());

	UserDAO udao = new UserDAO(DBConnect.getConn());

	AppointmentDAO adao = new AppointmentDAO(DBConnect.getConn());

	int doctorCount = ddao.countDoctor();

	int userCount = udao.countUser();

	int appointmentCount = adao.countAppointment();
	%>

	<div class="d-inline-flex flex-wrap p-5 gap-5">

		<a href="view_doctor.jsp"
			style="text-decoration: none; color: inherit;">
			<div class="card shadow text-success text-center"
				style="width: 15rem; padding: 10px;">
				<i class="fa-solid fa-user-doctor fa-3x" style="align-self: center;"></i>
				<div class="card-body">
					<h5 class="card-title">Doctors</h5>
					<p class="card-text">
						<%=doctorCount%>
					</p>
				</div>
			</div>
			
			
		</a> <a href="view_users.jsp"
			style="text-decoration: none; color: inherit;">
			<div class="card shadow text-success text-center"
				style="width: 15rem; padding: 10px;">
				<i class="fa-solid fa-user fa-3x" style="align-self: center;"></i>
				<div class="card-body">
					<h5 class="card-title">Users</h5>
					<p class="card-text">
						<%=userCount%>
					</p>
				</div>
			</div>
			
			
		</a> <a href="view_appointments.jsp"
			style="text-decoration: none; color: inherit;">
			<div class="card shadow text-success text-center"
				style="width: 15rem; padding: 10px;">
				<i class="fa-solid fa-calendar fa-3x" style="align-self: center;"></i>
				<div class="card-body">
					<h5 class="card-title">Appointments</h5>
					<p class="card-text">
						<%=appointmentCount%>
					</p>
				</div>
			</div>
		</a>

		<!--		<div class="card text-success text-center"
			style="width: 15rem; padding: 10px;">
			<i class="fa-solid fa-calendar fa-3x" style="align-self: center;"></i>
			<div class="card-body">
				<h5 class="card-title">Specialists</h5>
				<p class="card-text">8</p>
			</div>
		</div>     -->
	</div>

</body>
</html>