<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.DAO.CartDAO"%>
<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.entity.User"%>
<div class="container-fluid"
	style="height: 10px; background-color: #00e676"></div>
<div class="container-fluid p-2 bg-light">
	<div class="row align-items-center">
		<div class="col-md-3">
			<h3 class="fw-bolder">
				<i class="fa-solid fa-shop"></i> Farm2Fam
			</h3>
		</div>
		<div class="col-md-6">
			<form action="search.jsp" method="post" class="d-flex" role="search">
				<input class="form-control me-2" name="ch" type="search"
					placeholder="Search for Products......." aria-label="Search">
				<button class="btn btn-outline-dark" type="submit">Search</button>
			</form>
		</div>
		<div
			class="col-md-3 mt-2 mt-md-0 d-flex justify-content-center justify-content-md-end">
			<%
			User us = (User) session.getAttribute("userobj");
			%>

			<%
			if (us == null) {
			%>
			<a href="login.jsp" class="btn btn-primary me-2 fw-bolder"> <i
				class="fa-solid fa-right-to-bracket"></i> Login
			</a> <a href="register.jsp" class="btn btn-success fw-bolder"> <i
				class="fa-solid fa-user-plus"></i> Register
			</a>
			<%
			} else {
			CartDAOImpl cartDAO = new CartDAOImpl(DBConnect.getConn());
			List<Cart> cartItems = cartDAO.getProductByUser(us.getId());
			int cartItemCount = cartItems.size();
			%>
			<a href="checkout.jsp"
				class="btn btn-success me-2 fw-bolder position-relative"> <i
				class="fa-solid fa-cart-plus"></i> <span
				class="badge bg-danger position-absolute top-0 start-0 translate-middle">
					<%=cartItemCount%>
			</span>
			</a>
			<form action="LogoutServlet" method="post">
				<button type="submit" class="btn btn-danger me-2 fw-bolder">
					<i class="fa-solid fa-sign-out"></i> Logout
				</button>
			</form>

			<%
			}
			%>
		</div>

	</div>
</div>



<nav class="navbar navbar-expand-lg bg-custom">
	<div class="container-fluid fw-bolder">
		<a class="navbar-brand" href="index.jsp"><i
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
					aria-current="page" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link custom-nav-link"
					href="all_vegetables.jsp">Vegetables</a></li>
				<li class="nav-item"><a class="nav-link custom-nav-link"
					href="all_fruits.jsp">Fruits</a></li>
				<li class="nav-item"><a class="nav-link custom-nav-link"
					href="about.jsp">About</a></li>

			</ul>
			<a href="setting.jsp" class="btn btn-outline-light" type="submit">
				<i class="fa-solid fa-gear"></i> Setting
			</a>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-outline-light mx-2"
				data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				<i class="fa-solid fa-phone"></i> Contact Us
			</button>

			<!-- Modal -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="staticBackdropLabel">Contact
								Us</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="card">
								<div class="card-body">
									<form action="ContactUsServlet" method="post">
										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label">Name</label>
											<input type="text" class="form-control  border border-2"
												id="exampleInputEmail1" aria-describedby="emailHelp"
												required="required" name="name">
										</div>
										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label">Phone
												No</label> <input type="tel" pattern="[7-9]{1}[0-9]{9}"
												class="form-control border border-2" id="exampleInputEmail1"
												aria-describedby="emailHelp" required="required"
												name="phnno">
										</div>
										<div class="mb-3">
											<label for="exampleInputEmail1" class="form-label">Email
												address</label> <input type="email"
												class="form-control border border-2" id="exampleInputEmail1"
												aria-describedby="emailHelp" required="required"
												name="email">
											<div id="emailHelp" class="form-text">We'll never share
												your email with anyone else.</div>
										</div>
										<div class="mb-3">
											<label for="exampleFormControlTextarea1" class="form-label">Message</label>
											<textarea class="form-control" name="message"
												id="exampleFormControlTextarea1" rows="3"></textarea>
										</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</nav>