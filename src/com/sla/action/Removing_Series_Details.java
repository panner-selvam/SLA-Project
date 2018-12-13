package com.sla.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.cloudme.sample.aes.AesUtil;

import Database.Database;

/**
 * Servlet implementation class Removing_Series_Details
 */
@WebServlet("/Removing_Series_Details")
public class Removing_Series_Details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Removing_Series_Details() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		System.out.println(">>>Removing_Project_List");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;	
		ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		String itcnt = resource.getString("itcnt");
		String ksize = resource.getString("ksize");		
		String salt = resource.getString("salt");
		String iv =  resource.getString("iv");
		int iterationCount = Integer.parseInt(itcnt);
		int keySize = Integer.parseInt(ksize);
		AesUtil aesUtil = new AesUtil(keySize, iterationCount);	
		String id=""+request.getParameter("id");
		id=id.trim();
		String val=""+request.getParameter("val");
		val=val.trim();
		String status="failure";
		try {
			con = db.connection_get();
			if (con != null) {
				if(val.equalsIgnoreCase("series")) {
				String query = "update Mstr_Reports set isactive=0 where id='"+id+"' and isactive=1";
				status = db.InsertQuery(query, con);
				
				}else {
					String query1 = "update Mstr_SubReports set isactive='0' where id='"+id+"' and isactive=1";
					status = db.InsertQuery(query1, con);	
				}
				}
			
			out.println(aesUtil.encrypt(salt, iv, "data",status));			
			out.close();
			con.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
