package com.admin.servlet;

import java.io.IOException;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.ProductDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit_products")
public class EditProductServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
			int id=Integer.parseInt(req.getParameter("id"));
			String productName = req.getParameter("name");
			String productCategory = req.getParameter("category");
			Double price = Double.parseDouble(req.getParameter("price"));
			String productStatus = req.getParameter("status");

			ProductDetails p = new ProductDetails();
			p.setProductID(id);
			p.setProductName(productName);
			p.setProductCategory(productCategory);
			p.setPrice(price);
			p.setProductStatus(productStatus);
			
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditProducts(p);
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("Status", "Product Updated Successfully");
				resp.sendRedirect("all_products.jsp");

			} else {
				session.setAttribute("Status", "Something Went Wrong!!!");
				resp.sendRedirect("all_products.jsp");

			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}
