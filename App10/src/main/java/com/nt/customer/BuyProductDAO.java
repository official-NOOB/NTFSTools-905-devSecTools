package com.nt.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.nit.admin.DBConnect;
import com.nit.admin.ProductBean;

public class BuyProductDAO {

    public ProductBean buyProduct(String pcode) {
        ProductBean pb = null;

        try {
            Connection con = DBConnect.connect();
            PreparedStatement pstmt =
                con.prepareStatement("SELECT * FROM product WHERE PCODE=?");

            pstmt.setString(1, pcode);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                pb = new ProductBean();
                pb.setP_code(rs.getString("PCODE"));
                pb.setP_name(rs.getString("PNAME"));
                pb.setP_company(rs.getString("PCOMPANY"));
                pb.setP_price(rs.getString("PPRICE"));
                pb.setP_qty(rs.getString("PQTY"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return pb;
    }
}
