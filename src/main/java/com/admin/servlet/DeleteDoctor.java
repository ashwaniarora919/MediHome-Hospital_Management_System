package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDAO;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		DoctorDAO dao = new DoctorDAO(DBConnect.getConn());

		HttpSession session = req.getSession();

		if (dao.deleteDoctor(id)) {

			session.setAttribute("succMsg", "Doctor Deleted Successfully");

		} else {

			session.setAttribute("errorMsg", "Something Went Wrong");
		}

		resp.sendRedirect("Admin/view_doctor.jsp");
	}
}