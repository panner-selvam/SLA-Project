package com.sla.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.Database;

/**
 * Servlet implementation class User_password_change
 */
@WebServlet("/User_password_change")
public class User_password_change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_password_change() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				PrintWriter out = response.getWriter();
				String id="",password="",status="";
				id = request.getParameter("id");
				password = request.getParameter("password");
				System.out.println(id+" "+password);
				
				Connection con=null;
				Database db=new Database();
				try {
					con = db.connection_get();
					if(con!=null) {
						String query = "UPDATE mastr_user SET pwd='"+password+"' WHERE id='"+id+"'";
						status = db.UpdateQuery(query, con);
						System.out.println(status);
						out.print(status);
					}
				}catch(Exception e) {
					System.out.println(e);
				}
	}

}
