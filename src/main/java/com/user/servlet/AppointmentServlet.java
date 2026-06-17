package com.user.servlet;

import java.io.IOException;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int userId = Integer.parseInt(req.getParameter("userId"));

			int doctorId = Integer.parseInt(req.getParameter("doctorId"));

			String fullName = req.getParameter("fullName");

			String gender = req.getParameter("gender");

			String age = req.getParameter("age");

			String appointDate = req.getParameter("appointmentDate");

			String email = req.getParameter("email");

			String phone = req.getParameter("phone");

			String diseases = req.getParameter("diseases");

			String address = req.getParameter("address");

			Appointment ap = new Appointment();

			ap.setUserId(userId);
			ap.setDoctorId(doctorId);
			ap.setFullName(fullName);
			ap.setGender(gender);
			ap.setAge(age);
			ap.setAppointmentDate(appointDate);
			ap.setEmail(email);
			ap.setPhone(phone);
			ap.setDiseases(diseases);
			ap.setAddress(address);

			AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());

			HttpSession session = req.getSession();

			if (dao.addAppointment(ap)) {

				session.setAttribute("succMsg", "Appointment Booked Successfully");

			} else {

				session.setAttribute("errorMsg", "Something Went Wrong");
			}

			resp.sendRedirect("appointment.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}