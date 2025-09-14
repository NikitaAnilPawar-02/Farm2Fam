<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm2Fam: Login</title>
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
						<h4 class="text-center">LOGIN</h4>
						<%
						String loginStatus = (String) session.getAttribute("loginStatus");
						if (loginStatus != null) {
						%><div class="alert alert-danger text-center" role="alert">
							<%=loginStatus%>
						</div>
						<%
						session.removeAttribute("loginStatus");
						}
						%>
						<form action="LoginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email"
									class="form-control border border-2 border-success-subtle"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="email">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password"
									class="form-control border border-2 border-success-subtle"
									id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-outline-success">Login</button>
								<br>
								<br> <a href="register.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>