<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm2Fam: Helpline</title>
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

	<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4 text-center">
				<div class="card">
					<div class="card-body">
						<div class="text-center text-success">
							<i class="fa-solid fa-square-phone fa-5x"></i>
						</div>
						<h3 class="mt-3">24*7 Services</h3>
						<h4>Help Line Number</h4>
						<h5>+1234567890</h5>
						<a href="index.jsp" class="btn btn-primary mt-2">Home</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Start Footer -->
	<%@include file="all_component/footer.jsp"%>
	<!-- End Footer -->
</body>
</html>