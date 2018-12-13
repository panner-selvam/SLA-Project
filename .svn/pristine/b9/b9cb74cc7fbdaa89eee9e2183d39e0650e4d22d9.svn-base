package com.sla.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import Database.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

/**
 * Servlet implementation class Current_password_checking
 */
@WebServlet("/Current_password_checking")
public class Current_password_checking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Current_password_checking() {
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
		PrintWriter out = response.getWriter();
		String id="",password="",db_password=null;
		id = request.getParameter("id");
		password = request.getParameter("password");
		System.out.println(id+" "+password);
		
		Connection con=null;
		Database db=new Database();
		try {
			con = db.connection_get();
			if(con!=null) {
				String query = "select pwd from dbo.mastr_user where id='"+id+"'";
				ResultSet rs= db.SelectData(query, con);
				if(rs!=null) {
					if(rs.next()) {						
						db_password=rs.getString("pwd");
					}
				}
				if(db_password.equals(password)) {
					out.print("matched");
				}else {
					out.print("Not matched");
				}
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

}
