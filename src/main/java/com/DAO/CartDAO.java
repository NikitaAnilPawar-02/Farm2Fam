package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {
	public boolean addCart(Cart c);

	public List<Cart> getProductByUser(int userid);

	public boolean updateQuantity(int userId, int productId, int newQuantity);
	
	public double getTotalByProduct(int userId, int productId, int quantity);

	public boolean deleteProduct(int pid, int uid);

	public Cart getCartItemByProductAndUser(int productId, int userId);
	
	public List<Cart> placedOrder(int userId);

}
