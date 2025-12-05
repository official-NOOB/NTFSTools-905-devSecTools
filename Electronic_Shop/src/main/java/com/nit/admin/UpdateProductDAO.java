package com.nit.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateProductDAO {
	
	public int updateProduct(ProductBean pb) {
		
		int rowCount = 0;
		try {
			Connection con = DBConnect.connect();
			PreparedStatement pstmt = con.prepareStatement("Update product set pprice = ?, pqty = ? where pcode = ?");
			pstmt.setString(1, pb.getP_price());
			pstmt.setString(2, pb.getP_qty());
			pstmt.setString(3, pb.getP_code());
			
			rowCount= pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rowCount;
	}
}
