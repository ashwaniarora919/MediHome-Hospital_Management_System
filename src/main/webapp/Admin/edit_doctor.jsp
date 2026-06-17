<%
if(session.getAttribute("adminObj")==null){
	response.sendRedirect("../admin_login.jsp");
	return;
}
%>

<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.db.DBConnect"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

DoctorDAO dao = new DoctorDAO(DBConnect.getConn());

Doctor d = dao.getDoctorById(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor</title>

<%@include file="../Component/allcss.jsp"%>

</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container p-4">

		<div class="row">

			<div class="col-md-6 offset-md-3">

				<div class="card">

					<div class="card-body">

						<h3 class="text-center text-success">Edit Doctor</h3>

						<form action="../updateDoctor" method="post">

							<input type="hidden" name="id" value="<%=d.getId()%>">

							<div class="mb-3">

								<label>Full Name</label> <input type="text" name="fullname"
									value="<%=d.getFullName()%>" class="form-control" required>

							</div>

							<div class="mb-3">

								<label>Email</label> <input type="email" name="email"
									value="<%=d.getEmail()%>" class="form-control" required>

							</div>

							<div class="mb-3">

								<label>Password</label> <input type="text" name="password"
									value="<%=d.getPassword()%>" class="form-control" required>

							</div>

							<div class="mb-3">

								<label>Specialist</label> <input type="text" name="specialist"
									value="<%=d.getSpecialist()%>" class="form-control" required>

							</div>

							<button class="btn btn-success col-md-12">Update Doctor

							</button>

						</form>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>