package com.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Orders;

public class OrdersDAOImpl implements OrdersDAO {
	private Connection conn;

	public OrdersDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveOrder(List<Orders> o) {
		boolean f = false;
		try {
			String sql = "INSERT INTO orders (order_id, user_id, address,product_id, product_name, price, quantity, total, payment_type) VALUES (?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for (Orders order : o) {
				ps.setString(1, order.getOrder_id());
				ps.setInt(2, order.getUserID());
				ps.setString(3, order.getFulladd());
				ps.setInt(4, order.getProductID());
				ps.setString(5, order.getProductName());
				ps.setDouble(6, order.getPrice());
				ps.setInt(7, order.getQuantity());
				ps.setDouble(8, order.getTotal_price());
				ps.setString(9, order.getPaymentType());
				ps.addBatch();
			}
			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Orders> getProduct(int userID) {
		List<Orders> list = new ArrayList<Orders>();
		Orders o = null;
		try {
			String sql = "SELECT * FROM orders WHERE user_id =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Orders();
				o.setOrder_id(rs.getString(1));
				o.setUserID(rs.getInt(2));
				o.setFulladd(rs.getString(3));
				o.setProductID(rs.getInt(4));
				o.setProductName(rs.getString(5));
				o.setPrice(rs.getDouble(6));
				o.setQuantity(rs.getInt(7));
				o.setTotal_price(rs.getDouble(8));
				o.setPaymentType(rs.getString(9));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Orders> getAllOrders() {
		List<Orders> list = new ArrayList<>();
		Orders o = null;
		try {
			String sql = "SELECT * FROM orders";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new Orders();
				o.setOrder_id(rs.getString("order_id"));
				o.setUserID(rs.getInt("user_id"));
				o.setFulladd(rs.getString("address"));
				o.setProductID(rs.getInt("product_id"));
				o.setProductName(rs.getString("product_name"));
				o.setPrice(rs.getDouble("price"));
				o.setQuantity(rs.getInt("quantity"));
				o.setTotal_price(rs.getDouble("total"));
				o.setPaymentType(rs.getString("payment_type"));
				list.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Orders> getOrdersByUserId(int userId) {
		List<Orders> orders = new ArrayList<>();
		try {
			String query = "SELECT * FROM orders WHERE user_id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Orders order = new Orders();
				order.setOrder_id(rs.getString("order_id"));
				order.setUserID(rs.getInt("user_id"));
				order.setFulladd(rs.getString("address"));
				order.setProductID(rs.getInt("product_id"));
				order.setProductName(rs.getString("product_name"));
				order.setPrice(rs.getDouble("price"));
				order.setQuantity(rs.getInt("quantity"));
				order.setTotal_price(rs.getDouble("total"));
				order.setPaymentType(rs.getString("payment_type"));
				orders.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}

}
