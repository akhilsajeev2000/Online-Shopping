package com.akhil.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.akhil.beans.OrderBean;
import com.akhil.beans.TransactionBean;
import com.akhil.utility.DBUtil;

public class TransDaoImpl implements TransDao{

	@Override
	public String getUserId(String transId) {
		String userId = "";
		
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = con.prepareStatement("select username from transactions where transid=?");
			
			ps.setString(1, transId);
			
			rs = ps.executeQuery();
			
			if(rs.next())
				userId = rs.getString(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
		
		return userId;
	}

	@Override
	public List<TransactionBean> getTransactionWithUserID(String userId) {
		Connection con = DBUtil.provideConnection();
		List<TransactionBean> transactionBeans = new ArrayList<TransactionBean>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = con.prepareStatement("select * from transactions where username=?");
			
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
       while(rs.next()) {
				
				TransactionBean transaction = new TransactionBean(rs.getString("transid"),rs.getString("username"),rs.getTimestamp("time"),rs.getDouble("amount"));
				
				transactionBeans.add(transaction);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return transactionBeans;
	}

}
