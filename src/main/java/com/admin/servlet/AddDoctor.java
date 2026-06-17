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
import jakarta.servlet.http.HttpSession;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullName = req.getParameter("fullName");

			String email = req.getParameter("email");

			String password = req.getParameter("password");

			String specialist = req.getParameter("specialist");

			Doctor d = new Doctor(fullName, email, password, specialist);

			DoctorDAO dao = new DoctorDAO(DBConnect.getConn());

			HttpSession session = req.getSession();

			if(dao.checkDoctorEmail(email)) {

				session.setAttribute(
				"errorMsg",
				"Doctor Email Already Exists");

				resp.sendRedirect(
				"Admin/add_doctor.jsp");

				return;
			}

			if(dao.addDoctor(d)) {

				session.setAttribute("succMsg", "Doctor Added Successfully");

			} else {

				session.setAttribute("errorMsg", "Something Went Wrong");
			}

			resp.sendRedirect("Admin/add_doctor.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}