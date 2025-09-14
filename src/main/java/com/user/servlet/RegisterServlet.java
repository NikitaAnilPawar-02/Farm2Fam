package com.user.servlet;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		try {
			String name = req.getParameter("name");
			Long phnno = Long.parseLong(req.getParameter("phnno"));
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String hashedPassword = hashPassword(password);

			User user = new User();
			user.setName(name);
			user.setPhnno(phnno);
			user.setEmail(email);
			user.setPassword(hashedPassword);

			UserDAOImpl userDAO = new UserDAOImpl(DBConnect.getConn());

			HttpSession session = req.getSession();

			if (userDAO.isUserRegistered(email)) {
				session.setAttribute("registrationStatus", "User with this email is already registered!");
			} else {
				boolean success = userDAO.userRegister(user);
				session.setAttribute("registrationStatus",
						success ? "Registration successful!" : "Registration failed. Please try again.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("/register.jsp").forward(req, resp);
	}

	private String hashPassword(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hashedBytes = md.digest(password.getBytes());
			return Base64.getEncoder().encodeToString(hashedBytes);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
}
