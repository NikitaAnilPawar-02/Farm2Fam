<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Products</title>
<%@include file="allCSS.jsp"%>
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
		response.sendRedirect("../login.jsp");
		return;
	}
	%>
	<!-- Navbar -->
	<%@include file="navbar.jsp"%>

	<div class="container my-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">ADD PRODUCTS</h4>
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
						<form action="ProductsAdd" method="post" enctype="multipart/form-data">
							<div class="mb-3  pt-2">
								<label for="exampleInputEmail1" class="form-label">Product
									Name</label> <input type="text" class="form-control  border border-2 "
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="name">
							</div>
							<div class="mb-3">
								<label class="form-label">Product Category</label> <select
									class="form-select border border-2"
									aria-label="Default select example" name="category">
									<option selected>--- Select ---</option>
									<option value="Vegetables">Vegetables</option>
									<option value="Fruits">Fruits</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Price</label>
								<input type="number" class="form-control border border-2"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" name="price">
							</div>
							<div class="mb-3">
								<label class="form-label">Product Status</label> <select
									class="form-select border border-2"
									aria-label="Default select example" name="status">
									<option selected>--- Select ---</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="formFile" class="form-label">Upload Photo</label> <input
									class="form-control border border-2" type="file" id="formFile"
									name="photo">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-outline-success">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>