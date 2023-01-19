package com.akhil.dao;

import java.util.List;

import com.akhil.beans.TransactionBean;

public interface TransDao {

	public String getUserId(String transId);
	public List<TransactionBean> getTransactionWithUserID(String userId);
	
}
