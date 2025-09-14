package com.user.servlet;

import java.io.IOException;

import com.DAO.CartDAOImpl;
import com.DAO.ProductDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.ProductDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int pid = Integer.parseInt(req.getParameter("productID"));
			int uid = Integer.parseInt(req.getParameter("userID"));

			CartDAOImpl cartDAO = new CartDAOImpl(DBConnect.getConn());
			Cart existingCartItem = cartDAO.getCartItemByProductAndUser(pid, uid);
			if (existingCartItem != null) {
				HttpSession session = req.getSession();
				session.setAttribute("addCartMsg", "Item already in Cart");
			} else {
				ProductDAOImpl productDAO = new ProductDAOImpl(DBConnect.getConn());
				ProductDetails product = productDAO.getProductById(pid);
				Cart cartItem = new Cart();
				cartItem.setProductID(pid);
				cartItem.setUserID(uid);
				cartItem.setProduct_name(product.getProductName());
				cartItem.setPrice(product.getPrice());
				cartItem.setQuantity(1);
				boolean added = cartDAO.addCart(cartItem);

				if (added) {
					HttpSession session = req.getSession();
					session.setAttribute("addCartMsg", "Added to Cart");
				} else {
					HttpSession session = req.getSession();
					session.setAttribute("addCartMsg", "Failed to add to Cart");
				}
			}
			ProductDAOImpl dao = new ProductDAOImpl(DBConnect.getConn());
			ProductDetails product = dao.getProductById(pid);
			if (product.getProductCategory().equals("Vegetables")) {
				resp.sendRedirect("all_vegetables.jsp");
			} else if (product.getProductCategory().equals("Fruits")) {
				resp.sendRedirect("all_fruits.jsp");
			} else {
				resp.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
