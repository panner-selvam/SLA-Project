package com.sla.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

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
 * Servlet implementation class Fetching_Series_report
 */
@WebServlet("/Fetching_Series_report")
public class Fetching_Series_report extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_Series_report() {
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
		System.out.println(">>>>>>>>>>Fetching_Series_report>>>>>>>>>");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		JSONObject obj = null;
		JSONArray arr = new JSONArray();
		ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		String series_name_2_2a = resource.getString("series_name_2_2a");
		String series_name_2_2b=resource.getString("series_name_2_2b");
		String series_name_2_3a = resource.getString("series_name_2_3a");
		String series_name_2_3b=resource.getString("series_name_2_3b");
		
		
		String sub_series_list=""+request.getParameter("sub_series_list");
		String series_list=""+request.getParameter("series_list");
		String dp_start=""+request.getParameter("dp_start");
		String dp_end=""+request.getParameter("dp_end");
	
		
		String cond = "";
		String tablename = "";
		

			if(!dp_start.equalsIgnoreCase("null") && !dp_start.equalsIgnoreCase("")){		
				cond=cond+" and CAST(CONVERT(char(10),insertdate,126) AS DATE) >= CAST(CONVERT(char(10), '"+dp_start+"',126) AS DATE)";
			}
			if(!dp_end.equalsIgnoreCase("null") && !dp_end.equalsIgnoreCase("")){				
				cond=cond+" and CAST(CONVERT(char(10),insertdate,126) AS DATE)<= CAST(CONVERT(char(10), '"+dp_end+"',126) AS DATE)";
			}
			if(!sub_series_list.equalsIgnoreCase("null") && !sub_series_list.equalsIgnoreCase("")&& !sub_series_list.equalsIgnoreCase("select")){		
				
				if(sub_series_list.equalsIgnoreCase(series_name_2_2a) || sub_series_list.equalsIgnoreCase(series_name_2_2b)) {
					tablename="ApplicationOpening";
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_3a) || sub_series_list.equalsIgnoreCase(series_name_2_3b)) {
					tablename="userlogin";
				}
				
			} 
if(!series_list.equalsIgnoreCase("null") && !series_list.equalsIgnoreCase("")&& !series_list.equalsIgnoreCase("select")){		
				
			} 
	
System.out.println("tablename"+tablename);
		
		String ipaddress = "", location = "",date="",applicationname="",time="";String query ="";
		try {
			con = db.connection_get();
			if (con != null) {
				
				if(sub_series_list.equalsIgnoreCase(series_name_2_2a)) 
						{
					query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from dbo.ApplicationOpening where location='Command_Center' "+cond+" order by rid desc";
						}
				if(sub_series_list.equalsIgnoreCase(series_name_2_2b)) 
				{
			query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from dbo.ApplicationOpening where location='RVC_ZVC_PS'  "+cond+" order by rid desc";
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_3a)) 
				{
			query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='Command_Center'   "+cond+" order by rid desc ";
				}
				if(sub_series_list.equalsIgnoreCase(series_name_2_3b)) 
				{
			query="select ipaddress,location,convert(varchar(10),date,101)date,applicationname,time from userlogin where location='RVC_ZVC_PS'  "+cond+" order by rid desc ";
				}
				
				System.out.println("query"+query);
				ResultSet rs = db.SelectData(query, con);
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
						
						ipaddress = "" + rs.getString("ipaddress");
						if(ipaddress.equalsIgnoreCase("") || ipaddress.equalsIgnoreCase("null") || ipaddress.equalsIgnoreCase(null)){
							ipaddress="";
						}
						ipaddress = ipaddress.trim();
						
						location = "" + rs.getString("location");
						if(location.equalsIgnoreCase("") || location.equalsIgnoreCase("null") || location.equalsIgnoreCase(null)){
							location="";
						}
						location = location.trim();
						
						date = "" + rs.getString("date");
						if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
							date="";
						}
						date = date.trim();
						applicationname = "" + rs.getString("applicationname");
						if(applicationname.equalsIgnoreCase("") || applicationname.equalsIgnoreCase("null") || applicationname.equalsIgnoreCase(null)){
							applicationname="";
						}
						applicationname = applicationname.trim();
						time = "" + rs.getString("time");
						if(time.equalsIgnoreCase("") || time.equalsIgnoreCase("null") || time.equalsIgnoreCase(null)){
							time="";
						}
						time = time.trim();
						
						
						
						obj.put("time", time);
						obj.put("applicationname", applicationname);
						obj.put("date", date);						
						obj.put("location", location);
						obj.put("ipaddress", ipaddress);
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
