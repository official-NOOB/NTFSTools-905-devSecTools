package com.nt.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/clog")
public class CustomerLoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerBean cbean = new CustomerLoginDAO().customerLogin(req.getParameter("cname"), req.getParameter("cpwd"));
		if(cbean==null) {
			req.getRequestDispatcher("CustomerLogin.html").forward(req, resp);
			
		}
		else {
			 HttpSession session = req.getSession();
			 session.setAttribute("CustomerBean", cbean);
			 req.getRequestDispatcher("CustomerHome.jsp").forward(req, resp);
		}
	}
}
