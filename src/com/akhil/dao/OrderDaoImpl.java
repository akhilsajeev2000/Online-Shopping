package com.akhil.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.akhil.beans.CartBean;
import com.akhil.beans.OrderBean;
import com.akhil.beans.TransactionBean;
import com.akhil.beans.UserBean;
import com.akhil.utility.DBUtil;

public class OrderDaoImpl implements OrderDao{

	@Override
	public String paymentSuccess(String userName,double paidAmount) {
		String status = "Order Placement Failed!";
		
		
		List<CartBean> cartItems = new ArrayList<CartBean>();
		cartItems = new CartDaoImpl().getAllCartItems(userName);
		
		if(cartItems.size()==0)
				return status;
		
		
		TransactionBean transaction = new TransactionBean(userName,paidAmount) ;
		
		
		PreparedStatement ps1 = null;
		
		int p=0,q=0,k=0;
		boolean flag = false;
		
		String transactionId = transaction.getTransactionId();
		
		if(transaction != null) {
			//System.out.println("Transaction: "+transaction.getTransactionId()+" "+transaction.getTransAmount()+" "+transaction.getUserName()+" "+transaction.getTransDateTime());
			
			for(CartBean item : cartItems) {
				
				double amount = new ProductDaoImpl().getProductPrice(item.getProdId()) * item.getQuantity(); 
				
				OrderBean order = new OrderBean(transactionId, item.getProdId(), item.getQuantity(), amount);
				
				flag = addOrder(order);
				if(!flag)
					break;
				else {
					flag = new CartDaoImpl().removeAProduct(item.getUserId(), item.getProdId());
				}
				
				if(!flag)
					break;
				else
					flag = new ProductDaoImpl().sellNProduct(item.getProdId(), item.getQuantity());
				
				if(!flag)
					break;
			}
			
			if(flag) {
				flag = new OrderDaoImpl().addTransaction(transaction);
				if(flag) {
					
					
					status = "Order Placed Successfully!";
				}
			}
			
		}
		
		
		return status;
	}

	@Override
	public boolean addOrder(OrderBean order) {
		boolean flag= false;
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement("insert into orders values(?,?,?,?,?)");
			
			ps.setString(1, order.getTransactionId());
			ps.setString(2, order.getProductId());
			ps.setInt(3, order.getQuantity());
			ps.setDouble(4, order.getAmount());
			ps.setInt(5, 0);
			
			int k = ps.executeUpdate();
			
			if(k>0)
				flag = true;
			
		} catch (SQLException e) {
			flag = false;
			e.printStackTrace();
		}
		
		
		
		return flag;
	}

	@Override
	public boolean addTransaction(TransactionBean transaction) {
		boolean flag = false;
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement("insert into transactions values(?,?,?,?)");
			
			ps.setString(1, transaction.getTransactionId());
			ps.setString(2, transaction.getUserName());
			ps.setTimestamp(3, transaction.getTransDateTime());
			ps.setDouble(4, transaction.getTransAmount());
			
			int k = ps.executeUpdate();
			
			if(k>0)
				flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public int countSoldItem(String prodId) {
		int count = 0;
		
		Connection  con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select sum(quantity) from orders where prodid=?");
			
			ps.setString(1, prodId);
			
			rs = ps.executeQuery();
			
			if(rs.next())
				count = rs.getInt(1);
			
		} catch (SQLException e) {
			count = 0;
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		
		
		return count;
	}

	@Override
	public List<OrderBean> getAllOrders() {
		List<OrderBean> orderList = new ArrayList<OrderBean>();
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = con.prepareStatement("select * from orders");
			
			rs = ps.executeQuery();
			
			
			while(rs.next()) {
				
				OrderBean order = new OrderBean(rs.getString("transid"),rs.getString("prodid"),rs.getInt("quantity"),rs.getDouble("amount"),rs.getInt("shipped"));
				
				orderList.add(order);

			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		return orderList;
	}

	@Override
	public List<OrderBean> getOrders(String userName) {
		List<OrderBean> orderBeans = new ArrayList<OrderBean>();
		List<TransactionBean> transactionBeans = new TransDaoImpl().getTransactionWithUserID(userName);
		for(TransactionBean transactionBean : transactionBeans) {
			orderBeans.add(getOrderWithTransactionID(transactionBean.getTransactionId()));
		}
		
		
		return orderBeans;
	}

	@Override
	public OrderBean getOrderWithTransactionID(String transactionId) {
		OrderBean orderBean = new OrderBean();
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = con.prepareStatement("select * from orders where transid=?");
			
			ps.setString(1, transactionId);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				orderBean.setTransactionId(rs.getString(1));
			orderBean.setProductId(rs.getString(2));
			orderBean.setQuantity(rs.getInt(3));
			orderBean.setAmount(rs.getDouble(4));
			orderBean.setShipped(rs.getInt(5));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderBean;
	}
	
	

}
