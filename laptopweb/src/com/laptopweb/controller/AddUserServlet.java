package com.laptopweb.controller;

import com.laptopweb.dao.UserDAO;
import com.laptopweb.model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String userrole = request.getParameter("userrole");

		User user = new User();
		user.setFullname(fullname);
		user.setUsername(username);
		user.setPassword(password1);
		user.setUserrole(Integer.parseInt(userrole));

		System.out.println(userrole);
		System.out.println(UserDAO.insertUser(user));
		response.sendRedirect("usersManagement.jsp");

	}

}
