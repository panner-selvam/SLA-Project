package com.sla.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import Database.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class User_registraion
 */
@WebServlet("/User_registraion")
public class User_registraion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_registraion() {
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
		
		String officer_name="",username="",password="",role="",department="",mobile_number="",query="",photo="null";
		
		officer_name = request.getParameter("officer_name");
		username = request.getParameter("username");
		password = request.getParameter("password");
		role = request.getParameter("role");
		department = request.getParameter("department");
		mobile_number = request.getParameter("mobile_number");
		
		PrintWriter out = response.getWriter();
		Connection con;
		con = null;
		Database db = new Database();
		
		try {
			con= db.connection_get();
			if(con!=null) {
				query ="insert into mastr_user (OfficerName,Username,pwd,MobileNo,Department,role,photo) values ('"+officer_name+"','"+username+"','"+password+"','"+mobile_number+"','"+department+"','"+role+"','"+photo+"')";
				String status = db.InsertQuery(query, con);
				out.print(status);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

}
