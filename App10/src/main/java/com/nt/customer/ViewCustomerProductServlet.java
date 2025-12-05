package com.nt.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nit.admin.ProductBean;
@WebServlet("/view")
public class ViewCustomerProductServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		if(session==null) {
			req.getRequestDispatcher("CustomerLogin.html").forward(req, resp);
		}
		else {
			ArrayList<ProductBean> al = new ViewCustomerProductDAO().viewProduct();
			session.setAttribute("ProductList", al);
			req.getRequestDispatcher("ViewCustomerProduct.jsp").forward(req, resp);
		}
	}
		

}
