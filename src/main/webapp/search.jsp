<%@page import="com.entity.User"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.entity.ProductDetails"%>
<%@ page import="com.DAO.ProductDAO"%>
<%@ page import="com.DAO.ProductDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_component/allCSS.jsp"%>
<title>Farm2Fam: Search</title>
<style type="text/css">
.card-hover:hover {
	background-color: #e0e0e0;
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
	<!-- Navbar -->
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			String ch = request.getParameter("ch");
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			List<ProductDetails> plist = dao.getProductBySearch(ch);
			for (ProductDetails p : plist) {
			%>
			<div class="col-md-3">
				<div class="card card-hover position-relative mt-2">
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
								<%
								if (session.getAttribute("addCartMsg") != null) {
								%>
								<div
									class="position-fixed top-0 start-50 translate-middle-x p-3"
									style="z-index: 5; margin-top: 110px;">
									<div id="toast"
										class="toast align-items-center bg-success text-white"
										role="alert" aria-live="assertive" aria-atomic="true">
										<div class="d-flex">
											<div class="toast-body"
												style="font-size: 16px; padding: 16px;">
												<%=session.getAttribute("addCartMsg")%>
											</div>
											<button type="button"
												class="btn-close btn-close-white me-2 m-auto"
												data-bs-dismiss="toast" aria-label="Close"></button>
										</div>
									</div>
								</div>

								<script>
									var toastEl = document
											.getElementById('toast');
									var toast = new bootstrap.Toast(toastEl);
									toast.show();
								</script>

								<%
								session.removeAttribute("addCartMsg");
								%>
								<%
								}
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
									class="fa-solid fa-indian-rupee-sign"></i> <%=p.getPrice()%></a>
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
	<!-- Start Footer -->
	<%@include file="all_component/footer.jsp"%>
	<!-- End Footer -->
</body>
</html>