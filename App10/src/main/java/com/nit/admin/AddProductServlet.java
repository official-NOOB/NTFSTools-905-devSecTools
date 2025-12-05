package com.nit.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/aps")
public class AddProductServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession(false);
			
			if(session==null) {
				req.getRequestDispatcher("AdminLogin.html").forward(req, resp);
			}
			else {
				ProductBean pb = new ProductBean();
				pb.setP_code(req.getParameter("pcode"));
				pb.setP_name(req.getParameter("pname"));
				pb.setP_company(req.getParameter("pcomp"));
				pb.setP_price(req.getParameter("pprice"));
				pb.setP_qty(req.getParameter("pqty"));
				
				int rowCount = new AddProductDAO().insertProduct(pb);
				if(rowCount>0) {
					req.setAttribute("msg", "Product added to the inventry");
					req.getRequestDispatcher("AddProduct.jsp").forward(req, resp);
				}
				/*else {
					throw new RuntimeException("Product inventory not updated");
				}*/
				
			}
		} catch (Exception e) {
			req.setAttribute("msg", "Duplictae product ID's are not allowed");
			req.getRequestDispatcher("Error.jsp").forward(req, resp);
		}
	}
}
