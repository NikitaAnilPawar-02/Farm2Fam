package com.user.servlet;

import java.io.IOException;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RemoveCartServlet")
public class RemoveCartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pid = Integer.parseInt(req.getParameter("productID"));
		int uid = Integer.parseInt(req.getParameter("userID"));
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteProduct(pid,uid);
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("Msg", "Product Removed Successfully");
			resp.sendRedirect("checkout.jsp");
		} else {
			session.setAttribute("Msg", "Something Went Wrong");
			resp.sendRedirect("checkout.jsp");
		}
	}
}
