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
 * Servlet implementation class Fetching_Seven_Series_report_lazyload
 */
@WebServlet("/Fetching_Seven_Series_report_lazyload")
public class Fetching_Seven_Series_report_lazyload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_Seven_Series_report_lazyload() {
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
		System.out.println(">>>>>>>>>>Fetching_Seven_Series_report_lazyload>>>>>>>>>");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		JSONObject obj = null;
		JSONArray arr = new JSONArray();
		ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		String series_name_7_1=resource.getString("series_name_7_1");
		String series_name_7_2=resource.getString("series_name_7_2");		
		String series_name_7_3=resource.getString("series_name_7_3");		
		String series_name_7_4=resource.getString("series_name_7_4");		
		String series_name_7_5=resource.getString("series_name_7_5");		
		String sub_series_list=""+request.getParameter("sub_series_list");
		String series_list=""+request.getParameter("series_list");
		String dp_start=""+request.getParameter("dp_start");
		String dp_end=""+request.getParameter("dp_end");	
		int pagecnt = 50;
		System.out.println("pagecnt>>>>>>>>>>>" + pagecnt);
		int vahan_pageIndex = Integer.parseInt(request.getParameter("vahan_pageIndex"));
		System.out.println("vahan_pageIndex>>>>>>>>>>>" + vahan_pageIndex);
		int outputinfo = 0;		
		int firstrow   =  (vahan_pageIndex - 1) * pagecnt +1;
		int lastrow   = firstrow+pagecnt-1;		
		String cond = "";
		String tablename = "";		

			if(!dp_start.equalsIgnoreCase("null") && !dp_start.equalsIgnoreCase("")){		
				cond=cond+" and CAST(CONVERT(char(10),datetime,126) AS DATE) >= CAST(CONVERT(char(10), '"+dp_start+"',126) AS DATE)";
			}
			if(!dp_end.equalsIgnoreCase("null") && !dp_end.equalsIgnoreCase("")){				
				cond=cond+" and CAST(CONVERT(char(10),datetime,126) AS DATE)<= CAST(CONVERT(char(10), '"+dp_end+"',126) AS DATE)";
			}
			if(!sub_series_list.equalsIgnoreCase("null") && !sub_series_list.equalsIgnoreCase("")&& !sub_series_list.equalsIgnoreCase("select")){		
				
				
				
			} 
if(!series_list.equalsIgnoreCase("null") && !series_list.equalsIgnoreCase("")&& !series_list.equalsIgnoreCase("select")){		
				
			} 
	
System.out.println("tablename"+tablename);
		
	String query ="";
		try {
			con = db.connection_get();
			if (con != null) {
				
				if(sub_series_list.equalsIgnoreCase(series_name_7_1)) 
						{									
					query =  "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (uptime as Float) ) / COUNT(*), 2)) ) " + 
							" avg  from tbl_7_1 where isnull(id,'')!=''  "+cond+")Totuptime ,  (select convert(numeric(10,2),( ROUND(SUM( cast (downtime as Float) ) / COUNT(*), 2)) ) " + 
							" avg  from tbl_7_1 where isnull(id,'')!=''  "+cond+")Totdowntime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER " + 
							" (ORDER BY id Desc) AS rownumber,hostname,ipaddress,location,uptime,downtime,convert(varchar(10),dt,101)dt FROM   tbl_7_1 where isnull(id,'')!='' "+cond+"   	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" "; 
						}
				else if(sub_series_list.equalsIgnoreCase(series_name_7_2)) 
				{									
			query = "SELECT  * 	FROM   ( SELECT      COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber,Name,Place,Time_hrs FROM   tbl_7_2 where isnull(id,'')!=''  	"+cond+") AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" "; 
				}
				
				else if(sub_series_list.equalsIgnoreCase(series_name_7_3)) 
				{									
			query = "SELECT  * 	FROM   ( SELECT      COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber, Name,Place,Compliance FROM   tbl_7_3 where isnull(id,'')!=''  "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" ";
				}
				
				else if(sub_series_list.equalsIgnoreCase(series_name_7_4)) 
				{									
			query = "SELECT  * 	FROM   ( SELECT      COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber, convert(varchar(10),Release_date,101) Release_date,Patch_Name,Patch_oem,convert(varchar(10),App_start_date,101) as App_start_date,convert(varchar(10),App_Close_Date,101) as App_Close_Date,Compliance,convert(varchar(10),datetime,101) as dt FROM   tbl_7_4 where isnull(id,'')!=''  "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" "; 
				}
				
				else if(sub_series_list.equalsIgnoreCase(series_name_7_5)) 
				{									
					query = "SELECT  * 	FROM   ( SELECT      COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER  (ORDER BY id Desc) AS rownumber, convert(varchar(10),Release_date,101) Release_date,Patch_Name,Patch_oem,convert(varchar(10),App_start_date,101) as App_start_date,convert(varchar(10),App_Close_Date,101) as App_Close_Date,Compliance,convert(varchar(10),datetime,101) as dt FROM   tbl_7_5 where isnull(id,'')!=''  "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" "; 
				}
				
				
				ResultSet rs = db.SelectData(query, con);
				
				
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
						if(sub_series_list.equalsIgnoreCase(series_name_7_1)) 
						{									
							String Totuptime = "" + rs.getString("Totuptime");
							if (Totuptime.equalsIgnoreCase("")
									|| Totuptime.equalsIgnoreCase("null")
									|| Totuptime.equalsIgnoreCase(null)) {
								Totuptime = "";
							}
							Totuptime = Totuptime.trim();

							String Totdowntime = "" + rs.getString("Totdowntime");
							if (Totdowntime.equalsIgnoreCase("")
									|| Totdowntime.equalsIgnoreCase("null")
									|| Totdowntime.equalsIgnoreCase(null)) {
								Totdowntime = "";
							}
							Totdowntime = Totdowntime.trim();

							String ipaddress = "" + rs.getString("ipaddress");
							if (ipaddress.equalsIgnoreCase("") || ipaddress.equalsIgnoreCase("null")
									|| ipaddress.equalsIgnoreCase(null)) {
								ipaddress = "";
							}
							ipaddress = ipaddress.trim();

							String location = "" + rs.getString("location");
							if (location.equalsIgnoreCase("") || location.equalsIgnoreCase("null")
									|| location.equalsIgnoreCase(null)) {
								location = "";
							}
							location = location.trim();
							String hostname = "" + rs.getString("hostname");
							if (hostname.equalsIgnoreCase("") || hostname.equalsIgnoreCase("null")
									|| hostname.equalsIgnoreCase(null)) {
								hostname = "";
							}
							hostname = hostname.trim();
							
							String dt = "" + rs.getString("datetime");
							if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null") || dt.equalsIgnoreCase(null)) {
								dt = "";
							}
							dt = dt.trim();

							String uptime = "" + rs.getString("uptime");
							if (uptime.equalsIgnoreCase("") || uptime.equalsIgnoreCase("null")
									|| uptime.equalsIgnoreCase(null)) {
								uptime = "";
							}
							uptime = uptime.trim();
							String downtime = "" + rs.getString("downtime");
							if (downtime.equalsIgnoreCase("") || downtime.equalsIgnoreCase("null")
									|| downtime.equalsIgnoreCase(null)) {
								downtime = "";
							}
							downtime = downtime.trim();

							
							obj.put("hostname", hostname);
							obj.put("Totuptime", Totuptime);
							obj.put("Totdowntime", Totdowntime);
							obj.put("ipaddress", ipaddress);
							obj.put("location", location);
							obj.put("dt", dt);							
							obj.put("uptime", uptime);
							obj.put("downtime", downtime);
							obj.put("dt", dt);
						
						
						}
						
						else if(sub_series_list.equalsIgnoreCase(series_name_7_2)) 
						{									
							String dt = "" + rs.getString("dt");
							if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null")
									|| dt.equalsIgnoreCase(null)) {
								dt = "";
							}
							dt = dt.trim();
						
							String Name = "" + rs.getString("Name");
							if (Name.equalsIgnoreCase("") || Name.equalsIgnoreCase("null")
									|| Name.equalsIgnoreCase(null)) {
								Name = "";
							}
							Name = Name.trim();
						
							String Place = "" + rs.getString("Place");
							if (Place.equalsIgnoreCase("") || Place.equalsIgnoreCase("null")
									|| Place.equalsIgnoreCase(null)) {
								Place = "";
							}
							Place = Place.trim();
						
							String Time_hrs = "" + rs.getString("Time_hrs");
							if (Time_hrs.equalsIgnoreCase("") || Time_hrs.equalsIgnoreCase("null")
									|| Time_hrs.equalsIgnoreCase(null)) {
								Time_hrs = "";
							}
							Time_hrs = Time_hrs.trim();
						

							obj.put("Time_hrs", Time_hrs);
							obj.put("Place", Place);
							obj.put("Name", Name);
							obj.put("dt", dt);
							
							
						}
						

						else if(sub_series_list.equalsIgnoreCase(series_name_7_3)) 
						{									
							String dt = "" + rs.getString("dt");
							if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null")
									|| dt.equalsIgnoreCase(null)) {
								dt = "";
							}
							dt = dt.trim();
						
							String Name = "" + rs.getString("Name");
							if (Name.equalsIgnoreCase("") || Name.equalsIgnoreCase("null")
									|| Name.equalsIgnoreCase(null)) {
								Name = "";
							}
							Name = Name.trim();
						
							String Place = "" + rs.getString("Place");
							if (Place.equalsIgnoreCase("") || Place.equalsIgnoreCase("null")
									|| Place.equalsIgnoreCase(null)) {
								Place = "";
							}
							Place = Place.trim();
						
							String Compliance = "" + rs.getString("Compliance");
							if (Compliance.equalsIgnoreCase("") || Compliance.equalsIgnoreCase("null")
									|| Compliance.equalsIgnoreCase(null)) {
								Compliance = "";
							}
							Compliance = Compliance.trim();
						

							obj.put("Compliance", Compliance);
							obj.put("Place", Place);
							obj.put("Name", Name);
							obj.put("dt", dt);
							
							
						}
						else if(sub_series_list.equalsIgnoreCase(series_name_7_4)) 
						{			
							String Release_date = "" + rs.getString("Release_date");
							if (Release_date.equalsIgnoreCase("") || Release_date.equalsIgnoreCase("null")
									|| Release_date.equalsIgnoreCase(null)) {
								Release_date = "";
							}
							Release_date = Release_date.trim();
						
							String Patch_Name = "" + rs.getString("Patch_Name");
							if (Patch_Name.equalsIgnoreCase("") || Patch_Name.equalsIgnoreCase("null")
									|| Patch_Name.equalsIgnoreCase(null)) {
								Patch_Name = "";
							}
							Patch_Name = Patch_Name.trim();
						

							String Patch_oem = "" + rs.getString("Patch_oem");
							if (Patch_oem.equalsIgnoreCase("") || Patch_oem.equalsIgnoreCase("null")
									|| Patch_oem.equalsIgnoreCase(null)) {
								Patch_oem = "";
							}
							Patch_oem = Patch_oem.trim();
						
							String App_start_date = "" + rs.getString("App_start_date");
							if (App_start_date.equalsIgnoreCase("") || App_start_date.equalsIgnoreCase("null")
									|| App_start_date.equalsIgnoreCase(null)) {
								App_start_date = "";
							}
							App_start_date = App_start_date.trim();
							String App_Close_Date = "" + rs.getString("App_Close_Date");
							if (App_Close_Date.equalsIgnoreCase("") || App_Close_Date.equalsIgnoreCase("null")
									|| App_Close_Date.equalsIgnoreCase(null)) {
								App_Close_Date = "";
							}
							App_Close_Date = App_Close_Date.trim();
							String Compliance = "" + rs.getString("Compliance");
							if (Compliance.equalsIgnoreCase("") || Compliance.equalsIgnoreCase("null")
									|| Compliance.equalsIgnoreCase(null)) {
								Compliance = "";
							}
							Compliance = Compliance.trim();
						
							String dt = "" + rs.getString("dt");
							if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null")
									|| dt.equalsIgnoreCase(null)) {
								dt = "";
							}
							dt = dt.trim();
						

							obj.put("dt", dt);
							obj.put("Compliance", Compliance);
							obj.put("App_Close_Date", App_Close_Date);
							obj.put("App_start_date", App_start_date);
							obj.put("Patch_oem", Patch_oem);
							obj.put("Patch_Name", Patch_Name);							
							obj.put("Release_date", Release_date);
							
						}

						
						else if(sub_series_list.equalsIgnoreCase(series_name_7_5)) 
						{			
							String Release_date = "" + rs.getString("Release_date");
							if (Release_date.equalsIgnoreCase("") || Release_date.equalsIgnoreCase("null")
									|| Release_date.equalsIgnoreCase(null)) {
								Release_date = "";
							}
							Release_date = Release_date.trim();
						
							String Patch_Name = "" + rs.getString("Patch_Name");
							if (Patch_Name.equalsIgnoreCase("") || Patch_Name.equalsIgnoreCase("null")
									|| Patch_Name.equalsIgnoreCase(null)) {
								Patch_Name = "";
							}
							Patch_Name = Patch_Name.trim();
						

							String Patch_oem = "" + rs.getString("Patch_oem");
							if (Patch_oem.equalsIgnoreCase("") || Patch_oem.equalsIgnoreCase("null")
									|| Patch_oem.equalsIgnoreCase(null)) {
								Patch_oem = "";
							}
							Patch_oem = Patch_oem.trim();
						
							String App_start_date = "" + rs.getString("App_start_date");
							if (App_start_date.equalsIgnoreCase("") || App_start_date.equalsIgnoreCase("null")
									|| App_start_date.equalsIgnoreCase(null)) {
								App_start_date = "";
							}
							App_start_date = App_start_date.trim();
							String App_Close_Date = "" + rs.getString("App_Close_Date");
							if (App_Close_Date.equalsIgnoreCase("") || App_Close_Date.equalsIgnoreCase("null")
									|| App_Close_Date.equalsIgnoreCase(null)) {
								App_Close_Date = "";
							}
							App_Close_Date = App_Close_Date.trim();
							String Compliance = "" + rs.getString("Compliance");
							if (Compliance.equalsIgnoreCase("") || Compliance.equalsIgnoreCase("null")
									|| Compliance.equalsIgnoreCase(null)) {
								Compliance = "";
							}
							Compliance = Compliance.trim();
						
							String dt = "" + rs.getString("dt");
							if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null")
									|| dt.equalsIgnoreCase(null)) {
								dt = "";
							}
							dt = dt.trim();
						

							obj.put("dt", dt);
							obj.put("Compliance", Compliance);
							obj.put("App_Close_Date", App_Close_Date);
							obj.put("App_start_date", App_start_date);
							obj.put("Patch_oem", Patch_oem);
							obj.put("Patch_Name", Patch_Name);							
							obj.put("Release_date", Release_date);
							
						}

						
						String rownumber = ""
								+ rs.getString("rownumber");
						//System.out.println(">>>>>rownumber"+rownumber);
						String Rcount = "" + rs.getString("Rcount");
						//System.out.println(">>>>>Rcount"+Rcount);
						obj.put("Rcount", Rcount);
						obj.put("rownumber", rownumber);
						arr.put(obj);
					}
				}else {
					System.out.println("No data");
					//obj = new JSONObject();
					//arr.put(obj);
				}
			}
		//	out.println(aesUtil.encrypt(salt, iv, "data",arr.toString()));
			
			out.println(arr);
			System.out.println(arr);
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
