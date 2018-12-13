package com.sla.report;


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
import Database.Database;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class Fetching_drilldown_chart_value
 */
@WebServlet("/Fetching_drilldown_chart_value")
public class Fetching_drilldown_chart_value extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String startdate=null,enddate=null;
		startdate=request.getParameter("startDate");
		enddate =request.getParameter("endDate");
		
		System.out.println("date :"+startdate+"<<<>>>"+enddate);
		
		PrintWriter out = response.getWriter();
		Connection con = null;
		Database db=new Database();
		
		JSONObject object1=new JSONObject();
		JSONObject object2=new JSONObject();
		JSONObject object3=new JSONObject();
		JSONObject object4=new JSONObject();
		JSONObject object5=new JSONObject();
		JSONObject total = new JSONObject();
		
		JSONArray arr = new JSONArray();
		
		JSONArray arr_series1 = new JSONArray();
		JSONArray arr_series2 = new JSONArray();
		JSONArray arr_series3 = new JSONArray();
		JSONArray arr_series4 = new JSONArray();
		JSONArray arr_series5 = new JSONArray();
		
		String module1_no="",module1_name="",module2_no="",module2_name="",module3_no="",module3_name="",module4_no="",module4_name="",module5_no="",module5_name="";
		float series_total_1=0,series_total_2=0,series_total_3=0,series_total_4=0,series_total_5=0,temp=0;
		try {
			con = db.connection_get();
			if(con!=null) { 
				String query =" select Module_No,Module_Name,Series_No,ISNULL(AVG(CAST(points as Float)),0)as average,Series_Order from " + 
						" Bind_SLA_Module_Points where  convert(varchar(10),dateofresponse,101)	between " + 
						" cast('"+startdate+"' as date) and cast('"+enddate+"' as date) group by " + 
						" Module_Name,Module_No,Series_No,Series_Order order by Series_Order";
				
				ResultSet rs = db.SelectData(query, con);
				if(rs!=null) {
					while(rs.next()) {
						if(rs.getString(1).equals("1")) {
							JSONObject obj=new JSONObject();
							module1_no=rs.getString(1);
							module1_name=rs.getString(2);
							obj.put("series_no",rs.getString(3));
							obj.put("series_point", rs.getString(4));
							arr_series1.put(obj);
							temp =Float.parseFloat(rs.getString(4));
							series_total_1 += temp;
						}
						else if(rs.getString(1).equals("2")) {
							JSONObject obj=new JSONObject();
							module2_no=rs.getString(1);
							module2_name=rs.getString(2);
							obj.put("series_no",rs.getString(3));
							obj.put("series_point", rs.getString(4));
							arr_series2.put(obj);
							temp =Float.parseFloat(rs.getString(4));
							series_total_2 += temp;
						}
						else if(rs.getString(1).equals("3")) {
							JSONObject obj=new JSONObject();
							module3_no=rs.getString(1);
							module3_name=rs.getString(2);
							obj.put("series_no",rs.getString(3));
							obj.put("series_point", rs.getString(4));
							arr_series3.put(obj);
							temp =Float.parseFloat(rs.getString(4));
							series_total_3 += temp;
						}
						else if(rs.getString(1).equals("4")) {
							JSONObject obj=new JSONObject();
							module4_no=rs.getString(1);
							module4_name=rs.getString(2);
							obj.put("series_no",rs.getString(3));
							obj.put("series_point", rs.getString(4));
							arr_series4.put(obj);
							temp =Float.parseFloat(rs.getString(4));
							series_total_4 += temp;
						}
						else if(rs.getString(1).equals("5")) {
							JSONObject obj=new JSONObject();
							module5_no=rs.getString(1);
							module5_name=rs.getString(2);
							obj.put("series_no",rs.getString(3));
							obj.put("series_point", rs.getString(4));
							arr_series5.put(obj);
							temp =Float.parseFloat(rs.getString(4));
							series_total_5 += temp;
						}
						
					}
					
					object1.put("module_no",module1_no);
					object1.put("module_name",module1_name);
					object1.put("series_list",arr_series1);
					object1.put("series_total",series_total_1);
					arr.put(object1);
					
					object2.put("module_no",module2_no);
					object2.put("module_name",module2_name);
					object2.put("series_list",arr_series2);
					object2.put("series_total",series_total_2);
					arr.put(object2);
					
					object3.put("module_no",module3_no);
					object3.put("module_name",module3_name);
					object3.put("series_list",arr_series3);
					object3.put("series_total",series_total_3);
					arr.put(object3);
					
					object4.put("module_no",module4_no);
					object4.put("module_name",module4_name);
					object4.put("series_list",arr_series4);
					object4.put("series_total",series_total_4);
					arr.put(object4);
					
					object5.put("module_no",module5_no);
					object5.put("module_name",module5_name);
					object5.put("series_list",arr_series5);
					object5.put("series_total",series_total_5);
					arr.put(object5);
					
				
					
				}
				else {
					System.out.println("No records");
					arr=null;
				}
			}
			else {
				System.out.println("Connection error");
			}	
		}
		catch (SQLException e1) {
			e1.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println(arr);
		out.println(arr);
		out.close();
	}

}
