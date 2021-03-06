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
 * Servlet implementation class Fetching_fv_Series_report_lazyload
 */
@WebServlet("/Fetching_fv_Series_report_lazyload")
public class Fetching_fv_Series_report_lazyload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_fv_Series_report_lazyload() {
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
		System.out.println(">>>>>>>>>>Fetching_fr_Series_report_lazyload>>>>>>>>>");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		JSONObject obj = null;
		JSONArray arr = new JSONArray();
		ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		
		
		String series_name_5_1=resource.getString("series_name_5_1");
		String series_name_5_2=resource.getString("series_name_5_2");
		String series_name_5_3=resource.getString("series_name_5_3");
		String series_name_5_4=resource.getString("series_name_5_4");
		String series_name_5_5=resource.getString("series_name_5_5");
		
		
		
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
				cond=cond+" and CAST(CONVERT(char(10),date,126) AS DATE) >= CAST(CONVERT(char(10), '"+dp_start+"',126) AS DATE)";
			}
			if(!dp_end.equalsIgnoreCase("null") && !dp_end.equalsIgnoreCase("")){				
				cond=cond+" and CAST(CONVERT(char(10),date,126) AS DATE)<= CAST(CONVERT(char(10), '"+dp_end+"',126) AS DATE)";
			}
			if(!sub_series_list.equalsIgnoreCase("null") && !sub_series_list.equalsIgnoreCase("")&& !sub_series_list.equalsIgnoreCase("select")){		
				
				
				
			} 
if(!series_list.equalsIgnoreCase("null") && !series_list.equalsIgnoreCase("")&& !series_list.equalsIgnoreCase("select")){		
				
			} 
	
System.out.println("tablename"+tablename);
		
String date="",IP="",Location="",UPTime="",DownTime=""; 
		String query ="";
		try {
			con = db.connection_get();
			if (con != null) {
				
				if(sub_series_list.equalsIgnoreCase(series_name_5_5)) 
						{									
					query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (UPTime as Float) ) / COUNT(*), 2)) ) avg  from  TVScreen where  IP='All IPs' "+cond+" )Total_uptime ,(select convert(numeric(10,2),( ROUND(SUM( cast (DownTime as Float) ) / COUNT(*), 2)) ) avg  from  TVScreen where  IP='All IPs' "+cond+" )Total_downtime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,date,IP,Location,UPTime,DownTime	FROM  TVScreen where  IP='All IPs'  "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
						}
				else	if(sub_series_list.equalsIgnoreCase(series_name_5_4)) 
				{									
			query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (UPTime as Float) ) / COUNT(*), 2)) ) avg  from  tbl_5_4 where isnull(id,'')!='' "+cond+" )Total_uptime ,(select convert(numeric(10,2),( ROUND(SUM( cast (DownTime as Float) ) / COUNT(*), 2)) ) avg  from  tbl_5_4 where  isnull(id,'')!='' "+cond+" )Total_downtime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,Ipaddress,Hostname,Region,Zone,Policestation,Uptime,Downtime	FROM  tbl_5_4 where isnull(id,'')!=''  "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
				}
				else if(sub_series_list.equalsIgnoreCase(series_name_5_3)) 
				{									
			//query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (UPTime as Float) ) / COUNT(*), 2)) ) avg  from  tbl_5_3 where  isnull(id,'')!='' "+cond+")Total_uptime ,(select convert(numeric(10,2),( ROUND(SUM( cast (DownTime as Float) ) / COUNT(*), 2)) ) avg  from  tbl_5_3 where  isnull(id,'')!='' "+cond+" )Total_downtime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,date,IP,Location,UPTime,DownTime	FROM  tbl_5_3 where  isnull(id,'')!=''  "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+"";
					query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (UPTime as Float) ) / COUNT(*), 2)) ) avg  from  tbl_5_4 where isnull(id,'')!='' "+cond+" )Total_uptime ,(select convert(numeric(10,2),( ROUND(SUM( cast (DownTime as Float) ) / COUNT(*), 2)) ) avg  from  tbl_5_4 where  isnull(id,'')!='' "+cond+" )Total_downtime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,Ipaddress,Hostname,Region,Zone,Policestation,Uptime,Downtime	FROM  tbl_5_3 where isnull(id,'')!=''  "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+"";
				}
				else if(sub_series_list.equalsIgnoreCase(series_name_5_2)) 
				{									
					query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (UPTime as Float) ) / COUNT(*), 2)) ) avg  from  tbl_5_2 where  isnull(id,'')!='' "+cond+")Total_uptime ,(select convert(numeric(10,2),( ROUND(SUM( cast (DownTime as Float) ) / COUNT(*), 2)) ) avg  from  tbl_5_2 where  isnull(id,'')!='' "+cond+" )Total_downtime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,date,IP,Location,UPTime,DownTime	FROM  tbl_5_2 where  isnull(id,'')!=''  "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+"";
				}
				else		if(sub_series_list.equalsIgnoreCase(series_name_5_1)) 
				{									
			query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (UPTime as Float) ) / COUNT(*), 2)) ) avg  from  tbl_5_1 where  isnull(id,'')!='' "+cond+")Total_uptime ,(select convert(numeric(10,2),( ROUND(SUM( cast (DownTime as Float) ) / COUNT(*), 2)) ) avg  from  tbl_5_1 where   isnull(id,'')!='' "+cond+" )Total_downtime ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,date,IP,Location,UPTime,DownTime	FROM  tbl_5_1 where   isnull(id,'')!='' "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
				}else {
					
				}
				
				ResultSet rs = db.SelectData(query, con);
				
				
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
						if(sub_series_list.equalsIgnoreCase(series_name_5_5)) 
						{						
						date = "" + rs.getString("date");
						if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
							date="";
						}
						date = date.trim();
						IP = "" + rs.getString("IP");
						if(IP.equalsIgnoreCase("") || IP.equalsIgnoreCase("null") || IP.equalsIgnoreCase(null)){
							IP="";
						}
						IP = IP.trim();
						Location = "" + rs.getString("Location");
						if(Location.equalsIgnoreCase("") || Location.equalsIgnoreCase("null") || Location.equalsIgnoreCase(null)){
							Location="";
						}
						Location = Location.trim();
						
						UPTime = "" + rs.getString("UPTime");
						if(UPTime.equalsIgnoreCase("") || UPTime.equalsIgnoreCase("null") || UPTime.equalsIgnoreCase(null)){
							UPTime="";
						}
						UPTime = UPTime.trim();
						DownTime = "" + rs.getString("DownTime");
						if(DownTime.equalsIgnoreCase("") || DownTime.equalsIgnoreCase("null") || DownTime.equalsIgnoreCase(null)){
							DownTime="";
						}
						DownTime = DownTime.trim();
						
						String Total_downtime=""+rs.getString("Total_downtime");
						String Total_uptime=""+rs.getString("Total_uptime");
						
						
						
						obj.put("Total_uptime", Total_uptime);
						obj.put("Total_downtime", Total_downtime);						
						obj.put("date", date);
						obj.put("IP", IP);
						obj.put("Location", Location);						
						obj.put("UPTime", UPTime);
						obj.put("DownTime", DownTime);
											
						}
						
						
						else 	if(sub_series_list.equalsIgnoreCase(series_name_5_4)) 
						{
							date = "" + rs.getString("date");
							if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
								date="";
							}
							date = date.trim();
							
							
							
							String Region = "" + rs.getString("Region");
							if(Region.equalsIgnoreCase("") || Region.equalsIgnoreCase("null") || Region.equalsIgnoreCase(null)){
								Region="";
							}
							Region = Region.trim();
							String Zone = "" + rs.getString("Zone");
							if(Zone.equalsIgnoreCase("") || Zone.equalsIgnoreCase("null") || Zone.equalsIgnoreCase(null)){
								Zone="";
							}
							Zone = Zone.trim();
							String Policestation = "" + rs.getString("Policestation");
							if(Policestation.equalsIgnoreCase("") || Policestation.equalsIgnoreCase("null") || Policestation.equalsIgnoreCase(null)){
								Policestation="";
							}
							Policestation = Policestation.trim();
							
							
							String Ipaddress = "" + rs.getString("Ipaddress");
							if(Ipaddress.equalsIgnoreCase("") || Ipaddress.equalsIgnoreCase("null") || Ipaddress.equalsIgnoreCase(null)){
								Ipaddress="";
							}
							Ipaddress = Ipaddress.trim();
						String 	Hostname = "" + rs.getString("Hostname");
							if(Hostname.equalsIgnoreCase("") || Hostname.equalsIgnoreCase("null") || Hostname.equalsIgnoreCase(null)){
								Hostname="";
							}
							Hostname = Hostname.trim();
							
							UPTime = "" + rs.getString("UPTime");
							if(UPTime.equalsIgnoreCase("") || UPTime.equalsIgnoreCase("null") || UPTime.equalsIgnoreCase(null)){
								UPTime="";
							}
							UPTime = UPTime.trim();
							DownTime = "" + rs.getString("DownTime");
							if(DownTime.equalsIgnoreCase("") || DownTime.equalsIgnoreCase("null") || DownTime.equalsIgnoreCase(null)){
								DownTime="";
							}
							DownTime = DownTime.trim();
							
							String Total_downtime=""+rs.getString("Total_downtime");
							String Total_uptime=""+rs.getString("Total_uptime");
							
							
							
							obj.put("Total_uptime", Total_uptime);
							obj.put("Total_downtime", Total_downtime);						
							obj.put("date", date);
							obj.put("Ipaddress", Ipaddress);
							obj.put("Region", Region);
							obj.put("Zone", Zone);
							obj.put("Policestation", Policestation);							
							obj.put("Hostname", Hostname);						
							obj.put("UPTime", UPTime);
							obj.put("DownTime", DownTime);
						}
						
						else 	if(sub_series_list.equalsIgnoreCase(series_name_5_3)) 
						{
							date = "" + rs.getString("date");
							if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
								date="";
							}
							date = date.trim();
							
							
							
							String Region = "" + rs.getString("Region");
							if(Region.equalsIgnoreCase("") || Region.equalsIgnoreCase("null") || Region.equalsIgnoreCase(null)){
								Region="";
							}
							Region = Region.trim();
							String Zone = "" + rs.getString("Zone");
							if(Zone.equalsIgnoreCase("") || Zone.equalsIgnoreCase("null") || Zone.equalsIgnoreCase(null)){
								Zone="";
							}
							Zone = Zone.trim();
							String Policestation = "" + rs.getString("Policestation");
							if(Policestation.equalsIgnoreCase("") || Policestation.equalsIgnoreCase("null") || Policestation.equalsIgnoreCase(null)){
								Policestation="";
							}
							Policestation = Policestation.trim();
							
							
							String Ipaddress = "" + rs.getString("Ipaddress");
							if(Ipaddress.equalsIgnoreCase("") || Ipaddress.equalsIgnoreCase("null") || Ipaddress.equalsIgnoreCase(null)){
								Ipaddress="";
							}
							Ipaddress = Ipaddress.trim();
						String 	Hostname = "" + rs.getString("Hostname");
							if(Hostname.equalsIgnoreCase("") || Hostname.equalsIgnoreCase("null") || Hostname.equalsIgnoreCase(null)){
								Hostname="";
							}
							Hostname = Hostname.trim();
							
							UPTime = "" + rs.getString("UPTime");
							if(UPTime.equalsIgnoreCase("") || UPTime.equalsIgnoreCase("null") || UPTime.equalsIgnoreCase(null)){
								UPTime="";
							}
							UPTime = UPTime.trim();
							DownTime = "" + rs.getString("DownTime");
							if(DownTime.equalsIgnoreCase("") || DownTime.equalsIgnoreCase("null") || DownTime.equalsIgnoreCase(null)){
								DownTime="";
							}
							DownTime = DownTime.trim();
							
							String Total_downtime=""+rs.getString("Total_downtime");
							String Total_uptime=""+rs.getString("Total_uptime");
							
							
							
							obj.put("Total_uptime", Total_uptime);
							obj.put("Total_downtime", Total_downtime);						
							obj.put("date", date);
							obj.put("Ipaddress", Ipaddress);
							obj.put("Region", Region);
							obj.put("Zone", Zone);
							obj.put("Policestation", Policestation);							
							obj.put("Hostname", Hostname);						
							obj.put("UPTime", UPTime);
							obj.put("DownTime", DownTime);
						}
						
						else 	if(sub_series_list.equalsIgnoreCase(series_name_5_2)) 
						{
							date = "" + rs.getString("date");
							if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
								date="";
							}
							date = date.trim();
							
							
							
							String Video_wall_ip = "" + rs.getString("Video_wall_ip");
							if(Video_wall_ip.equalsIgnoreCase("") || Video_wall_ip.equalsIgnoreCase("null") || Video_wall_ip.equalsIgnoreCase(null)){
								Video_wall_ip="";
							}
							Video_wall_ip = Video_wall_ip.trim();
							String Equipment_type = "" + rs.getString("Equipment_type");
							if(Equipment_type.equalsIgnoreCase("") ||Equipment_type.equalsIgnoreCase("null") || Equipment_type.equalsIgnoreCase(null)){
								Equipment_type="";
							}
							Equipment_type = Equipment_type.trim();
							 Location = "" + rs.getString("Location");
							if(Location.equalsIgnoreCase("") || Location.equalsIgnoreCase("null") || Location.equalsIgnoreCase(null)){
								Location="";
							}
							Location = Location.trim();
							
							UPTime = "" + rs.getString("UPTime");
							if(UPTime.equalsIgnoreCase("") || UPTime.equalsIgnoreCase("null") || UPTime.equalsIgnoreCase(null)){
								UPTime="";
							}
							UPTime = UPTime.trim();
							DownTime = "" + rs.getString("DownTime");
							if(DownTime.equalsIgnoreCase("") || DownTime.equalsIgnoreCase("null") || DownTime.equalsIgnoreCase(null)){
								DownTime="";
							}
							DownTime = DownTime.trim();
							
							String Total_downtime=""+rs.getString("Total_downtime");
							String Total_uptime=""+rs.getString("Total_uptime");
							
							
							
							obj.put("Total_uptime", Total_uptime);
							obj.put("Total_downtime", Total_downtime);						
							obj.put("date", date);
							obj.put("Location", Location);
							obj.put("Equipment_type", Equipment_type);
							obj.put("Video_wall_ip", Video_wall_ip);										
							obj.put("UPTime", UPTime);
							obj.put("DownTime", DownTime);
						}
						
						
						else 	if(sub_series_list.equalsIgnoreCase(series_name_5_1)) 
						{
							date = "" + rs.getString("date");
							if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
								date="";
							}
							date = date.trim();
							
						
							
							String IPaddress = "" + rs.getString("IPaddress");
							if(IPaddress.equalsIgnoreCase("") || IPaddress.equalsIgnoreCase("null") || IPaddress.equalsIgnoreCase(null)){
								IPaddress="";
							}
							IPaddress = IPaddress.trim();
							String Hostname = "" + rs.getString("Hostname");
							if(Hostname.equalsIgnoreCase("") ||Hostname.equalsIgnoreCase("null") || Hostname.equalsIgnoreCase(null)){
								Hostname="";
							}
							Hostname = Hostname.trim();
							 Location = "" + rs.getString("Location");
							if(Location.equalsIgnoreCase("") || Location.equalsIgnoreCase("null") || Location.equalsIgnoreCase(null)){
								Location="";
							}
							Location = Location.trim();
							
							UPTime = "" + rs.getString("UPTime");
							if(UPTime.equalsIgnoreCase("") || UPTime.equalsIgnoreCase("null") || UPTime.equalsIgnoreCase(null)){
								UPTime="";
							}
							UPTime = UPTime.trim();
							DownTime = "" + rs.getString("DownTime");
							if(DownTime.equalsIgnoreCase("") || DownTime.equalsIgnoreCase("null") || DownTime.equalsIgnoreCase(null)){
								DownTime="";
							}
							DownTime = DownTime.trim();
							
							String Total_downtime=""+rs.getString("Total_downtime");
							String Total_uptime=""+rs.getString("Total_uptime");
							
							
							
							obj.put("Total_uptime", Total_uptime);
							obj.put("Total_downtime", Total_downtime);						
							obj.put("date", date);
							obj.put("Location", Location);
							obj.put("IPaddress", IPaddress);
							obj.put("Hostname", Hostname);										
							obj.put("UPTime", UPTime);
							obj.put("DownTime", DownTime);
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
