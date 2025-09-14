<%@page import="com.entity.ProductDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm2Fam: View</title>
<%@include file="all_component/allCSS.jsp"%>
</head>
<body style="background-color: #b9f6ca;">
	<!-- Navbar -->
	<%@include file="all_component/navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
	ProductDetails p = dao.getProductById(id);
	%>
	<div class="container p-3">
		<div class="row mt-2">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="Products/<%=p.getPhotoName()%>"
					style="height: 250px; width: 250px"> <br>
			</div>
			<div class="col-md-6 p-5 border bg-white">
				<div class="row">
					<h4 class="mt-3">
						<span class="text-primary"><%=p.getProductName()%></span>
					</h4>
					<h5>
						Category: <span class="text-success"><%=p.getProductCategory()%></span>
					</h5>
					<h5>
						Price: <span class="text-success"><%=p.getPrice()%></span>


					</h5>
					<h6>
						<span class="text-secondary">(inclusive of all taxes)</span>
					</h6>
				</div>
				<div class="text-center p-5">

					<%
					User u = (User) session.getAttribute("userobj");
					if (u != null) {
					%>
					<a
						href="CartServlet?productID=<%=p.getProductID()%>&userID=<%=u.getId()%>"
						class="btn btn-outline-danger btn-sm"> <i
						class="fa-solid fa-cart-plus"></i> Add Cart
					</a>
					<%
					} else {
					%>
					<p>
						Please <a href="login.jsp">login</a> to add this product to your
						cart.
					</p>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<!-- Start Footer -->
	<%@include file="all_component/footer.jsp"%>
	<!-- End Footer -->
</body>
</html>