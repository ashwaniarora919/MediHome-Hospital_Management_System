package com.user.servlet;

import java.io.IOException;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userRegister")
public class UserRegister extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String fullName = req.getParameter("fullName");

		String email = req.getParameter("email");

		String password = req.getParameter("password");

		User u = new User(fullName, email, password);

		UserDAO dao = new UserDAO(DBConnect.getConn());
		
		HttpSession session = req.getSession();
		
		if(dao.checkEmail(email)){

			session.setAttribute(
			"errorMsg",
			"Email Already Registered");

			resp.sendRedirect("signup.jsp");

			return;
		}

		if (dao.register(u)) {

			resp.sendRedirect("user_login.jsp");

		} else {

			resp.getWriter().println("Something Went Wrong");
		}
	}
}