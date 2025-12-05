package com.nt.customer;


import java.sql.Connection;
import java.sql.PreparedStatement;

import com.nit.admin.DBConnect;

public class UpdateCustomerProductDAO
{
	public int updateQty(String pcode,String newQty)
	{
		int rowCount=0;
		
		try
		{
			Connection con = DBConnect.connect();
			PreparedStatement pstmt = con.prepareStatement("UPDATE PRODUCT SET PQTY = ? WHERE PCODE = ?");
			
			pstmt.setString(1, newQty);
			pstmt.setString(2, pcode);
			
			rowCount = pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rowCount;
	}
}
