<%@page import="com.DAO.ContactsDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.Contacts"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Contacts</title>
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
		<table class="table table-striped">
			<thead class="table-dark">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Phone No</th>
					<th scope="col">Email</th>
					<th scope="col">Message</th>
				</tr>
			</thead>
			<tbody>
				<%
				ContactsDAOImpl dao = new ContactsDAOImpl(DBConnect.getConn());
				List<Contacts> contacts = dao.getAllContacts();
				for (Contacts c : contacts) {
				%>
				<tr>
					<th scope="row"><%=c.getId()%></th>
					<td><%=c.getName()%></td>
					<td><%=c.getPhone_number()%></td>
					<td><%=c.getEmail()%></td>
					<td><%=c.getMessage()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>