<%
if(session.getAttribute("docObj")==null){
	response.sendRedirect("../doctor_login.jsp");
	return;
}
%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>

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
<title>Patients</title>
<%@include file="../Component/allcss.jsp"%>
</head>

<body>

	<%@include file="navbar.jsp"%>

	<div class="container p-4">

		<h3 class="text-center text-success">Patient Appointments</h3>

		<table class="table table-bordered">

			<thead>

				<tr>
					<th>Full Name</th>
					<th>Gender</th>
					<th>Age</th>
					<th>Date</th>
					<th>Disease</th>
					<th>Status</th>
				</tr>

			</thead>

			<tbody>

				<%
				AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());

				List<Appointment> list = dao.getAppointmentsByDoctorId(doc.getId());

				for (Appointment ap : list) {
				%>

				<tr>

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