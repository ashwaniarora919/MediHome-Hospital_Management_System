package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;
import com.entity.Doctor;

public class DoctorDAO {

	private Connection conn;

	public DoctorDAO(Connection conn) {
		this.conn = conn;
	}

	public boolean addDoctor(Doctor d) {

		boolean f = false;

		try {

			String sql = "insert into doctor(full_name,email,password,specialist) values(?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, d.getFullName());
			ps.setString(2, d.getEmail());
			ps.setString(3, d.getPassword());
			ps.setString(4, d.getSpecialist());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Doctor> getAllDoctors() {

		List<Doctor> list = new ArrayList<>();

		try {

			String sql = "select * from doctor";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Doctor d = new Doctor();

				d.setId(rs.getInt("id"));
				d.setFullName(rs.getString("full_name"));
				d.setEmail(rs.getString("email"));
				d.setPassword(rs.getString("password"));
				d.setSpecialist(rs.getString("specialist"));

				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteDoctor(int id) {

		boolean f = false;

		try {

			String sql = "delete from doctor where id=?";

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

	public Doctor login(String email, String password) {

		Doctor d = null;

		try {

			String sql = "select * from doctor where email=? and password=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				d = new Doctor();

				d.setId(rs.getInt("id"));
				d.setFullName(rs.getString("full_name"));
				d.setEmail(rs.getString("email"));
				d.setPassword(rs.getString("password"));
				d.setSpecialist(rs.getString("specialist"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}

	public Doctor getDoctorById(int id) {

		Doctor d = null;

		try {

			String sql = "select * from doctor where id=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				d = new Doctor();

				d.setId(rs.getInt("id"));
				d.setFullName(rs.getString("full_name"));
				d.setEmail(rs.getString("email"));
				d.setPassword(rs.getString("password"));
				d.setSpecialist(rs.getString("specialist"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}

	public int countDoctor() {

		int i = 0;

		try {

			String sql = "select count(*) from doctor";

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
	
	public boolean updateDoctor(Doctor d) {

		boolean f = false;

		try {

			String sql =
			"update doctor set full_name=?,email=?,password=?,specialist=? where id=?";

			PreparedStatement ps =
			conn.prepareStatement(sql);

			ps.setString(1, d.getFullName());
			ps.setString(2, d.getEmail());
			ps.setString(3, d.getPassword());
			ps.setString(4, d.getSpecialist());
			ps.setInt(5, d.getId());

			int i = ps.executeUpdate();

			if(i == 1) {
				f = true;
			}

		} catch(Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean checkDoctorEmail(String email) {

		boolean f = false;

		try {

			String sql =
			"select * from doctor where email=?";

			PreparedStatement ps =
			conn.prepareStatement(sql);

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			if(rs.next()) {
				f = true;
			}

		} catch(Exception e) {
			e.printStackTrace();
		}

		return f;
	}
}