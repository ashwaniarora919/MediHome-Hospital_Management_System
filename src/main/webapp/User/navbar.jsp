<%@page import="com.entity.User"%>

<%
User u = (User) session.getAttribute("userObj");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success">

	<div class="container-fluid">

		<a class="navbar-brand" href="index.jsp"> USER PANEL </a>

		<ul class="navbar-nav ms-auto">

			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/User/index.jsp">

					Home </a></li>

			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/appointment.jsp"> Book Appointment </a></li>

			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/User/view_appointment.jsp"> My Appointments </a></li>

		</ul>

		<div class="dropdown">

			<button class="btn btn-light dropdown-toggle"
				data-bs-toggle="dropdown">

				<%=u.getFullName()%>

			</button>

			<ul class="dropdown-menu">

				<li><a class="dropdown-item" href="<%=request.getContextPath()%>/userLogout"> Logout </a>
				</li>

			</ul>

		</div>

	</div>

</nav>