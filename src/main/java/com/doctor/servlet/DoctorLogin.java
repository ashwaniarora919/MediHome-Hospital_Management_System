package com.doctor.servlet;

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

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		DoctorDAO dao = new DoctorDAO(DBConnect.getConn());

		Doctor d = dao.login(email, password);

		HttpSession session = req.getSession();

		if (d != null) {

			session.setAttribute("docObj", d);

			resp.sendRedirect("Doctor/index.jsp");

		} else {

			session.setAttribute("errorMsg", "Invalid Email or Password");

			resp.sendRedirect("doctor_login.jsp");
		}
	}
}