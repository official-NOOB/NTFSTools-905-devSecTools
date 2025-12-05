package com.nt.customer;

import java.io.IOException;
import java.util.ArrayList;

import com.nit.admin.ProductBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
