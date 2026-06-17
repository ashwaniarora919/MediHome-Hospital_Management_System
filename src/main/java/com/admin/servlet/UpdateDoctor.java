package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDAO;
import com.db.DBConnect;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int id = Integer.parseInt(req.getParameter("id"));

			String fullName = req.getParameter("fullname");

			String email = req.getParameter("email");

			String password = req.getParameter("password");

			String specialist = req.getParameter("specialist");

			Doctor d = new Doctor();

			d.setId(id);
			d.setFullName(fullName);
			d.setEmail(email);
			d.setPassword(password);
			d.setSpecialist(specialist);

			DoctorDAO dao = new DoctorDAO(DBConnect.getConn());

			dao.updateDoctor(d);

			resp.sendRedirect("Admin/view_doctor.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}