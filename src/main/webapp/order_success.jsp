<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm2Fam: Successful</title>
<%@include file="all_component/allCSS.jsp"%>
<style type="text/css">
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
	<%@include file="all_component/navbar.jsp"%>
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>You Ordered Successfully</h2>
		<h5>With in 7 Days Your Product will be Delivered in Your Address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> <a
			href="orders.jsp" class="btn btn-warning mt-3">View Order</a>
	</div>
	<!-- Start Footer -->
	<div class="pt-5"><%@include file="all_component/footer.jsp"%></div>
	<!-- End Footer -->
</body>
</html>