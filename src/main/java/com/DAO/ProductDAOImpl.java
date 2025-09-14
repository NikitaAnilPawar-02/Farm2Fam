package com.DAO;

import java.sql.*;
import java.util.*;

import com.entity.ProductDetails;

public class ProductDAOImpl implements ProductDAO {

	private Connection conn;

	public ProductDAOImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean addproducts(ProductDetails p) {
		boolean f = false;
		try {
			String sql = "INSERT INTO product_details (product_name, product_category, price, product_status, photo) VALUES (?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductName());
			ps.setString(2, p.getProductCategory());
			ps.setDouble(3, p.getPrice());
			ps.setString(4, p.getProductStatus());
			ps.setString(5, p.getPhotoName());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<ProductDetails> getAllProduct() {
		List<ProductDetails> list = new ArrayList<ProductDetails>();
		ProductDetails p = null;

		try {
			String sql = "SELECT * FROM product_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new ProductDetails();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductCategory(rs.getString(3));
				p.setPrice(rs.getDouble(4));
				p.setProductStatus(rs.getString(5));
				p.setPhotoName(rs.getString(6));

				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ProductDetails getProductById(int id) {
		ProductDetails p = null;

		try {
			String sql = "SELECT * FROM product_details WHERE productID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new ProductDetails();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductCategory(rs.getString(3));
				p.setPrice(rs.getDouble(4));
				p.setProductStatus(rs.getString(5));
				p.setPhotoName(rs.getString(6));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public boolean updateEditProducts(ProductDetails p) {
		boolean f = false;
		try {
			String sql = "UPDATE product_details SET product_name = ?, product_category = ?, price = ?, product_status = ? WHERE productID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductName());
			ps.setString(2, p.getProductCategory());
			ps.setDouble(3, p.getPrice());
			ps.setString(4, p.getProductStatus());
			ps.setInt(5, p.getProductID());

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
	public boolean deleteProducts(int id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM product_details WHERE productID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
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
	public List<ProductDetails> getNewVegetables() {
		List<ProductDetails> list = new ArrayList<ProductDetails>();
		ProductDetails p = null;
		try {
			String sql = "SELECT * FROM product_details WHERE product_category=? and product_status=? ORDER BY productID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Vegetables");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 8) {
				p = new ProductDetails();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductCategory(rs.getString(3));
				p.setPrice(rs.getDouble(4));
				p.setProductStatus(rs.getString(5));
				p.setPhotoName(rs.getString(6));
				list.add(p);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDetails> getNewFruits() {
		List<ProductDetails> list = new ArrayList<ProductDetails>();
		ProductDetails p = null;
		try {
			String sql = "SELECT * FROM product_details WHERE product_category=? and product_status=? ORDER BY productID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Fruits");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 8) {
				p = new ProductDetails();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductCategory(rs.getString(3));
				p.setPrice(rs.getDouble(4));
				p.setProductStatus(rs.getString(5));
				p.setPhotoName(rs.getString(6));
				list.add(p);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDetails> getAllVegetables() {
		List<ProductDetails> list = new ArrayList<ProductDetails>();
		ProductDetails p = null;
		try {
			String sql = "SELECT * FROM product_details WHERE product_category=? and product_status=? ORDER BY productID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Vegetables");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new ProductDetails();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductCategory(rs.getString(3));
				p.setPrice(rs.getDouble(4));
				p.setProductStatus(rs.getString(5));
				p.setPhotoName(rs.getString(6));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDetails> getAllFruits() {
		List<ProductDetails> list = new ArrayList<ProductDetails>();
		ProductDetails p = null;
		try {
			String sql = "SELECT * FROM product_details WHERE product_category=? and product_status=? ORDER BY productID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Fruits");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new ProductDetails();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductCategory(rs.getString(3));
				p.setPrice(rs.getDouble(4));
				p.setProductStatus(rs.getString(5));
				p.setPhotoName(rs.getString(6));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductDetails> getProductBySearch(String ch) {
		List<ProductDetails> list = new ArrayList<ProductDetails>();
		ProductDetails p = null;

		try {
			String sql = "SELECT * FROM product_details WHERE product_name like ? or  product_category like ? and product_status = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3,"Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new ProductDetails();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setProductCategory(rs.getString(3));
				p.setPrice(rs.getDouble(4));
				p.setProductStatus(rs.getString(5));
				p.setPhotoName(rs.getString(6));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
