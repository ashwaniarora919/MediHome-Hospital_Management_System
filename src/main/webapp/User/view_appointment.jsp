<%
if(session.getAttribute("userObj")==null){
	response.sendRedirect("../user_login.jsp");
	return;
}
%>

<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.db.DBConnect"%>

<%
User user=(User)session.getAttribute("userObj");

if(user==null){
	response.sendRedirect("../user_login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Appointments</title>

<%@include file="../Component/allcss.jsp"%>

</head>
<body>

<%@include file="navbar.jsp"%>

<div class="container p-4">

<h3 class="text-center text-success">
My Appointments
</h3>

<table class="table table-bordered">

<thead>

<tr>

<th>Doctor Name</th>
<th>Specialist</th>
<th>Date</th>
<th>Disease</th>
<th>Status</th>

</tr>

</thead>

<tbody>

<%

AppointmentDAO dao =
new AppointmentDAO(DBConnect.getConn());

DoctorDAO ddao =
new DoctorDAO(DBConnect.getConn());

List<Appointment> list =
dao.getAllAppointmentByLoginUser(user.getId());

for(Appointment ap:list){

Doctor d =
ddao.getDoctorById(ap.getDoctorId());

%>

<tr>

<td><%=d.getFullName()%></td>

<td><%=d.getSpecialist()%></td>

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