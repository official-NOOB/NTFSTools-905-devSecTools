package com.nt.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/creg")
public class CustomerRegistrationServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CustomerBean bean = new CustomerBean();
		bean.setC_uname(req.getParameter("uname"));
		bean.setC_upwd(req.getParameter("upwd"));
		bean.setC_fname(req.getParameter("ufname"));
		bean.setC_lname(req.getParameter("ulname"));
		bean.setC_addr(req.getParameter("caddr"));
		bean.setC_mail(req.getParameter("umid"));
		bean.setC_phno(req.getParameter("uphone"));
		
		int rowCount = new CustomerRegisterDAO().customerRegistration(bean);
		
		if(rowCount==0) {
			req.setAttribute("msg", "Customer Data not Inserted");
			req.getRequestDispatcher("CustomerRegister.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("msg", "Customer data Inserted");
			req.getRequestDispatcher("CustomerRegister.jsp").forward(req, resp);
		}
	}
}
