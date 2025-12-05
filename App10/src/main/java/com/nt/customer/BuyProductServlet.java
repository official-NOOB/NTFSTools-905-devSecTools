package com.nt.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nit.admin.ProductBean;

@WebServlet("/Buy")
public class BuyProductServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
            throws ServletException, IOException
    {
        HttpSession session = req.getSession(false);

        if(session == null)
        {
            req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
            return;
        }

        String pcode = req.getParameter("pcode");

        ArrayList<ProductBean> al = 
            (ArrayList<ProductBean>) session.getAttribute("ProductList"); // FIXED

        if(al == null)
        {
            req.getRequestDispatcher("view2").forward(req, res);
            return;
        }

        ProductBean pb = null;

        for(ProductBean p : al)
        {
            if(p.getP_code().equals(pcode))
            {
                pb = p;
                break;
            }
        }

        long reqNo = System.currentTimeMillis() + (long)(Math.random() * 1000);

        req.setAttribute("pbitem", pb);
        req.setAttribute("reqNo", String.valueOf(reqNo));

        req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
    }
}
