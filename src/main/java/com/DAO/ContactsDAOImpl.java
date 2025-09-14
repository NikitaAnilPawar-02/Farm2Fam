package com.DAO;

import java.util.*;
import java.sql.*;
import com.entity.Contacts;

public class ContactsDAOImpl implements ContactsDAO {

	private Connection conn;

	public ContactsDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public List<Contacts> getAllContacts() {
		List<Contacts> contacts = new ArrayList<>();
		try {
			String sql = "SELECT * FROM contactus";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Contacts c = new Contacts();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone_number(rs.getLong(3));
				c.setEmail(rs.getString(4));
				c.setMessage(rs.getString(5));
				contacts.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return contacts;
	}
}
