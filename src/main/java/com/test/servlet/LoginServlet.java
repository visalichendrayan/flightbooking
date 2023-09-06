package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.util.DBUtil;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username
				!= null && username.equals("admin") && password != null && password.equals(DBUtil.getAdminPasswordByName(username.strip()))) {
			 HttpSession session=request.getSession();  
		        session.setAttribute("name",username);  
           response.sendRedirect("Dashboard.html");
		}else {
			RequestDispatcher rd=request.getRequestDispatcher("/AdminLogin.jsp");
			response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();  
			out.println("<p style=\"color:red;\">username or password is wrong</p>");
			out.close();
			rd.include(request, response);
		}
	}

}
