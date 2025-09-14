<%@page import="com.entity.User"%>
<div class="container-fluid"
	style="height: 10px; background-color: #00e676"></div>
<div class="container-fluid p-2 bg-light">
	<div class="row align-items-center">
		<div class="col-md-3">
			<h3 class="fw-bolder">
				<i class="fa-solid fa-shop"></i> Farm2Fam
			</h3>
		</div>
		<div class="col-md-6"></div>
		<div class="col-md-3 mt-2 mt-md-0 d-flex justify-content-end">
			<%
			User user = (User) session.getAttribute("userobj");
			if (user != null) {
			%>
			<span class="me-3 mt-1"><b>Welcome, <%=user.getName()%></b></span> <a
				data-bs-toggle="modal" data-bs-target="#logoutModal">
				<button type="submit" class="btn btn-danger me-2 fw-bolder">
					<i class="fa-solid fa-sign-out"></i> Logout
				</button>

			</a>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="logoutModal" tabindex="-1"
			aria-labelledby="logoutModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="logoutModalLabel">Logout</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">Are you sure you want to logout?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancel</button>
						<form action="/FarmersE-Market/LogoutServlet" method="post">
							<button type="submit" class="btn btn-danger">Logout</button>
						</form>
					</div>
				</div>
			</div>


			<%
			} else {
			%>
			<a href="/FarmersE-Market/login.jsp"
				class="btn btn-primary me-2 fw-bolder"><i
				class="fa-solid fa-right-to-bracket"></i> Login</a> <a
				href="/FarmersE-Market/register.jsp"
				class="btn btn-success fw-bolder"><i
				class="fa-solid fa-user-plus"></i> Register</a>

			<%
			}
			%>
		</div>
	</div>
</div>



<nav class="navbar navbar-expand-lg bg-custom">
	<div class="container-fluid fw-bolder">
		<a class="navbar-brand" href="home.jsp"><i
			class="fa-solid fa-house" style="color: #ffffff;"></i></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link custom-nav-link"
					aria-current="page" href="home.jsp">Home</a></li>
			</ul>
		</div>
	</div>
</nav>