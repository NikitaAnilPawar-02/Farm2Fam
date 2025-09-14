<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm2Fam: Register</title>
<%@include file="all_component/allCSS.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
}

body {
	overflow-x: hidden;
}
</style>

</head>
<body style="background-color: #b9f6ca;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">REGISTER</h4>
						<%
						String registrationStatus = (String) session.getAttribute("registrationStatus");
						if (registrationStatus != null) {
						%><div class="alert alert-primary text-center" role="alert">
							<%=registrationStatus%>
						</div>
						<%
						session.removeAttribute("registrationStatus");
						}
						%>
						<form action="RegisterServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Name</label>
								<input type="text"
									class="form-control  border border-2 border-success-subtle"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									pattern="[A-Za-z\s]+" required="required" name="name">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone
									No</label> <input type="tel" pattern="[7-9]{1}[0-9]{9}"
									class="form-control border border-2 border-success-subtle"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="phnno">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email"
									class="form-control border border-2 border-success-subtle"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password"
									class="form-control border border-2 border-success-subtle"
									id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-outline-success">Register</button>
								<div class="pt-2">
									Already Registered? Please <a href="login.jsp">Login</a>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>