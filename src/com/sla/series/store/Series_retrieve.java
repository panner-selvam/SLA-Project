package com.sla.series.store;

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
 * Servlet implementation class Series_retrieve
 */
@WebServlet("/Series_retrieve")
public class Series_retrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Series_retrieve() {
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
		doGet(request, response);
		
		PrintWriter out =response.getWriter();
		Database db=new Database();
		Connection con=null;
		ResultSet rs;
		JSONArray arr= new JSONArray();
		
		String query="",startDate="",endDate="",table_name="",mode="";
		startDate = request.getParameter("startDate");
		endDate = request.getParameter("endDate");
		table_name = request.getParameter("table_name");
		System.out.println("Date "+startDate+" to "+endDate+" For "+table_name);
		
		
		int pagecnt = 12;
		System.out.println("pagecnt>>>>>>>>>>>" + pagecnt);
		int vahan_pageIndex = Integer.parseInt(request.getParameter("vahan_pageIndex"));
		System.out.println("vahan_pageIndex>>>>>>>>>>>" + vahan_pageIndex);
		int outputinfo = 0;
		
		
		
		int firstrow   =  (vahan_pageIndex - 1) * pagecnt +1;
		int lastrow   = firstrow+pagecnt-1;
		
		if(table_name.equals("tbl_2_1_a")) {
			//query = "SELECT CONVERT(varchar(10),insertdate,3)as date,CONVERT(varchar(10),curdate,3)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),insertdate,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)";
			query ="SELECT  * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,   CONVERT(varchar(10),insertdate,1)as date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),insertdate,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date) 	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_2_1_b")) {
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),insertdate,1)as date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),insertdate,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_4_2")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Createddate,1)as Createdate,CONVERT(varchar(10),curdate,1)as inserted_date,CONVERT(varchar(10),DT,3)as series_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),DT,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_5_1")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),date,1)as series_date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_5_2")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),date,1)as series_date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_5_3")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),date,1)as series_date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_5_4")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),date,1)as series_date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_6_1")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),date,1)as series_date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_6_2")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),date,1)as series_date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_6_3")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),date,1)as series_date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),Date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_6_5")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Date,1)as series_date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),Date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_7_1")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),datetime,1)as Date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),datetime,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_7_2")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Datetime,1)as Date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),Datetime,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_7_3")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),datetime,1)as Date,CONVERT(varchar(10),curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),Datetime,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_7_4")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),datetime,1)as Date,CONVERT(varchar(10),curdate,1)as inserted_date,CONVERT(varchar(10),App_start_date,1)as s_date,CONVERT(varchar(10),App_Close_Date,1)as c_date,CONVERT(varchar(10),Release_date,1)as r_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),datetime,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_7_5")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),datetime,1)as Date,CONVERT(varchar(10),curdate,1)as inserted_date,CONVERT(varchar(10),App_start_date,1)as s_date,CONVERT(varchar(10),App_Close_Date,1)as c_date,CONVERT(varchar(10),Release_date,1)as r_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),datetime,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_3_1_to_3_4")) {
			mode = request.getParameter("mode");
			if(mode.equals("tbl_3_1")) {
				query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Date,1)as series_date,CONVERT(varchar(10),Curdate,1)as inserted_date,* FROM "+table_name+" WHERE Mode='tbl_3_1' AND CONVERT(varchar(10),Date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
			}else if(mode.equals("tbl_3_2")) { 
				query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Date,1)as series_date,CONVERT(varchar(10),Curdate,1)as inserted_date,* FROM "+table_name+" WHERE Mode='tbl_3_2' and CONVERT(varchar(10),Date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
			}else if(mode.equals("tbl_3_3")) { 
				query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Date,1)as series_date,CONVERT(varchar(10),Curdate,1)as inserted_date,* FROM "+table_name+" WHERE Mode='tbl_3_3' and CONVERT(varchar(10),Date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
			}else if(mode.equals("tbl_3_4")) { 
				query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Date,1)as series_date,CONVERT(varchar(10),Curdate,1)as inserted_date,* FROM "+table_name+" WHERE Mode='tbl_3_4' and CONVERT(varchar(10),Date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
			}
		}else if(table_name.equals("tbl_6_4")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Date,1)as series_date,CONVERT(varchar(10),Curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),Date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_8_1")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),DT,1)as Date,CONVERT(varchar(10),Curdate,1)as inserted_date,convert(TIME(0),calling_time)call_time,convert(TIME(0),answer_time)ans_time,* FROM "+table_name+" WHERE CONVERT(varchar(10),DT,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_8_2")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),DT,1)as Date,CONVERT(varchar(10),Curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),DT,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_5_5")) { 
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Date,1)as serires_date,CONVERT(varchar(10),Curdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),Date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_2_2_a_to_2_9")) {
			mode = request.getParameter("mode");
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Date,1)as series_date,CONVERT(varchar(10),CurrentDate,1)as inserted_date,* FROM "+table_name+" WHERE Mode='"+mode+"' AND CONVERT(varchar(10),Date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		else if(table_name.equals("tbl_4_3")) {			
			query = "SELECT * 	FROM   ( SELECT   COUNT(*) OVER() as Rcount, ROW_NUMBER()  OVER (ORDER BY id Desc) AS rownumber,  CONVERT(varchar(10),Date,1)as s_Date,CONVERT(varchar(10),Currentdate,1)as inserted_date,* FROM "+table_name+" WHERE CONVERT(varchar(10),Date,101) BETWEEN CAST('"+startDate+"' AS date) AND CAST('"+endDate+"' AS date)	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
		}
		try { 
			con = db.connection_get();
			if(con!=null) {
				rs = db.SelectData(query, con);
				if(rs != null) {
					while(rs.next()) {
						JSONObject obj=new JSONObject();
						
						if(table_name.equals("tbl_2_1_a")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}
							
							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("date"));
							obj.put("hostName", rs.getString("Hostname"));
							obj.put("ipAddress", rs.getString("IPaddress"));
							obj.put("dataCenter", rs.getString("Data_Center"));
							obj.put("applicationName", rs.getString("Application_name"));
							obj.put("displayName", rs.getString("Display_name"));
							obj.put("prcessName", rs.getString("Process_name"));
							obj.put("prcessAvailability", rs.getString("Process_Availability"));
							obj.put("overallAvailability", rs.getString("Overall_Availability"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_2_1_b")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}	
							
						
							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("date"));
							obj.put("hostName", rs.getString("Hostname"));
							obj.put("ipAddress", rs.getString("IPaddress"));
							obj.put("dataCenter", rs.getString("Data_Center"));
							obj.put("applicationName", rs.getString("Application_name"));
							obj.put("prcessName", rs.getString("Process_name"));
							obj.put("prcessAvailability", rs.getString("Process_Availability"));
							obj.put("overallAvailability", rs.getString("Overall_Availability"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_4_2")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}	

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("createdate", rs.getString("Createdate"));
							obj.put("vehicleid", rs.getString("VehicleID"));
							obj.put("vehicleno", rs.getString("VehicleNo"));
							obj.put("vehicletype", rs.getString("Vehicle_Type"));
							obj.put("avg_online", rs.getString("Avg_Online"));
							obj.put("avg_offline", rs.getString("Avg_Offline"));
							obj.put("series_dt_date", rs.getString("series_date"));
							obj.put("inserted_date", rs.getString("inserted_date"));
													
						}else if(table_name.equals("tbl_5_1")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("ip_address", rs.getString("IPaddress"));
							obj.put("host_name", rs.getString("Hostname"));
							obj.put("location", rs.getString("Location"));
							obj.put("up_time", rs.getString("Uptime"));
							obj.put("down_time", rs.getString("Downtime"));
							obj.put("inserted_date", rs.getString("inserted_date"));

						}else if(table_name.equals("tbl_5_2")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("video_wall_ip", rs.getString("Video_wall_ip"));
							obj.put("equipment_type", rs.getString("Equipment_type"));
							obj.put("location", rs.getString("Location"));
							obj.put("up_time", rs.getString("Uptime"));
							obj.put("down_time", rs.getString("Downtime"));
							obj.put("inserted_date", rs.getString("inserted_date"));
						}
						else if(table_name.equals("tbl_5_3")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}	

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("ip_address", rs.getString("IP_address"));
							obj.put("host_name", rs.getString("Hostname"));
							obj.put("region", rs.getString("Region"));
							obj.put("zone", rs.getString("Zone"));
							obj.put("police_station", rs.getString("Police_station"));
							obj.put("up_time", rs.getString("Uptime"));
							obj.put("down_time", rs.getString("Downtime"));
							obj.put("inserted_date", rs.getString("inserted_date"));

						}else if(table_name.equals("tbl_5_4")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("ip_address", rs.getString("IP_address"));
							obj.put("host_name", rs.getString("Hostname"));
							obj.put("region", rs.getString("Region"));
							obj.put("zone", rs.getString("Zone"));
							obj.put("location_name", rs.getString("Location"));
							obj.put("up_time", rs.getString("Uptime"));
							obj.put("down_time", rs.getString("Downtime"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_6_1")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("ip_address", rs.getString("Ipaddress"));
							obj.put("name", rs.getString("name"));
							obj.put("data_center", rs.getString("datacenter"));
							obj.put("application_name", rs.getString("applicationname"));
							obj.put("up_time", rs.getString("Uptime"));
							obj.put("down_time", rs.getString("Downtime"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_6_2")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("ip_address", rs.getString("Ipaddress"));
							obj.put("hostname", rs.getString("Hostname"));
							obj.put("data_center", rs.getString("datacenter"));
							obj.put("up_time", rs.getString("Uptime"));
							obj.put("down_time", rs.getString("Downtime"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_6_3")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("name", rs.getString("Name"));
							obj.put("place", rs.getString("Place"));
							obj.put("online", rs.getString("Online"));
							obj.put("offline", rs.getString("Offline"));
							obj.put("uptime", rs.getString("Uptime"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_6_5")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("hostname", rs.getString("Hostname"));
							obj.put("ip_address", rs.getString("IPaddress"));
							obj.put("location_name", rs.getString("Location"));
							obj.put("uptime", rs.getString("Uptime"));
							obj.put("downtime", rs.getString("Downtime"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_7_1")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("Date"));
							obj.put("hostname", rs.getString("Hostname"));
							obj.put("ip_address", rs.getString("IPaddress"));
							obj.put("location_name", rs.getString("Location"));
							obj.put("uptime", rs.getString("Uptime"));
							obj.put("downtime", rs.getString("Downtime"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_7_2")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("Date"));
							obj.put("name", rs.getString("name"));
							obj.put("place", rs.getString("Place"));
							obj.put("Time_hours", rs.getString("Time_hrs"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_7_3")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("Date"));
							obj.put("name", rs.getString("name"));
							obj.put("place", rs.getString("Place"));
							obj.put("compliance", rs.getString("Compliance"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_7_4")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("Date"));
							obj.put("patch_name", rs.getString("Patch_Name"));
							obj.put("patch_oem", rs.getString("Patch_oem"));
							obj.put("app_start_date", rs.getString("s_date"));
							obj.put("app_close_date", rs.getString("c_date"));
							obj.put("compliance", rs.getString("Compliance"));
							obj.put("release_date", rs.getString("r_date"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_7_5")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("Date"));
							obj.put("patch_name", rs.getString("Patch_Name"));
							obj.put("patch_oem", rs.getString("Patch_oem"));
							obj.put("app_start_date", rs.getString("s_date"));
							obj.put("app_close_date", rs.getString("c_date"));
							obj.put("compliance", rs.getString("Compliance"));
							obj.put("release_date", rs.getString("r_date"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_3_1_to_3_4")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("location_name", rs.getString("Location"));
							obj.put("application_name", rs.getString("Application_name"));
							obj.put("success", rs.getString("Success"));
							obj.put("failure", rs.getString("Failure"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_6_4")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("location_name", rs.getString("Location"));
							obj.put("security_name", rs.getString("Security_name"));
							obj.put("attendance", rs.getString("Attendance"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_8_1")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("Date"));
							obj.put("calling_parties_number", rs.getString("calling_parties_number"));
							obj.put("destination_parties_number", rs.getString("destination_parties_number"));
							obj.put("calling_time", rs.getString("call_time"));
							obj.put("answer_time", rs.getString("ans_time"));
							obj.put("call_ring_time", rs.getString("call_ring_time"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_8_2")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("Date"));
							obj.put("total_call", rs.getString("Total_call"));
							obj.put("lost_call", rs.getString("Lost_call"));
							obj.put("lost_percentage", rs.getString("Lost_percentage"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_5_5")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("serires_date"));
							obj.put("ip", rs.getString("IP"));
							obj.put("location_name", rs.getString("Location"));
							obj.put("uptime", rs.getString("Uptime"));
							obj.put("downtime", rs.getString("Downtime"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_2_2_a_to_2_9")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("series_date"));
							obj.put("ip_address", rs.getString("IPAddress"));
							obj.put("application_name", rs.getString("ApplicationName"));
							obj.put("location_name", rs.getString("Location"));
							obj.put("time", rs.getString("Time"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}else if(table_name.equals("tbl_4_3")) {
							String	Rcount = "" + rs.getString("Rcount");
							if(Rcount.equalsIgnoreCase("") || Rcount.equalsIgnoreCase("null") || Rcount.equalsIgnoreCase(null)){
								Rcount="";
							}
							String	rownumber = "" + rs.getString("rownumber");
							if(rownumber.equalsIgnoreCase("") || rownumber.equalsIgnoreCase("null") || rownumber.equalsIgnoreCase(null)){
								rownumber="";
							}

							obj.put("Rcount", Rcount);
							obj.put("rownumber", rownumber);
							obj.put("date", rs.getString("s_Date"));
							obj.put("vehicle_no", rs.getString("VehicleNo"));
							obj.put("road_worthiness", rs.getString("RoadWorthiness"));
							obj.put("success", rs.getString("Success"));
							obj.put("failure", rs.getString("Failure"));
							obj.put("inserted_date", rs.getString("inserted_date"));
							
						}
						
						arr.put(obj);
					}
				}else {
					System.out.println("Records not found");
					
				}
			}
			System.out.println(arr);out.print(arr);
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		
		
	}

}
