<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm2Fam: Setting</title>
<%@include file="all_component/allCSS.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

body {
	overflow-x: hidden;
}
</style>
</head>
<body>
	<%
	User user = (User) session.getAttribute("userobj");
	if (user == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>
	<!-- Start Navbar -->
	<%@include file="all_component/navbar.jsp"%>
	<!-- End Navbar -->
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container">
		<h3 class="text-center mt-5">
			Hello,
			<%=u.getName()%></h3>
		<div class="row p-5">
		<!-- 	<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary m-2">
								<i class="fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h4 class="m-4">Edit Profile</h4>
						</div>
					</div>
				</a>
			</div> -->
			<div class="col-md-6">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning m-2">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4 class="m-4">My Orders</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success m-2">
								<i class="fa-solid fa-headset fa-3x"></i>
							</div>
							<h4 class="m-4">Help Center</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- Start Footer -->
	<%@include file="all_component/footer.jsp"%>
	<!-- End Footer -->
</body>
</html>