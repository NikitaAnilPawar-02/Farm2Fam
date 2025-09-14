package com.user.servlet;

import java.io.*;
import java.sql.*;

import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/ContactUsServlet")

public class ContactUsServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		long phoneNumber = Long.parseLong(request.getParameter("phnno"));
		String email = request.getParameter("email");
		String message = request.getParameter("message");

		try {
			Connection conn = DBConnect.getConn();

			String sql = "INSERT INTO ContactUs (name, phone_number, email, message) VALUES (?, ?, ?, ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setLong(2, phoneNumber);
			pst.setString(3, email);
			pst.setString(4, message);
			HttpSession session = request.getSession();
			int rowsAffected = pst.executeUpdate();
			if(rowsAffected > 0) {
				session.setAttribute("Status", "Conatct Successfully ");
			    response.sendRedirect("index.jsp");
			} else {
				session.setAttribute("Status", "Failed to contact");
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}