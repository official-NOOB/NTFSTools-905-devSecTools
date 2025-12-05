package com.nit.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/delete")
public class DeleteProductServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session =req.getSession(false);
		if(session==null) {
			req.getRequestDispatcher("AdminLogin.html").forward(req, resp);
		}
		else {
			 int rowCount = new DeleteProductDAO().deleteProduct(req.getParameter("pcode"));
			 if(rowCount>0) {
				 req.setAttribute("msg", "Product deleted");
				 req.getRequestDispatcher("DeleteProduct.jsp").forward(req, resp);
			 }
			 else
				 throw new RuntimeException("Product deleted failed");
			 
		}
	}
}
