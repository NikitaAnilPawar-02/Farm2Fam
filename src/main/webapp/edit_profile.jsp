<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm2Fam: Edit Profile</title>
<%@include file="all_component/allCSS.jsp"%>
<style type="text/css">
body {
	overflow-x: hidden;
}
</style>
</head>
<body style="background-color: #b9f6ca;">
	<%
	User u = (User) session.getAttribute("userobj");
	if (u == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>
	<!-- Start Navbar -->
	<%@include file="all_component/navbar.jsp"%>
	<!-- End Navbar -->
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card m-3">
					<div class="card-body">
						<h4 class="text-center">Edit Profile</h4>
						<%
						String updateMsg = (String) session.getAttribute("updateMsg");
						if (updateMsg != null) {
						%><div class="alert alert-primary text-center" role="alert">
							<%=updateMsg%>
						</div>
						<%
						session.removeAttribute("updateMsg");
						}
						%>
						<form action="update_profile" method="post">
							<input type="hidden" value="<%=u.getId()%>" name="id">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Name</label>
								<input type="text"
									class="form-control  border border-2 border-success-subtle"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="name" value="">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
									No</label> <input type="tel" pattern="[7-9]{1}[0-9]{9}"
									class="form-control border border-2 border-success-subtle"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="phnno" value="">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email"
									class="form-control border border-2 border-success-subtle"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email" value="">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password"
									class="form-control border border-2 border-success-subtle"
									id="exampleInputPassword1" required="required" name="password">
								<div id="passwordHelpBlock" class="form-text">Enter your
									current password to update your profile.</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-outline-success">Update</button>
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