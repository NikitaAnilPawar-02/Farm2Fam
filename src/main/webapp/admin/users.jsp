<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Users</title>
<%@include file="allCSS.jsp"%>
<style type="text/css">
body {
	overflow-x: hidden;
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	if (u == null) {
		response.sendRedirect("../login.jsp");
		return;
	}
	%>
	<!-- Navbar -->
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>
	<div class="container-fluid my-4">
	<table class="table text-center">
			<thead class="table-primary">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Phone No</th>
					<th scope="col">Email</th>
				</tr>
			</thead>
			<tbody>
			<%
			UserDAOImpl userDao = new UserDAOImpl(DBConnect.getConn());
			List<User> userList = userDao.getAllUsers();
			for (User us : userList) {
			%>
			<tr>
				<td scope="row"><%=us.getId()%></td>
				<td><%=us.getName()%></td>
				<td><%=us.getPhnno()%></td>
				<td><%=us.getEmail()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	</div>
</body>
</html>