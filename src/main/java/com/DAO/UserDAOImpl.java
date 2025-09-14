package com.DAO;

import java.security.MessageDigest;
import java.sql.*;
import java.util.*;

import com.entity.User;

public class UserDAOImpl implements UserDAO {
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean userRegister(User us) {
        boolean success = false;
        try {
            String query = "INSERT INTO user (name , phnno , email , password) values (? , ? , ? , ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, us.getName());
            ps.setDouble(2, us.getPhnno());
            ps.setString(3, us.getEmail());
            String hashedPassword = hashPasswordSHA256(us.getPassword()); // Hash the password
            ps.setString(4, hashedPassword);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    public boolean isUserRegistered(String email) {
        boolean userExists = false;
        String query = "SELECT * FROM user WHERE email = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userExists = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userExists;
    }

    public User login(String email, String password) {
        User us = null;
        try {
            String sql = "SELECT * FROM user WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                if (validatePasswordSHA256(password, hashedPassword)) { 
                    us = new User();
                    us.setId(rs.getInt(1));
                    us.setName(rs.getString(2));
                    us.setPhnno(rs.getLong(3));
                    us.setEmail(rs.getString(4));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }

    private String hashPasswordSHA256(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hashedBytes);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    private boolean validatePasswordSHA256(String plainPassword, String hashedPassword) {
        String hashedInput = hashPasswordSHA256(plainPassword);
        return hashedInput.equals(hashedPassword);
    }

	@Override
	public boolean checkPassword(int id, String plainPassword) {
	    try {
	        String sql = "SELECT password FROM user WHERE id = ?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setInt(1, id);
	        ResultSet rs = pst.executeQuery();
	        
	        if (rs.next()) {
	            String hashedPasswordFromDB = rs.getString("password");
	            return validatePasswordSHA256(plainPassword, hashedPasswordFromDB);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}


	@Override
	public boolean updateProfile(User us) {
		boolean f = false;
		try {
			String query = "UPDATE user SET name = ? , phnno = ? , email = ? WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, us.getName());
			ps.setDouble(2, us.getPhnno());
			ps.setString(3, us.getEmail());
			ps.setInt(4, us.getId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
    public User getUserDetailsByOrderId(String orderId) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;

        try {
            String query = "SELECT u.name, u.phnno, u.email " +
                           "FROM user u " +
                           "JOIN orders o ON u.id = o.user_id " +
                           "WHERE o.order_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, orderId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setName(rs.getString("name"));
                user.setPhnno(rs.getLong("phnno"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }
	
	public List<User> getAllUsers() {
	    List<User> userList = new ArrayList<>();
	    try {
	        String query = "SELECT * FROM user";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            User user = new User();
	            user.setId(rs.getInt("id"));
	            user.setName(rs.getString("name"));
	            user.setPhnno(rs.getLong("phnno"));
	            user.setEmail(rs.getString("email"));
	            userList.add(user);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return userList;
	}
}