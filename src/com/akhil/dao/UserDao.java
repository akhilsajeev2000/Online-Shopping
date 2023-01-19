package com.akhil.dao;

import java.util.List;

import com.akhil.beans.CartBean;
import com.akhil.beans.UserBean;

public interface UserDao {
	
	
	public String registerUser(String userName,Long mobileNo,String emailId,String address,int pinCode,String password);
	
	public String registerUser(UserBean user);
	
	public boolean isRegistered(String emailId);
		
	public String isValidCredential(String emailId, String password);
	
	public UserBean getUserDetails(String emailId,String password);
	
	public String getFName(String emailId);
	
	public String getUserAddr(String userId);
	
	
}
