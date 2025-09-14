package com.admin.servlet;

import java.io.IOException;

import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
			int id = Integer.parseInt(req.getParameter("id"));
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteProducts(id);
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("Status", "Product Deleted Successfully");
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
