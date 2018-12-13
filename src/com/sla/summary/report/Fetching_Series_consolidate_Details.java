package com.sla.summary.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import Database.Database;

/**
 * Servlet implementation class Fetching_Series_consolidate_Details
 */
@WebServlet("/Fetching_Series_consolidate_Details")
public class Fetching_Series_consolidate_Details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_Series_consolidate_Details() {
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
		System.out.println(">>>>>>>>>>Fetching_Series_consolidate_Details>>>>>>>>>");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		JSONObject obj = null;
		JSONArray arr = new JSONArray();
		
		String series=""+request.getParameter("series");
		String dp_start=""+request.getParameter("dp_start");
		String dp_end=""+request.getParameter("dp_end");
		String val=""+request.getParameter("val");
		
		System.out.println("val::::::"+val);
		String cond = "";
		if (val.equalsIgnoreCase("search")) {

			if(!dp_start.equalsIgnoreCase("null") && !dp_start.equalsIgnoreCase("")){		
				cond=cond+" and CAST(CONVERT(char(10),dateofresponse,126) AS DATE) >= CAST(CONVERT(char(10), '"+dp_start+"',126) AS DATE)";
			}
			if(!dp_end.equalsIgnoreCase("null") && !dp_end.equalsIgnoreCase("")){				
				cond=cond+" and CAST(CONVERT(char(10),dateofresponse,126) AS DATE)<= CAST(CONVERT(char(10), '"+dp_end+"',126) AS DATE)";
			}
			if(!series.equalsIgnoreCase("null") && !series.equalsIgnoreCase("")&& !series.equalsIgnoreCase("select")){		
				cond = cond + " and Module_No = '" + series + "'";
			} 
		
		}else{
			cond="";
		}
		
		
		String Percentage="",points="",status="", Series = "",Module="",date="";
		try {
			con = db.connection_get();
			if (con != null) {
				String query = "	select series_order,(Module_No+' '+Module_Name) Module,(Series_No+' '+Series_Name) Series, "
			+"	convert(numeric(10,2),( ROUND(SUM( cast (points as Float) ) / COUNT(*), 2)) ) points "
						+"		 from Bind_SLA_Module_Points where isactive='1'  "+cond+"  "
						+"	group by series_order, Module_No,Module_Name,Series_No,Series_Name "
						+"	order by series_order asc ";
				 
			//	String query = "select (Module_No+' '+Module_Name) Module,(Series_No+' '+Series_Name) Series,convert(numeric(10,2),( ROUND(SUM( cast (Percentage as Float) ) / COUNT(*), 2)) ) Percentage,convert(numeric(10,2),( ROUND(SUM( cast (points as Float) ) / COUNT(*), 2)) ) points,status from Bind_SLA_Module_Points where isactive='1' "+cond+"  group by  Module_No,Module_Name,Series_No,Series_Name order by series_order asc";
				ResultSet rs = db.SelectData(query, con);
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
						
						/*date = "" + rs.getString("date");
						if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
							date="";
						}
						date = date.trim();*/
						
						Module = "" + rs.getString("Module");
						if(Module.equalsIgnoreCase("") || Module.equalsIgnoreCase("null") || Module.equalsIgnoreCase(null)){
							Module="";
						}
						Module = Module.trim();
						
						Series = "" + rs.getString("Series");
						if(Series.equalsIgnoreCase("") || Series.equalsIgnoreCase("null") || Series.equalsIgnoreCase(null)){
							Series="";
						}
						Series = Series.trim();
						/*Percentage = "" + rs.getString("Percentage");
						if(Percentage.equalsIgnoreCase("") || Percentage.equalsIgnoreCase("null") || Percentage.equalsIgnoreCase(null)){
							Percentage="";
						}
						Percentage = Percentage.trim();*/
						points = "" + rs.getString("points");
						if(points.equalsIgnoreCase("") || points.equalsIgnoreCase("null") || points.equalsIgnoreCase(null)){
							points="";
						}
						points = points.trim();
						/*status = "" + rs.getString("status");
						if(status.equalsIgnoreCase("") || status.equalsIgnoreCase("null") || status.equalsIgnoreCase(null)){
							status="";
						}
						status = status.trim();
					
						*/
						
						/*obj.put("date", date);*/
						obj.put("Module", Module);
						obj.put("Series", Series);
					/*	obj.put("Percentage", Percentage);*/
						obj.put("points", points);
					/*	obj.put("status", status);*/
						arr.put(obj);
					}
				}
			}
		//	out.println(aesUtil.encrypt(salt, iv, "data",arr.toString()));
			
			out.println(arr);
			//System.out.println(aesUtil.encrypt(salt, iv, "data",arr.toString()));
			out.close();
			con.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

