<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DAO.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farm2Fam: Cart</title>
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

	<%
	String Msg = (String) session.getAttribute("Msg");
	if (Msg != null) {
	%><div class="alert alert-danger text-center" role="alert">
		<%=Msg%>
	</div>
	<%
	session.removeAttribute("Msg");
	}
	%>


	<!-- Start Cart -->
	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card">
					<div class="card body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-striped text-center">
							<thead>
								<tr>
									<th scope="col">Product Name</th>
									<th scope="col">Price</th>
									<th scope="col">Quantity</th>
									<th scope="col">Total Per Item</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getProductByUser(u.getId());
								double subTotal = 0.0;
								for (Cart c : cart) {
									double totalPrice = dao.getTotalByProduct(u.getId(), c.getProductID(), c.getQuantity());
									subTotal += totalPrice;
								%>
								<tr>
									<th scope="row"><%=c.getProduct_name()%></th>
									<td><%=c.getPrice()%></td>
									<td>
										<form action="QuantityIncreDecreServlet" method="get"
											class="form-inline">
											<input type="hidden" name="id" value="1" class="form-input">
											<div class="form-group d-flex justify-content-between">
												<a class="btn btn-sm btn-decrement"
													href="QuantityIncreDecreServlet?action=dec&userID=<%=c.getUserID()%>&productID=<%=c.getProductID()%>"><i
													class="fas fa-minus-square fa-lg"></i></a> <input type="number"
													name="quantity" class="form-control"
													value="<%=c.getQuantity()%>" readonly style="width: 60px;">
												<a class="btn btn-sm btn-increment"
													href="QuantityIncreDecreServlet?action=inc&userID=<%=c.getUserID()%>&productID=<%=c.getProductID()%>"><i
													class="fas fa-plus-square fa-lg"></i></a>
											</div>
										</form>
									</td>
									<td><%=totalPrice%></td>
									<td><a
										href="removeCartItem?productID=<%=c.getProductID()%>&&userID=<%=c.getUserID()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<th scope="row" class="text-primary">Total</th>
									<td></td>
									<td></td>
									<td class="text-primary"><b><%=subTotal%></b></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>

						<form action="OrderServlet" method="post">
							<input type="hidden" value="<%=u.getId()%>" name="id">
							<div class="row">
								<div class="col">
									<label for="inputEmail4">Name</label> <input type="text"
										name="name" class="form-control" id="inputEmail4"
										value="<%=u.getName()%>" required>
								</div>
								<div class="col">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" class="form-control" id="inputPassword4"
										value="<%=u.getEmail()%>" required>
								</div>
							</div>
							<div class="row pt-2">
								<div class="col">
									<label for="inputEmail4">Phone No</label> <input type="tel"
										name="phnno" class="form-control" id="inputEmail4"
										value="<%=u.getPhnno()%>" required>
								</div>
								<div class="col">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" class="form-control" id="inputPassword4"
										required>
								</div>
							</div>
							<div class="row pt-2">
								<div class="col">
									<label for="inputEmail4">Landmark</label> <input type="text"
										name="landmark" class="form-control" id="inputEmail4" required>
								</div>
								<div class="col">
									<label for="inputPassword4">City</label> <input type="text"
										name="city" class="form-control" id="inputPassword4" required>
								</div>
							</div>
							<div class="row pt-2">
								<div class="col">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputEmail4" required>
								</div>
								<div class="col">
									<label for="inputPassword4">Pin Code</label> <input type="text"
										name="pincode" class="form-control" id="inputPassword4"
										required>
								</div>
							</div>
							<div class="row pt-2">
								<div class="col">
									<label for="inputEmail4">Payment Type</label> <select
										class="form-select" name="paymentType"
										aria-label="Default select example" required>
										<option value="noselect">--- Select ---</option>
										<option value="Cash On Delivery">Cash On Delivery</option>
									</select>
								</div>
							</div>
							<div class="pt-3 text-center">
								<button type="submit" class="btn btn-warning me-2">Order
									Now</button>
								<a href="index.jsp" class="btn btn-success me-2">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Cart -->
	<!-- Start Footer -->
	<%@include file="all_component/footer.jsp"%>
	<!-- End Footer -->
</body>
</html>