<%
if(session.getAttribute("adminObj")==null){
	response.sendRedirect("../admin_login.jsp");
	return;
}
%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.db.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Doctors</title>

<%@include file="../Component/allcss.jsp"%>

</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container p-4">

		<div class="card">

			<div class="card-body">

				<h3 class="text-center text-success">View Doctors</h3>

				<table class="table table-bordered table-striped">

					<thead class="table-success">

						<tr>
							<th>ID</th>
							<th>Full Name</th>
							<th>Email</th>
							<th>Password</th>
							<th>Specialist</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

						<%
						DoctorDAO dao = new DoctorDAO(DBConnect.getConn());

						List<Doctor> list = dao.getAllDoctors();

						for (Doctor d : list) {
						%>

						<tr>

							<td><%=d.getId()%></td>

							<td><%=d.getFullName()%></td>

							<td><%=d.getEmail()%></td>

							<td><%=d.getPassword()%></td>

							<td><%=d.getSpecialist()%></td>

							<td><a href="edit_doctor.jsp?id=<%=d.getId()%>"
								class="btn btn-sm btn-primary"> Edit </a> <a
								href="../deleteDoctor?id=<%=d.getId()%>"
								class="btn btn-sm btn-danger"
								onclick="return confirm('Delete this doctor?')"> Delete </a></td>

						</tr>

						<%
						}
						%>

					</tbody>

				</table>

			</div>

		</div>

	</div>

</body>
</html>