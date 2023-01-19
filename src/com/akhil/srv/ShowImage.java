package com.akhil.srv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.akhil.dao.ProductDaoImpl;

@WebServlet("/ShowImage")
public class ShowImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public ShowImage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String prodId = request.getParameter("pid");
		
	

		ProductDaoImpl dao = new ProductDaoImpl();
		
		byte[] image = dao.getImage(prodId);
		
		
		
		ServletOutputStream sos = null;

		sos = response.getOutputStream();
		
		sos.write(image);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
