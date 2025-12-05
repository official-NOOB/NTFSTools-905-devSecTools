package com.nt.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.nit.admin.DBConnect;
import com.nit.admin.ProductBean;

public class ViewCustomerProductDAO {
	//ArrayList<CustomerBean> al = new ArrayList<CustomerBean>();
	
	public ArrayList<ProductBean> viewProduct() {

	    ArrayList<ProductBean> al = new ArrayList<>();  

	    try {
	        Connection con = DBConnect.connect();
	        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM product");
	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            ProductBean pb = new ProductBean();
	            pb.setP_code(rs.getString(1));
	            pb.setP_name(rs.getString(2));
	            pb.setP_company(rs.getString(3));
	            pb.setP_price(rs.getString(4));
	            pb.setP_qty(rs.getString(5));
	            al.add(pb);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return al;
	}

}
