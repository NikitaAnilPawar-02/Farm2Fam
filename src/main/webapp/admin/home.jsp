<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Home</title>
<%@include file="allCSS.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black
}

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

	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_products.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
							<h4>Add Products</h4>
							----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_products.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-seedling fa-3x text-success"></i><br>
							<h4>All Products</h4>
							----------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="contacts.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-comments fa-3x text-info"></i><br>
							<h4>Contacts</h4>
							----------
						</div>
					</div>
				</a>
			</div>
		</div>
		
		<div class="row px-5">
			<div class="col-md-3">
				<a href="users.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-users fa-3x text-secondary"></i><br>
							<h4>Users</h4>
							----------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>