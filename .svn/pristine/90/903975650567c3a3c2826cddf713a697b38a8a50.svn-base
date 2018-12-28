package com.sla.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.Database;

/**
 * Servlet implementation class Edit_db_user_details
 */
@WebServlet("/Edit_db_user_details")
public class Edit_db_user_details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit_db_user_details() {
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
		
		
		Connection con = null;
		Database db = new Database();
		PrintWriter out = response.getWriter();
		
		String id= ""+request.getParameter("id");
		String officer_name= ""+request.getParameter("officer_name");
		String username= ""+request.getParameter("username");
		String password= ""+request.getParameter("password");
		String department= ""+request.getParameter("department");
		String role= ""+request.getParameter("role");
		String mobile_no= ""+request.getParameter("mobile_no");
		String status="failure";
	
		try {
			con = db.connection_get();
			if(con!=null) {
				String query = "update mastr_user set OfficerName='"+officer_name+"', Username='"+username+"', pwd='"+password+"', MobileNo='"+mobile_no+"', Department='"+department+"', role='"+role+"' where Id='"+id+"'";
				status = db.UpdateQuery(query, con);
				
				if(status.equalsIgnoreCase("SUCCESS")) {
					status="success";
				}else {
					status="failure";
				}
			}
			System.out.println("Status"+status);
			out.print(status);
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
