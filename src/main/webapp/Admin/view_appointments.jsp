<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.db.DBConnect"%>

<%
if(session.getAttribute("adminObj")==null){
	response.sendRedirect("../admin_login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Appointments</title>
<%@include file="../Component/allcss.jsp"%>
</head>
<body>

<%@include file="navbar.jsp"%>

<div class="container p-4">

	<h3 class="text-center text-success mb-4">
		All Appointments
	</h3>

	<table class="table table-bordered table-striped">

		<thead class="table-success">

			<tr>
				<th>ID</th>
				<th>Patient</th>
				<th>Gender</th>
				<th>Age</th>
				<th>Date</th>
				<th>Disease</th>
				<th>Status</th>
			</tr>

		</thead>

		<tbody>

			<%
			AppointmentDAO dao =
			new AppointmentDAO(DBConnect.getConn());

			List<Appointment> list =
			dao.getAllAppointments();

			for(Appointment ap:list){
			%>

			<tr>
				<td><%=ap.getId()%></td>
				<td><%=ap.getFullName()%></td>
				<td><%=ap.getGender()%></td>
				<td><%=ap.getAge()%></td>
				<td><%=ap.getAppointmentDate()%></td>
				<td><%=ap.getDiseases()%></td>
				<td><%=ap.getStatus()%></td>
			</tr>

			<%
			}
			%>

		</tbody>

	</table>

</div>

</body>
</html>