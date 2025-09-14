<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm2Fam: Add Address</title>
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
	<!-- Start Navbar -->
	<%@include file="all_component/navbar.jsp"%>
	<!-- End Navbar -->
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card m-3">
					<div class="card-body">
						<h4 class="text-center">Add Address</h4>
						<form action="">
							<div class="row pt-2">
								<div class="col">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>
								<div class="col">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>

							</div>
							<div class="row pt-2">
								<div class="col">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>
								<div class="col">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								<div class="col">
									<label for="inputPassword4">Pin Code</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>

							</div>
							<div class="pt-3 text-center">
								<a href="" class="btn btn-warning me-2">Add Address</a>
							</div>
						</form>
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