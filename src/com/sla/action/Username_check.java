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
 * Servlet implementation class Username_check
 */
@WebServlet("/Username_check")
public class Username_check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Username_check() {
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
		String query="",username="";
		username = request.getParameter("username");
		Database db = new Database();
		PrintWriter out = response.getWriter();
		Connection con=null;
		try {
			con = db.connection_get();
			if(con!=null) {
				query = "select Username from mastr_user where IsActive='1'";
				ResultSet rs = db.SelectData(query,con);
				if(rs!=null) {
					while(rs.next()) {
						if(username.equals(rs.getString("Username"))) {
							out.print("Unavailable");
						} 
					}
				}
			}
		}catch(Exception e) {
			
		}
		
	}

}
