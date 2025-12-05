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

@WebServlet("/Update2")
public class UpdateCustomerProductServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {
        HttpSession session = req.getSession(false);

        if(session == null)
        {
            req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
            return;
        }

        String pcode = req.getParameter("pcode");
        String buyQty = req.getParameter("bqty");
        String availableQty = req.getParameter("availableqty");
        String price = req.getParameter("price");
        String reqNo = req.getParameter("reqNo");

        int aQty = Integer.parseInt(availableQty);
        int bQty = Integer.parseInt(buyQty);
        int updatedPrice = Integer.parseInt(price);

        ArrayList<ProductBean> al = 
            (ArrayList<ProductBean>) session.getAttribute("ProductList"); // FIXED

        ProductBean pb = null;

        for(ProductBean p : al)
        {
            if(p.getP_code().equals(pcode))
            {
                pb = p;
                break;
            }
        }

        if(bQty > aQty)
        {
            req.setAttribute("msg", "Not enough quantity!");
            req.setAttribute("pbitem", pb);
            req.setAttribute("reqNo", reqNo);
            req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
            return;
        }

        int remaining = aQty - bQty;
        String updatedQty = String.valueOf(remaining);

        int rowCount = new UpdateCustomerProductDAO()
                .updateQty(pcode, updatedQty);

        if(rowCount > 0)
        {
            pb.setP_qty(updatedQty); // update AL also

            int total = bQty * updatedPrice;

            req.setAttribute("amount", total);
            req.setAttribute("reqNo", reqNo);

            req.getRequestDispatcher("OrderedConfirmed.jsp")
                    .forward(req, res); // FIXED NAME
        }
        else
        {
            req.setAttribute("msg", "Order Failed");
            req.setAttribute("pbitem", pb);
            req.getRequestDispatcher("BuyProduct.jsp").forward(req, res);
        }
    }
}
