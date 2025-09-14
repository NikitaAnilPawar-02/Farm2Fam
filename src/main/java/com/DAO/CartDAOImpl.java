package com.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String sql = "INSERT INTO cart ( productID, userID, product_name, price, quantity,total) VALUES (?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, c.getProductID());
			ps.setInt(2, c.getUserID());
			ps.setString(3, c.getProduct_name());
			ps.setDouble(4, c.getPrice());
			ps.setInt(5, c.getQuantity());
			ps.setDouble(6, c.getQuantity() * c.getPrice());

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
	public List<Cart> getProductByUser(int userid) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		try {
			String sql = "SELECT * FROM cart WHERE userID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setCartID(rs.getInt(1));
				c.setProductID(rs.getInt(2));
				c.setUserID(rs.getInt(3));
				c.setProduct_name(rs.getString(4));
				c.setPrice(rs.getDouble(5));
				c.setQuantity(rs.getInt(6));
				c.setTotal_price(rs.getDouble(7));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteProduct(int pid, int uid) {
		boolean f = false;
		try {
			String sql = "DELETE FROM cart WHERE productID=? and userID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setInt(2, uid);
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
	public Cart getCartItemByProductAndUser(int productId, int userId) {
		Cart item = null;
		try {
			String sql = "SELECT * FROM cart WHERE productID = ? AND userID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			ps.setInt(2, userId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				item = new Cart();
				item.setCartID(rs.getInt("cartID"));
				item.setProductID(rs.getInt("productID"));
				item.setUserID(rs.getInt("userID"));
				item.setProduct_name(rs.getString("product_name"));
				item.setPrice(rs.getDouble("price"));
				item.setQuantity(rs.getInt("quantity"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return item;
	}

	@Override
	public boolean updateQuantity(int userId, int productId, int newQuantity) {
		boolean success = false;
		try {
			String sql = "UPDATE cart SET quantity = ?, total = ? WHERE userID = ? AND productID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, newQuantity);
			ps.setDouble(2, getTotalByProduct(userId, productId, newQuantity));
			ps.setInt(3, userId);
			ps.setInt(4, productId);

			int rowsUpdated = ps.executeUpdate();
			if (rowsUpdated > 0) {
				success = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return success;
	}

	@Override
	public double getTotalByProduct(int userId, int productId, int quantity) {
		double totalPrice = 0.0;
		try {
			String sql = "SELECT price FROM cart WHERE userID = ? AND productID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, productId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
	            double price = rs.getDouble("price");
	            totalPrice = price * quantity;
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalPrice;
	}

	@Override
	public List<Cart> placedOrder(int userId) {
		List<Cart> c = new ArrayList<>();
		try {
			String sql = "SELECT * FROM cart WHERE user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Cart cart = new Cart();
				cart.setCartID(rs.getInt("cart_id"));
				cart.setUserID(rs.getInt("user_id"));
				cart.setProductID(rs.getInt("product_id"));
				cart.setProduct_name(rs.getString("product_name"));
				cart.setPrice(rs.getDouble("price"));
				cart.setQuantity(rs.getInt("quantity"));
				cart.setTotal_price(rs.getDouble("total"));
				c.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	 public void clearCart(int userId) {
	        try {
	            String sql = "DELETE FROM cart WHERE userID = ?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, userId);
	            ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
}