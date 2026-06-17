<%@page import="java.util.List"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="com.entity.User"%>
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
<title>View Users</title>
<%@include file="../Component/allcss.jsp"%>
</head>
<body>

<%@include file="navbar.jsp"%>

<div class="container p-4">

	<h3 class="text-center text-success mb-4">
		All Users
	</h3>

	<table class="table table-bordered table-striped">

		<thead class="table-success">

			<tr>
				<th>ID</th>
				<th>Full Name</th>
				<th>Email</th>
			</tr>

		</thead>

		<tbody>

			<%
			UserDAO dao = new UserDAO(DBConnect.getConn());

			List<User> list = dao.getAllUsers();

			for(User u:list){
			%>

			<tr>
				<td><%=u.getId()%></td>
				<td><%=u.getFullName()%></td>
				<td><%=u.getEmail()%></td>
			</tr>

			<%
			}
			%>

		</tbody>

	</table>

</div>

</body>
</html>