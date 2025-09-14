package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.ProductDetails;

@WebServlet("/ProductsAdd")
@MultipartConfig
public class ProductsAdd extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String productName = req.getParameter("name");
			String productCategory = req.getParameter("category");
			Double price = Double.parseDouble(req.getParameter("price"));
			String productStatus = req.getParameter("status");
			Part part = req.getPart("photo");
			String fileName = part.getSubmittedFileName();

			ProductDetails p = new ProductDetails(productName, productCategory, price, productStatus, fileName);

			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());

			boolean f = dao.addproducts(p);
			HttpSession session = req.getSession();
			if (f) {
				String path = getServletContext().getRealPath("") + "Products";
				File file = new File(path);
				part.write(path + File.separator + fileName);
				session.setAttribute("Status", "Product Added Successfully");
				resp.sendRedirect(req.getContextPath() + "/admin/add_products.jsp");

			} else {
				session.setAttribute("Status", "Something Went Wrong!!!");
				resp.sendRedirect(req.getContextPath() + "/admin/add_products.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
