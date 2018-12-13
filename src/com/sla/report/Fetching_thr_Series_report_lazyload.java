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
 * Servlet implementation class Fetching_thr_Series_report_lazyload
 */
@WebServlet("/Fetching_thr_Series_report_lazyload")
public class Fetching_thr_Series_report_lazyload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_thr_Series_report_lazyload() {
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
	//	doGet(request, response);
		response.setContentType("text/html;charset=utf-8");
		System.out.println(">>>>>>>>>>Fetching_Series_thrid_report>>>>>>>>>");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		JSONObject obj = null;
		JSONArray arr = new JSONArray();
		ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		
		
		String series_name_3_1=resource.getString("series_name_3_1");
		String series_name_3_2=resource.getString("series_name_3_2");
		String series_name_3_3=resource.getString("series_name_3_3");
		String series_name_3_4=resource.getString("series_name_3_4");
		
		
		
		
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
		
		String success = "", location = "",date="",applicationname="",failure="";String query ="";
		try {
			con = db.connection_get();
			if (con != null) {
				
				if(sub_series_list.equalsIgnoreCase(series_name_3_1)) 
						{									
					query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" )Total_success , (select convert(numeric(10,2),( ROUND(SUM( cast (failure as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,location,convert(varchar(10),date,101)date,applicationname,success,failure 	FROM  ANPRStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" 	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
						}
				if(sub_series_list.equalsIgnoreCase(series_name_3_2)) 
				{									
			query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRNonStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" )Total_success , (select convert(numeric(10,2),( ROUND(SUM( cast (failure as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRNonStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,location,convert(varchar(10),date,101)date,applicationname,success,failure 	FROM  ANPRNonStanderd3Wheel where ISNULL(rid,'')!='' "+cond+" 	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
				}
				if(sub_series_list.equalsIgnoreCase(series_name_3_3)) 
				{									
			query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" )Total_success , (select convert(numeric(10,2),( ROUND(SUM( cast (failure as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,location,convert(varchar(10),date,101)date,applicationname,success,failure 	FROM  ANPRStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" 	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
				}
				if(sub_series_list.equalsIgnoreCase(series_name_3_4)) 
				{									
			query = "SELECT  * 	FROM   ( SELECT     (select convert(numeric(10,2),( ROUND(SUM( cast (success as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRNonStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" )Total_success , (select convert(numeric(10,2),( ROUND(SUM( cast (failure as Float) ) / COUNT(*), 2)) ) avg  from dbo.ANPRNonStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" )Total_failure ,  COUNT(*) OVER() as Rcount, ROW_NUMBER() OVER (ORDER BY rid Desc) AS rownumber,location,convert(varchar(10),date,101)date,applicationname,success,failure 	FROM  ANPRNonStanderd2Wheel where ISNULL(rid,'')!='' "+cond+" 	) AS tbl 	WHERE  tbl.rownumber BETWEEN "+firstrow+" AND "+lastrow+""; 
				}
				
				
				ResultSet rs = db.SelectData(query, con);
				
				
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
						
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
						
						
						String Total_success=""+rs.getString("Total_success");
						String Total_failure=""+rs.getString("Total_failure");
						String rownumber = ""
								+ rs.getString("rownumber");
						//System.out.println(">>>>>rownumber"+rownumber);
						String Rcount = "" + rs.getString("Rcount");
						//System.out.println(">>>>>Rcount"+Rcount);
						obj.put("Rcount", Rcount);
						obj.put("rownumber", rownumber);
						obj.put("Total_success", Total_success);
						obj.put("Total_failure", Total_failure);						
						obj.put("failure", failure);
						obj.put("applicationname", applicationname);
						obj.put("date", date);						
						obj.put("location", location);
						obj.put("success", success);
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
