package com.akhil.srv;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.akhil.beans.UserBean;
import com.akhil.dao.UserDaoImpl;


@WebServlet("/LoginSrv")
public class LoginSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginSrv() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String userType = request.getParameter("usertype");
		
		PrintWriter pw = response.getWriter();
		
		response.setContentType("text/html");
		
		String status = "Login Denied! Invalid Username or password.";
		
		if(userType.equals("admin")){
			
			if(password.equals("Admin") && userName.equals("Admin")) {
				
				
				RequestDispatcher rd = request.getRequestDispatcher("adminViewProduct.jsp");
				
				HttpSession session = request.getSession();
				
				session.setAttribute("username", userName);
				session.setAttribute("password", password);
				session.setAttribute("usertype", userType);
				
				
				rd.forward(request, response);
				
				
			}
			else {
				
				RequestDispatcher rd = request.getRequestDispatcher("loginAdmin.jsp");
				
				rd.include(request, response);
				pw.println("<script>document.getElementById('message').innerHTML='"+status+"'</script>");
			}
			
			
		}
		else { 
			
			 UserDaoImpl udao = new UserDaoImpl();
			
			 status = udao.isValidCredential(userName, password);
			 
			 if(status.equalsIgnoreCase("valid")) {
				 
				 
				 UserBean user = udao.getUserDetails(userName, password);
				 
				 HttpSession session = request.getSession();
				 
				 session.setAttribute("userdata", user);
				 
				 session.setAttribute("username", userName);
				 session.setAttribute("password", password);
				 session.setAttribute("usertype", userType);
				 
				 RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
				 
				 rd.forward(request, response);
				 
			 }
			 else {
				
				 
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					
				rd.include(request, response);
				
				pw.println("<script>document.getElementById('message').innerHTML='"+status+"'</script>");
				 
				 
			 }
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
