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
 * Servlet implementation class Delete_user
 */
@WebServlet("/Delete_user")
public class Delete_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_user() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id"); 
		Connection con= null;
		Database db = new Database();
		PrintWriter out = response.getWriter();
		
		try {
			con = db.connection_get();
			if(con!=null) {
				String query = "update mastr_user set IsActive=0 where Id ="+id+"";
				String STATUS= db.DeleteQuery(query,con);
				if(STATUS.equals("SUCCESS")) {
					out.print("SUCCESS");
				}else {
					out.print("FAILURE");
				}
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
