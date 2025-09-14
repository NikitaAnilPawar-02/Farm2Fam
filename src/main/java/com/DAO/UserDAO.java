package com.DAO;

import java.util.List;

import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User us);
	
	public User login(String email, String password);
	
	public boolean checkPassword(int id, String ps);
	
	public boolean updateProfile(User us);
	
	public User getUserDetailsByOrderId(String orderId);
	
	public List<User> getAllUsers();
}
