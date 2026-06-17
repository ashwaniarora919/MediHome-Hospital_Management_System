package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDAO {

	private Connection conn;

	public AppointmentDAO(Connection conn) {
		this.conn = conn;
	}

	public boolean addAppointment(Appointment ap) {

		boolean f = false;

		try {

			String sql = "insert into appointment(user_id,doctor_id,full_name,gender,age,appointment_date,email,phone,diseases,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, ap.getUserId());
			ps.setInt(2, ap.getDoctorId());
			ps.setString(3, ap.getFullName());
			ps.setString(4, ap.getGender());
			ps.setString(5, ap.getAge());
			ps.setString(6, ap.getAppointmentDate());
			ps.setString(7, ap.getEmail());
			ps.setString(8, ap.getPhone());
			ps.setString(9, ap.getDiseases());
			ps.setString(10, ap.getAddress());
			ps.setString(11, "Pending");

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Appointment> getAppointmentsByDoctorId(int doctorId) {

		List<Appointment> list = new ArrayList<>();

		try {

			String sql = "select * from appointment where doctor_id=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, doctorId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Appointment ap = new Appointment();

				ap.setId(rs.getInt("id"));
				ap.setUserId(rs.getInt("user_id"));
				ap.setDoctorId(rs.getInt("doctor_id"));
				ap.setFullName(rs.getString("full_name"));
				ap.setGender(rs.getString("gender"));
				ap.setAge(rs.getString("age"));
				ap.setAppointmentDate(rs.getString("appointment_date"));
				ap.setEmail(rs.getString("email"));
				ap.setPhone(rs.getString("phone"));
				ap.setDiseases(rs.getString("diseases"));
				ap.setAddress(rs.getString("address"));
				ap.setStatus(rs.getString("status"));

				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Appointment> getAllAppointmentByLoginUser(int userId) {

		List<Appointment> list = new ArrayList<>();

		try {

			String sql = "select * from appointment where user_id=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Appointment ap = new Appointment();

				ap.setId(rs.getInt("id"));
				ap.setUserId(rs.getInt("user_id"));
				ap.setDoctorId(rs.getInt("doctor_id"));
				ap.setFullName(rs.getString("full_name"));
				ap.setGender(rs.getString("gender"));
				ap.setAge(rs.getString("age"));
				ap.setAppointmentDate(rs.getString("appointment_date"));
				ap.setEmail(rs.getString("email"));
				ap.setPhone(rs.getString("phone"));
				ap.setDiseases(rs.getString("diseases"));
				ap.setAddress(rs.getString("address"));
				ap.setStatus(rs.getString("status"));

				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public int countAppointment() {

		int i = 0;

		try {

			String sql = "select count(*) from appointment";

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
	
	public List<Appointment> getAllAppointments(){

		List<Appointment> list =
		new ArrayList<>();

		try{

			String sql =
			"select * from appointment";

			PreparedStatement ps =
			conn.prepareStatement(sql);

			ResultSet rs =
			ps.executeQuery();

			while(rs.next()){

				Appointment ap =
				new Appointment();

				ap.setId(rs.getInt("id"));
				ap.setFullName(rs.getString("full_name"));
				ap.setGender(rs.getString("gender"));
				ap.setAge(rs.getString("age"));
				ap.setAppointmentDate(
				rs.getString("appointment_date"));
				ap.setDiseases(
				rs.getString("diseases"));
				ap.setStatus(
				rs.getString("status"));

				list.add(ap);
			}

		}catch(Exception e){
			e.printStackTrace();
		}

		return list;
	}
}