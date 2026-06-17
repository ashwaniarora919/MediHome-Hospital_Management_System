<%@page import="com.entity.Doctor"%>

<%
Doctor d = (Doctor) session.getAttribute("docObj");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">

	<div class="container-fluid">

		<a class="navbar-brand" href="index.jsp"> DOCTOR PANEL </a>

		<ul class="navbar-nav ms-auto">

			<li class="nav-item"><a class="nav-link" href="index.jsp">

					Home </a></li>

			<li class="nav-item"><a class="nav-link" href="patient.jsp">

					Patients </a></li>

		</ul>

		<div class="dropdown">

			<button class="btn btn-light dropdown-toggle"
				data-bs-toggle="dropdown">

				<%=d.getFullName()%>

			</button>

			<ul class="dropdown-menu">

				<li><a class="dropdown-item" href="../doctorLogout"> Logout

				</a></li>

			</ul>

		</div>

	</div>

</nav>