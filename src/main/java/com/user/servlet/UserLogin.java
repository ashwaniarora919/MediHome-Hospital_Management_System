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

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");

		String password = req.getParameter("password");

		UserDAO dao = new UserDAO(DBConnect.getConn());

		User u = dao.login(email, password);

		HttpSession session = req.getSession();

		if (u != null) {

			session.setAttribute("userObj", u);

			resp.sendRedirect("User/index.jsp");

		} else {

			session.setAttribute("errorMsg", "Invalid Email & Password");

			resp.sendRedirect("user_login.jsp");
		}
	}
}