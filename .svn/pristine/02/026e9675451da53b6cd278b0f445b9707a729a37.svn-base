package com.sla.report;

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

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class Fetching_user_details
 */
@WebServlet("/Fetching_user_details")
public class Fetching_user_details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_user_details() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con;
		String id = request.getParameter("id");
		String query="";
		JSONArray arr=new JSONArray();

		try {
			con = db.connection_get();
			if(con!=null) {
				query = "select CONVERT(char(10),ActDate,6) AS date,* from mastr_user where Id='"+id+"'";
				ResultSet rs = db.SelectData(query, con);
				if(rs!=null) {
					while(rs.next()) {
						JSONObject obj = new JSONObject();
						obj.put("id", rs.getString("Id"));
						obj.put("officer_name", rs.getString("OfficerName"));
						obj.put("user_name", rs.getString("Username"));
						obj.put("password", rs.getString("pwd"));
						obj.put("mobile_no", rs.getString("MobileNo"));
						obj.put("department", rs.getString("Department"));
						obj.put("role", rs.getString("role"));
						obj.put("photo", rs.getString("Photo"));
						obj.put("registered_date", rs.getString("date"));
						arr.put(obj);						
					}
				}
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		out.print(arr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con;
		con =null;
		Database db = new Database();
		String query="",list="";
		JSONArray arr=new JSONArray();
		PrintWriter out = response.getWriter();
		list = request.getParameter("list");
		
		if(list.equals("Super Admin")) {
			query = "select * from mastr_user where role='Super Admin'";
		}else if(list.equals("Admin")) {
			query = "select * from mastr_user where role='Admin'";
		}else if(list.equals("User")) {
			query = "select * from mastr_user where role='User'";
		}else {
			query = "select * from mastr_user";
		}
		try {
			con = db.connection_get();
			if(con!=null) {
				ResultSet rs = db.SelectData(query, con);
				if(rs!=null) {
					
					while(rs.next()) {
						JSONObject obj = new JSONObject();
						obj.put("officer_name", rs.getString("OfficerName"));
						obj.put("username", rs.getString("Username"));
						obj.put("department", rs.getString("Department"));
						obj.put("role", rs.getString("role"));
						obj.put("id", rs.getString("Id"));
						arr.put(obj);
			
					}				
				}
				
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		out.print(arr);
	}

}
