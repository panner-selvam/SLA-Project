package com.sla.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import Database.Database;

/**
 * Servlet implementation class Fetching_quartely_chart_report
 */
@WebServlet("/Fetching_quartely_chart_report")
public class Fetching_quartely_chart_report extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Fetching_quartely_chart_report() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query="",startDate="",endDate="";
		startDate = request.getParameter("startDate");
		endDate = request.getParameter("endDate");
		System.out.println(startDate+""+endDate);
		PrintWriter out = response.getWriter();
		Connection con = null;
		Database db = new Database();
		JSONArray arr = new JSONArray();
		try {
			con = db.connection_get();
			if (con != null) {
				//query = "select id,(Series_No+' '+Series_Name) Series,points,status,convert (varchar(10),Inserteddate,101)as date from Bind_SLA_Module_Points WHERE CONVERT(varchar(10),Inserteddate,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date) AND isactive='1' order by series_order asc";
				query = "select series_order,(Module_No+' '+Module_Name) Module,Module_No,(Series_No+' '+Series_Name) Series," + 
						"	convert(numeric(10,2),( ROUND(SUM( cast (points as Float) ) / COUNT(*), 2)) ) points " + 
						"	 from Bind_SLA_Module_Points where CONVERT(varchar(10),Inserteddate,101) BETWEEN "
						+ "CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date) and isactive='1'" + 
						"   	group by series_order, Module_No,Module_Name,Series_No,Series_Name 	order by series_order asc ";
				ResultSet req = db.SelectData(query, con);
				if (req != null) {
					
					while (req.next()) {
						
						JSONObject obj = new JSONObject();
						obj.put("module_no",req.getString("Module_No"));
						obj.put("module",req.getString("Module"));
						obj.put("series",req.getString("Series"));
						obj.put("points",req.getString("points"));
						
						arr.put(obj);
						
					}
				}

			} 
		}catch (Exception e) {
			System.out.println("err :" + e);
		}
		System.out.println(arr);
		out.println(arr);

	}

}
