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
 * Servlet implementation class Fetching_egt_Series_report_lazyload
 */
@WebServlet("/Fetching_egt_Series_report_lazyload")
public class Fetching_egt_Series_report_lazyload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_egt_Series_report_lazyload() {
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
		System.out.println(">>>>>>>>>>Fetching_egt_Series_report_lazyload>>>>>>>>>");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		JSONObject obj = null;
		JSONArray arr = new JSONArray();
		ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		String series_name_8_1=resource.getString("series_name_8_1");
		String series_name_8_2=resource.getString("series_name_8_2");		
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
				cond=cond+" and CAST(CONVERT(char(10),dt,126) AS DATE) >= CAST(CONVERT(char(10), '"+dp_start+"',126) AS DATE)";
			}
			if(!dp_end.equalsIgnoreCase("null") && !dp_end.equalsIgnoreCase("")){				
				cond=cond+" and CAST(CONVERT(char(10),dt,126) AS DATE)<= CAST(CONVERT(char(10), '"+dp_end+"',126) AS DATE)";
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
				
				if(sub_series_list.equalsIgnoreCase(series_name_8_1)) 
						{									
					query =  "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (call_ring_time as Float) ) / COUNT(*), 2)) ) avg  from [Avg_Speed_Ans] where isnull(id,'')!=''  "+cond+" )Total_Average ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,RIGHT(Convert(VARCHAR(20), calling_time, 0) ,9)calling_time,RIGHT(Convert(VARCHAR(20), Ans_time, 0) ,9) Ans_time,calling_parties_number,destination_party_number,convert(varchar(10),dt,101) dt,call_ring_time 	FROM   [Avg_Speed_Ans] where isnull(id,'')!='' "+cond+" 	) AS tbl 	WHERE  tbl.rownumber BETWEEN  "+firstrow+" AND "+lastrow+" "; 
						}
				else if(sub_series_list.equalsIgnoreCase(series_name_8_2)) 
				{									
			query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (total_call as Float) ) / COUNT(*), 2)) ) avg  from dbo.Avg_call_lost where ISNULL(id,'')!='' "+cond+" )Total_total_call , (select convert(numeric(10,2),( ROUND(SUM( cast (lost_call as Float) ) / COUNT(*), 2)) ) avg  from dbo.Avg_call_lost where ISNULL(id,'')!='' "+cond+" )Total_lost_call ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY id Desc) AS rownumber,convert(varchar(10),dt,101) dt,total_call,lost_call,lost_percentage 	FROM  Avg_call_lost where ISNULL(id,'')!='' "+cond+" 	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
				}
				
				
				ResultSet rs = db.SelectData(query, con);
				
				
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
						if(sub_series_list.equalsIgnoreCase(series_name_8_1)) 
						{									
							String calling_parties_number = "" + rs.getString("calling_parties_number");
							if (calling_parties_number.equalsIgnoreCase("")
									|| calling_parties_number.equalsIgnoreCase("null")
									|| calling_parties_number.equalsIgnoreCase(null)) {
								calling_parties_number = "";
							}
							calling_parties_number = calling_parties_number.trim();

							String destination_party_number = "" + rs.getString("destination_party_number");
							if (destination_party_number.equalsIgnoreCase("")
									|| destination_party_number.equalsIgnoreCase("null")
									|| destination_party_number.equalsIgnoreCase(null)) {
								destination_party_number = "";
							}
							destination_party_number = destination_party_number.trim();

							String calling_time = "" + rs.getString("calling_time");
							if (calling_time.equalsIgnoreCase("") || calling_time.equalsIgnoreCase("null")
									|| calling_time.equalsIgnoreCase(null)) {
								calling_time = "";
							}
							calling_time = calling_time.trim();

							String Ans_time = "" + rs.getString("Ans_time");
							if (Ans_time.equalsIgnoreCase("") || Ans_time.equalsIgnoreCase("null")
									|| Ans_time.equalsIgnoreCase(null)) {
								Ans_time = "";
							}
							Ans_time = Ans_time.trim();

							String dt = "" + rs.getString("dt");
							if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null") || dt.equalsIgnoreCase(null)) {
								dt = "";
							}
							dt = dt.trim();

							String call_ring_time = "" + rs.getString("call_ring_time");
							if (call_ring_time.equalsIgnoreCase("") || call_ring_time.equalsIgnoreCase("null")
									|| call_ring_time.equalsIgnoreCase(null)) {
								call_ring_time = "";
							}
							call_ring_time = call_ring_time.trim();
							String Total_Average = "" + rs.getString("Total_Average");
							if (Total_Average.equalsIgnoreCase("") || Total_Average.equalsIgnoreCase("null")
									|| Total_Average.equalsIgnoreCase(null)) {
								Total_Average = "";
							}
							Total_Average = Total_Average.trim();

							obj.put("calling_parties_number", calling_parties_number);
							obj.put("destination_party_number", destination_party_number);
							obj.put("calling_time", calling_time);
							obj.put("Ans_time", Ans_time);
							obj.put("dt", dt);
							obj.put("call_ring_time", call_ring_time);
							obj.put("Total_Average", Total_Average);
						
						
						}
						
						else if(sub_series_list.equalsIgnoreCase(series_name_8_2)) 
						{									
							String dt = "" + rs.getString("dt");
							if (dt.equalsIgnoreCase("") || dt.equalsIgnoreCase("null")
									|| dt.equalsIgnoreCase(null)) {
								dt = "";
							}
							dt = dt.trim();
							
							String total_call = "" + rs.getString("total_call");
							if (total_call.equalsIgnoreCase("") || total_call.equalsIgnoreCase("null")
									|| total_call.equalsIgnoreCase(null)) {
								total_call = "";
							}
							total_call = total_call.trim();
							
							String lost_call = "" + rs.getString("lost_call");
							if (lost_call.equalsIgnoreCase("") || lost_call.equalsIgnoreCase("null")
									|| lost_call.equalsIgnoreCase(null)) {
								lost_call = "";
							}
							lost_call = lost_call.trim();
							
							String lost_percentage = "" + rs.getString("lost_percentage");
							if (lost_percentage.equalsIgnoreCase("") || lost_percentage.equalsIgnoreCase("null")
									|| lost_percentage.equalsIgnoreCase(null)) {
								lost_percentage = "";
							}
							lost_percentage = lost_percentage.trim();
							
							String Total_total_call = "" + rs.getString("Total_total_call");
							if (Total_total_call.equalsIgnoreCase("") || Total_total_call.equalsIgnoreCase("null")
									|| Total_total_call.equalsIgnoreCase(null)) {
								Total_total_call = "";
							}
							Total_total_call = Total_total_call.trim();
							
							String Total_lost_call = "" + rs.getString("Total_lost_call");
							if (Total_lost_call.equalsIgnoreCase("") || Total_lost_call.equalsIgnoreCase("null")
									|| Total_lost_call.equalsIgnoreCase(null)) {
								Total_lost_call = "";
							}
							Total_lost_call = Total_lost_call.trim();

							obj.put("dt", dt);
							obj.put("total_call", total_call);
							obj.put("lost_call", lost_call);
							obj.put("lost_percentage", lost_percentage);
							obj.put("Total_total_call", Total_total_call);
							obj.put("Total_lost_call", Total_lost_call);
							obj.put("dt", dt);
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
