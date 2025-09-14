package com.DAO;

import java.util.*;

import com.entity.Orders;

public interface OrdersDAO {

	public boolean saveOrder(List<Orders> o);

	public List<Orders> getProduct(int userID);

	public List<Orders> getAllOrders();
	
	public List<Orders> getOrdersByUserId(int userId);
}
