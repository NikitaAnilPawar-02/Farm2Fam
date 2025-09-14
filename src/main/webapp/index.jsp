<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.ProductDetails"%>
<%@ page import="com.DAO.ProductDAO"%>
<%@ page import="com.DAO.ProductDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm2Fam: Home</title>
<%@include file="all_component/allCSS.jsp"%>

<style type="text/css">
.farm2fam {
	font-weight: bold;
	font-size: 4.1rem;
	background-image: linear-gradient(to right top, #051937, #004d7a, #008793, #00bf72,
		#a8eb12);
	-webkit-background-clip: text;
	font-family: 'Verdana', sans-serif;
}

.caption {
	margin-top: 25px;
	background-image: linear-gradient(to right top, #0e532f, #247837, #469e38, #73c530,
		#a8eb12);
	color: transparent;
	-webkit-background-clip: text;
	font-family: 'Arial', sans-serif;
}

.caption-text {
	font-size: 3.5rem;
}

.subcaption-text {
	font-size: 2.1rem;
	margin-top: 25px;
}

.card-hover:hover {
	background-color: #e0e0e0;
}

.title {
	background-color: #00e676;
	color: white;
}

.image-container {
	position: relative;
	overflow: hidden;
}

.blur-image {
	filter: blur(3px);
	width: 100%;
	height: 400px;
}

.about-us-container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px;
	border-radius: 10px;
	text-align: center;
	width: 80%;
}

body {
	overflow-x: hidden;
}
</style>
</head>

<body>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<!-- Start Navbar -->
	<%@include file="all_component/navbar.jsp"%>
	<!-- End Navbar -->

	<%
	String Status = (String) session.getAttribute("Status");
	if (Status != null) {
	%><div class="alert alert-primary text-center" role="alert">
		<%=Status%>
	</div>
	<%
	session.removeAttribute("Status");
	}
	%>

	<!-- Start Home Image -->
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-6">
				<img src="img/A.jpg" alt="Image" class="img-fluid rounded-circle"
					style="width: 450px; height: 400px;">
			</div>
			<div class="col-md-6 mt-3">
				<div class="caption">
					<h1 class="farm2fam">FARM2FAM</h1>
					<h2 class="caption-text pt-5">Discover Freshness</h2>
					<h4 class="subcaption-text">From Farm to Table: Taste the
						Difference</h4>
				</div>
			</div>
		</div>
	</div>
	<!-- End Home Image -->

	<!-- Start Vegetables -->
	<div class="container">
		<h4 class="text-center my-5 py-2 title rounded-pill ">ORGANIC
			VEGETABLES</h4>

		<div class="row">
			<%
			ProductDAOImpl vegetablesDAO = new ProductDAOImpl(DBConnect.getConn());
			List<ProductDetails> vegetablesList = vegetablesDAO.getNewVegetables();
			for (ProductDetails p : vegetablesList) {
			%>
			<div class="col-md-3">
				<div class="card card-hover position-relative">
					<div class="card-body text-center"
						style="position: relative; line-height: 0.5;">
						<img class="img-fluid rounded-circle" alt=""
							src="Products/<%=p.getPhotoName()%>"
							style="height: 200px; width: 200px;"> <span
							class="badge bg-danger position-absolute top-0 start-60 translate-middle fs-5"></span>
						<p class="pt-3"><%=p.getProductName()%></p>
						<p>
							Category:
							<%=p.getProductCategory()%></p>
						<div class="row">
							<div class="d-inline p-1">
								<%
								if (u == null) {
								%>
								<a href="login.jsp" class="btn btn-outline-danger btn-sm"><i
									class="fa-solid fa-cart-plus"></i> Add Cart</a>
								<%
								} else {
								%>
								<a
									href="CartServlet?productID=<%=p.getProductID()%>&userID=<%=u.getId()%>"
									class="btn btn-outline-danger btn-sm"> <i
									class="fa-solid fa-cart-plus"></i> Add Cart
								</a>

								<%
								}
								%>
								<a href="view_product.jsp?id=<%=p.getProductID()%>"
									class="btn btn-outline-success btn-sm"><i
									class="fa-solid fa-eye"></i> View</a> <a href=""
									class="btn btn-outline-primary btn-sm"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%=p.getPrice()%>/-</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
	</div>

	<div class="text-center mt-3">
		<a href="all_vegetables.jsp" class="btn btn-primary">View All</a>
	</div>
	<!-- End Vegetables -->

	<hr>

	<!-- Start Our Story -->
	<div class="container-fluid image-container">
		<img src="img/C.jpg" class="blur-image" alt="Image">
		<div class="about-us-container">
			<h2>OUR STORY</h2>
			<h5>From our farm to your table: What Farm2Fam offers</h5>
			<p>There was a time when we did not have to worry about the
				freshness or the source of our food. Things are different now.
				Although, we do not have a time machine, our farm fresh produce can
				definitely transport your back to a time when we enjoyed
				organically-grown and natural fruits and vegetables. Grown at our
				own farms with the right knowledge, our produce is 100% clean and
				fresh, how it should be! We are delivering organic fruits and
				vegetables, fresh from our farms to your homes. With a team of
				agronomists and farmers possessing decades of collective experience,
				we are pioneering India’s modern food revolution.</p>
			<a href="about.jsp"><button type="button" class="btn btn-success">Know More</button></a>
		</div>
	</div>
	<!-- End Our Story -->

	<!-- Start Fruits -->
	<div class="container">
		<h4 class="text-center my-5 py-2 title rounded-pill ">ORGANIC
			FRUITS</h4>

		<div class="row">
			<%
			ProductDAOImpl fruitsDAO = new ProductDAOImpl(DBConnect.getConn());
			List<ProductDetails> fruitsList = fruitsDAO.getNewFruits();
			for (ProductDetails q : fruitsList) {
			%>
			<div class="col-md-3">
				<div class="card card-hover position-relative">
					<div class="card-body text-center"
						style="position: relative; line-height: 0.5;">
						<img class="img-fluid rounded-circle" alt=""
							src="Products/<%=q.getPhotoName()%>"
							style="height: 200px; width: 200px;"> <span
							class="badge bg-danger position-absolute top-0 start-60 translate-middle fs-5"></span>
						<p class="pt-3"><%=q.getProductName()%></p>
						<p>
							Category:
							<%=q.getProductCategory()%></p>
						<div class="row">
							<div class="d-inline p-1">
								<%
								if (u == null) {
								%>
								<a href="login.jsp" class="btn btn-outline-danger btn-sm"><i
									class="fa-solid fa-cart-plus"></i> Add Cart</a>
								<%
								} else {
								%>
								<a
									href="CartServlet?productID=<%=q.getProductID()%>&userID=<%=u.getId()%>"
									class="btn btn-outline-danger btn-sm"> <i
									class="fa-solid fa-cart-plus"></i> Add Cart
								</a>

								<%
								}
								%>
								<a href="view_product.jsp?id=<%=q.getProductID()%>"
									class="btn btn-outline-success btn-sm"><i
									class="fa-solid fa-eye"></i> View</a> <a href=""
									class="btn btn-outline-primary btn-sm"><i
									class="fa-solid fa-indian-rupee-sign"></i> <%=q.getPrice()%></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

	<div class="text-center mt-3">
		<a href="all_fruits.jsp" class="btn btn-primary">View All</a>
	</div>
	<!-- End Fruits -->

	<hr>

	<!-- Start Reviews -->
	<div class="container">
		<h4 class="text-center mt-5 py-2 title rounded-pill ">REVIEWS</h4>
	</div>
	<div id="carouselExampleAutoplaying" class="carousel slide"
		data-bs-ride="carousel" style="padding: 75px;">
		<div class="carousel-inner"
			style="background-color: #eeeeee; padding: 75px; color: black;">
			<div class="carousel-item active" data-bs-interval="2500">
				<div class="d-block w-100">
					<div class="container p-5">
						<div class="carousel-caption d-none d-md-block "
							style="color: black; margin-top: 200px;">
							<h5>"Pure and high quality farm fresh vegetables. One can
								easily feel the difference in taste"</h5>
							<p>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item" data-bs-interval="2500">
				<div class="d-block w-100">
					<div class="container p-5">
						<div class="carousel-caption d-none d-md-block "
							style="color: black; margin-top: 200px;">
							<h5>"Experience the farm-fresh advantage with our premium
								selection of handpicked vegetables, offering unmatched quality."</h5>
							<p>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: grey;"></i></span>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item" data-bs-interval="2500">
				<div class="d-block w-100">
					<div class="container p-5">
						<div class="carousel-caption d-none d-md-block "
							style="color: black; margin-top: 200px;">
							<h5>"Premium, pure, and flavorful! The difference in taste
								is evident in every bite. Absolutely love these farm-fresh
								Fruits!"</h5>
							<p>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
								<span><i class="fa-solid fa-star" style="color: #f4d11f;"></i></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<!-- End Reviews -->

	<!-- Start Footer -->
	<%@include file="all_component/footer.jsp"%>
	<!-- End Footer -->

</body>
</html>