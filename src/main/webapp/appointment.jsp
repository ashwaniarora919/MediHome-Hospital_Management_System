<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.User"%>

<%
User user = (User) session.getAttribute("userObj");

if (user == null) {
	response.sendRedirect("user_login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointment</title>

<%@include file="Component/allcss.jsp"%>

<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>

	<%@include file="User/navbar.jsp"%>

	<div class="container p-3">

		<div class="row">

			<div class="col-md-6 offset-md-3">

				<div class="card paint-card">

					<div class="card-body">

						<p class="fs-3 text-center">Book Appointment</p>

						<form action="appointment" method="post">

							<%
							if (session.getAttribute("succMsg") != null) {
							%>

							<div class="alert alert-success" role="alert">
								<%=session.getAttribute("succMsg")%>
							</div>

							<%
							session.removeAttribute("succMsg");
							}
							%>

							<%
							if (session.getAttribute("errorMsg") != null) {
							%>

							<div class="alert alert-danger" role="alert">
								<%=session.getAttribute("errorMsg")%>
							</div>

							<%
							session.removeAttribute("errorMsg");
							}
							%>

							<input type="hidden" name="userId" value="<%=user.getId()%>">

							<div class="row">

								<div class="col-md-6">

									<label>Full Name</label> <input type="text"
										class="form-control" name="fullName" required>

								</div>

								<div class="col-md-6">

									<label>Gender</label> <select class="form-control"
										name="gender" required>

										<option value="">--Select--</option>

										<option>Male</option>

										<option>Female</option>

									</select>

								</div>

							</div>

							<div class="row mt-3">

								<div class="col-md-6">

									<label>Age</label> <input type="text" class="form-control"
										name="age" required>

								</div>

								<div class="col-md-6">

									<label>Appointment Date</label> <input type="date"
										class="form-control" name="appointmentDate" required>

								</div>

							</div>

							<div class="row mt-3">

								<div class="col-md-6">

									<label>Email</label> <input type="email" class="form-control"
										name="email" required>

								</div>

								<div class="col-md-6">

									<label>Phone No</label> <input type="text" class="form-control"
										name="phone" required>

								</div>

							</div>

							<div class="row mt-3">

								<div class="col-md-6">

									<label>Diseases</label> <input type="text" class="form-control"
										name="diseases" required>

								</div>

								<div class="col-md-6">

									<label>Doctor</label> <select class="form-control"
										name="doctorId" required>

										<option value="">--Select Doctor--</option>

										<%
										DoctorDAO dao = new DoctorDAO(DBConnect.getConn());

										List<Doctor> list = dao.getAllDoctors();

										for (Doctor d : list) {
										%>

										<option value="<%=d.getId()%>">
											<%=d.getFullName()%> (<%=d.getSpecialist()%>)
										</option>

										<%
										}
										%>

									</select>

								</div>

							</div>

							<div class="mt-3">

								<label>Full Address</label>

								<textarea rows="4" class="form-control" name="address" required></textarea>

							</div>

							<button class="btn btn-success col-md-12 mt-3">Book
								Appointment</button>

						</form>

					</div>

				</div>

			</div>

		</div>

	</div>

</body>
</html>