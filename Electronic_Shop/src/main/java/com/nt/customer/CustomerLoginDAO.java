package com.nt.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.nit.admin.DBConnect;

public class CustomerLoginDAO {
	
	public CustomerBean customerLogin(String uname, String pwd) {
		CustomerBean cb  = null;
		try {
			Connection con = DBConnect.connect();
			PreparedStatement pstmt = con.prepareStatement("Select * from customer where UNAME = ? and PWORD = ?");
			pstmt.setString(1, uname);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				cb = new CustomerBean();
				cb.setC_uname(rs.getString(1));
				cb.setC_upwd(rs.getString(2));
				cb.setC_fname(rs.getString(3));
				cb.setC_lname(rs.getString(4));
				cb.setC_addr(rs.getString(5));
				cb.setC_mail(rs.getString(6));
				cb.setC_phno(rs.getString(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cb;
	}
}
