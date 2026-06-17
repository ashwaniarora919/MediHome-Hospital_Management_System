package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {
		this.conn = conn;
	}

	public User login(String email, String password) {

		User u = null;

		try {

			String sql = "select * from user where email=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				String dbPassword = rs.getString("password");

				if (password.equals(dbPassword)) {

					u = new User();

					u.setId(rs.getInt("id"));
					u.setFullName(rs.getString("full_name"));
					u.setEmail(rs.getString("email"));
					u.setPassword(rs.getString("password"));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	public boolean register(User u) {

		boolean f = false;

		try {

			String sql = "insert into user(full_name,email,password) values(?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, u.getFullName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public int countUser() {

		int i = 0;

		try {

			String sql = "select count(*) from user";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				i = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	public boolean checkEmail(String email) {

		boolean f = false;

		try {

			String sql = "select * from user_dtls where email=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public List<User> getAllUsers(){

		List<User> list = new ArrayList<>();

		try{

			String sql = "select * from user";

			PreparedStatement ps =
			conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){

				User u = new User();

				u.setId(rs.getInt("id"));
				u.setFullName(rs.getString("full_name"));
				u.setEmail(rs.getString("email"));

				list.add(u);
			}

		}catch(Exception e){
			e.printStackTrace();
		}

		return list;
	}

}