package com.user.servlet;

import java.io.IOException;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "QuantityIncreDecreServlet", urlPatterns = { "/QuantityIncreDecreServlet" })
public class QuantityIncreDecreServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		int ProductID = Integer.parseInt(req.getParameter("productID"));
		int userID = Integer.parseInt(req.getParameter("userID"));

		if (action != null && userID >= 1) {
			CartDAOImpl cartDAO = new CartDAOImpl(DBConnect.getConn());

			Cart cartItem = cartDAO.getCartItemByProductAndUser(ProductID, userID);

			if (cartItem != null) {
				if (action.equals("inc")) {
					incrementQuantity(cartDAO, cartItem);
				} else if (action.equals("dec")) {
					decrementQuantity(cartDAO, cartItem);
				}
			}
		}
		resp.sendRedirect("checkout.jsp");
	}

	private void incrementQuantity(CartDAOImpl cartDAO, Cart cartItem) {
		int newQuantity = cartItem.getQuantity() + 1;
		cartItem.setQuantity(newQuantity);
		cartDAO.updateQuantity(cartItem.getUserID(), cartItem.getProductID(), newQuantity);
	}

	private void decrementQuantity(CartDAOImpl cartDAO, Cart cartItem) {
		if (cartItem.getQuantity() > 1) {
			int newQuantity = cartItem.getQuantity() - 1;
			cartItem.setQuantity(newQuantity);
			cartDAO.updateQuantity(cartItem.getUserID(), cartItem.getProductID(), newQuantity);
		}
	}

}
