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
 * Servlet implementation class Fetching_fr_Series_report_lazyload
 */
@WebServlet("/Fetching_fr_Series_report_lazyload")
public class Fetching_fr_Series_report_lazyload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_fr_Series_report_lazyload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
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
		
		
		String series_name_4_3=resource.getString("series_name_4_3");
		
		String series_name_4_2=resource.getString("series_name_4_2");
		
		
		
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
				cond=cond+" and CAST(CONVERT(char(10),insertdate,126) AS DATE) >= CAST(CONVERT(char(10), '"+dp_start+"',126) AS DATE)";
			}
			if(!dp_end.equalsIgnoreCase("null") && !dp_end.equalsIgnoreCase("")){				
				cond=cond+" and CAST(CONVERT(char(10),insertdate,126) AS DATE)<= CAST(CONVERT(char(10), '"+dp_end+"',126) AS DATE)";
			}
			if(!sub_series_list.equalsIgnoreCase("null") && !sub_series_list.equalsIgnoreCase("")&& !sub_series_list.equalsIgnoreCase("select")){		
						
			} 
			if(!series_list.equalsIgnoreCase("null") && !series_list.equalsIgnoreCase("")&& !series_list.equalsIgnoreCase("select")){		
				
			} 
	
System.out.println("tablename"+tablename);
		
		String success = "", roadworthiness = "",date="",vehicleno="",failure="";String query ="",Total_roadworth="";
		try {
			con = db.connection_get();
			if (con != null) {
				
				if(sub_series_list.equalsIgnoreCase(series_name_4_3)) 
						{									
					query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (roadworthiness as Float) ) / COUNT(*), 2)) ) avg  from  AvailabilityMobVans where ISNULL(rid,'')!='' )Total_roadworth ,(select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from  AvailabilityMobVans where ISNULL(rid,'')!=''  "+cond+" )Total_success , (select ( ROUND(SUM( cast (failure as int) ) / COUNT(*), 2)) avg  from AvailabilityMobVans where ISNULL(rid,'')!=''  "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,convert(varchar(10),date,101)date,roadworthiness,success,failure,vehicleno 	FROM  AvailabilityMobVans where ISNULL(rid,'')!=''  "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
						}
				if(sub_series_list.equalsIgnoreCase(series_name_4_2)) 
				{									
			query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (Avg_Online as Float) ) / COUNT(*), 2)) ) avg  from  tbl_4_2_a where ISNULL(id,'')!='' )Total_success , (select ( ROUND(SUM( cast (Avg_Offline as int) ) / COUNT(*), 2)) avg  from tbl_4_2_a where ISNULL(id,'')!=''  "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,convert(varchar(10),dt,101)date,convert(varchar(10),Createddate,101)Createddate,VehicleID,VehicleNo,Vehicle_Type,Avg_Online,Avg_Offline 	FROM  tbl_4_2_a where ISNULL(id,'')!=''  "+cond+"	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
				}
				
				ResultSet rs = db.SelectData(query, con);
				
				
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
						if(sub_series_list.equalsIgnoreCase(series_name_4_3)) 
						{		
						success = "" + rs.getString("success");
						if(success.equalsIgnoreCase("") || success.equalsIgnoreCase("null") || success.equalsIgnoreCase(null)){
							success="";
						}
						success = success.trim();
						failure = "" + rs.getString("failure");
						if(failure.equalsIgnoreCase("") || failure.equalsIgnoreCase("null") || failure.equalsIgnoreCase(null)){
							failure="";
						}
						failure = failure.trim();
						vehicleno = "" + rs.getString("vehicleno");
						if(vehicleno.equalsIgnoreCase("") || vehicleno.equalsIgnoreCase("null") || vehicleno.equalsIgnoreCase(null)){
							vehicleno="";
						}
						vehicleno = vehicleno.trim();
						
						date = "" + rs.getString("date");
						if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
							date="";
						}
						date = date.trim();
						roadworthiness = "" + rs.getString("roadworthiness");
						if(roadworthiness.equalsIgnoreCase("") || roadworthiness.equalsIgnoreCase("null") || roadworthiness.equalsIgnoreCase(null)){
							roadworthiness="";
						}
						roadworthiness = roadworthiness.trim();
						
						 Total_roadworth=""+rs.getString("Total_roadworth");
						String Total_success=""+rs.getString("Total_success");
						String Total_failure=""+rs.getString("Total_failure");
						
						obj.put("Total_roadworth", Total_roadworth);
						
						obj.put("Total_success", Total_success);
						obj.put("Total_failure", Total_failure);						
						obj.put("failure", failure);
						obj.put("roadworthiness", roadworthiness);
						obj.put("date", date);						
						obj.put("vehicleno", vehicleno);
						obj.put("success", success);
						
						}
						if(sub_series_list.equalsIgnoreCase(series_name_4_2)) 
						{	
							String Total_success=""+rs.getString("Total_success");
							String Total_failure=""+rs.getString("Total_failure");
							date = "" + rs.getString("date");
							if(date.equalsIgnoreCase("") || date.equalsIgnoreCase("null") || date.equalsIgnoreCase(null)){
								date="";
							}
							date = date.trim();
							String Createddate = "" + rs.getString("Createddate");
							if(Createddate.equalsIgnoreCase("") || Createddate.equalsIgnoreCase("null") || Createddate.equalsIgnoreCase(null)){
								Createddate="";
							}
							Createddate = Createddate.trim();
							
							
							String VehicleID = "" + rs.getString("VehicleID");
							if(VehicleID.equalsIgnoreCase("") || VehicleID.equalsIgnoreCase("null") || VehicleID.equalsIgnoreCase(null)){
								VehicleID="";
							}
							VehicleID = VehicleID.trim();
							String VehicleNo = "" + rs.getString("VehicleNo");
							if(VehicleNo.equalsIgnoreCase("") || VehicleNo.equalsIgnoreCase("null") || VehicleNo.equalsIgnoreCase(null)){
								VehicleNo="";
							}
							VehicleNo = VehicleNo.trim();
							String Vehicle_Type = "" + rs.getString("Vehicle_Type");
							if(Vehicle_Type.equalsIgnoreCase("") || Vehicle_Type.equalsIgnoreCase("null") || Vehicle_Type.equalsIgnoreCase(null)){
								Vehicle_Type="";
							}
							Vehicle_Type = Vehicle_Type.trim();
							String Avg_Online = "" + rs.getString("Avg_Online");
							if(Avg_Online.equalsIgnoreCase("") || Avg_Online.equalsIgnoreCase("null") || Avg_Online.equalsIgnoreCase(null)){
								Avg_Online="";
							}
							Avg_Online = Avg_Online.trim();
							String Avg_Offline = "" + rs.getString("Avg_Offline");
							if(Avg_Offline.equalsIgnoreCase("") || Avg_Offline.equalsIgnoreCase("null") || Avg_Offline.equalsIgnoreCase(null)){
								Avg_Offline="";
							}
							Avg_Offline = Avg_Offline.trim();
							
							obj.put("Createddate", Createddate);
							obj.put("Avg_Offline", Avg_Offline);
							obj.put("Avg_Online", Avg_Online);		
							obj.put("Vehicle_Type", Vehicle_Type);		
							obj.put("VehicleNo", VehicleNo);		
							obj.put("VehicleID", VehicleID);			
							obj.put("date", date);			
							obj.put("Total_success", Total_success);
							obj.put("Total_failure", Total_failure);			
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
