package com.sla.dashboard;

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
import org.json.JSONObject;

import Database.Database;

/**
 * Servlet implementation class Fetching_LP_Chart_points
 */
@WebServlet("/Fetching_chart_points")
public class Fetching_chart_points extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_chart_points() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		Database db = new Database();
		Connection con = null;
		String days [] = {"two","three","four","five","six","seven","eight"};
		StringBuilder days_query = new StringBuilder();
		String last7days[]=new String[7]; 
		
		PrintWriter out = response.getWriter();
		JSONArray BLarr=new JSONArray();
		JSONArray LParr=new JSONArray();
		JSONArray Barr=new JSONArray();
		JSONArray Totalarr=new JSONArray();
		
		


		try {
			con = db.connection_get();
			if (con != null) {				
				 // for getting 7 consecutive days dynamically
				 
				days_query.append(" Select convert(nvarchar(10),getDate()-7,105)as eight,")
					.append(" convert(nvarchar(10),getDate()-6,105)as seven, ")
					.append(" convert(nvarchar(10),getDate()-5,105)as six,")
					.append(" convert(nvarchar(10),getDate()-4,105)as five,")
					.append(" convert(nvarchar(10),getDate()-3,105)as four,")
					.append(" convert(nvarchar(10),getDate()-2,105)as three,")
					.append(" convert(nvarchar(10),getDate()-1,105)as two");
	  			
					ResultSet days_result = db.SelectData(days_query.toString(), con);
					
					if (days_result != null) {
						while (days_result.next()) {
							for(int i=0;i<7;i++){
								
								
								last7days[i]=(days_result.getString(days[i]));
								//System.out.println("DATE : "+last7days[i]);
								
								//Baseline
								String req_query = "select convert(varchar(10), dateofresponse, 105) as date,status,ISNULL(SUM(cast (points as Float)),'0') as points from dbo.Bind_SLA_Module_Points where Status = 'Baseline' AND convert(varchar(10), dateofresponse, 105) = (convert(varchar(10), '"+last7days[i]+"', 105)) group by convert(varchar(10), dateofresponse, 105),status";
								ResultSet reqrs = db.SelectData(req_query, con);
										if (reqrs != null) {
											
											while (reqrs.next()) {
												
														JSONObject jobj = new JSONObject();
														jobj.put("BL_date", last7days[i]);
														jobj.put("BL_status", reqrs.getString(2));
														jobj.put("BL_points", reqrs.getString(3));
														
														BLarr.put(jobj);
								
											}
											
										}else {
											System.out.println("No records in "+last7days[i]+" For Baseline");
											JSONObject jobj = new JSONObject();
											jobj.put("BL_date", last7days[i]);
											jobj.put("BL_status", "Baseline");
											jobj.put("BL_points", "0");
											
											BLarr.put(jobj);

										}
										//LowerPerformance
										req_query = "select convert(varchar(10), dateofresponse, 105) as date,status,ISNULL(SUM(cast (points as Float)),'0') as points from dbo.Bind_SLA_Module_Points where Status ='Lowerperformance' AND convert(varchar(10), dateofresponse, 105) = (convert(varchar(10), '"+last7days[i]+"', 105)) group by convert(varchar(10), dateofresponse, 105),status";
										reqrs = db.SelectData(req_query, con);
												if (reqrs != null) {
													
													while (reqrs.next()) {
	
																JSONObject jobj = new JSONObject();
																jobj.put("LP_date", last7days[i]);
																jobj.put("LP_status", reqrs.getString(2));
																jobj.put("LP_points", reqrs.getString(3));
																
																LParr.put(jobj);
			
													}
													
												}else {
													System.out.println("No records in "+last7days[i]+" For lowerperformance");
													JSONObject jobj = new JSONObject();
													jobj.put("LP_date", last7days[i]);
													jobj.put("LP_status", "Lowerperformance");
													jobj.put("LP_points", "0");
													LParr.put(jobj);

												}
												//Breach
												req_query = "select convert(varchar(10), dateofresponse, 105) as date,status,ISNULL(SUM(cast (points as Float)),'0') as points from dbo.Bind_SLA_Module_Points where Status = 'Breach' AND convert(varchar(10), dateofresponse, 105) = (convert(varchar(10), '"+last7days[i]+"', 105)) group by convert(varchar(10), dateofresponse, 105),status";
												reqrs = db.SelectData(req_query, con);
														if (reqrs != null) {
															
															while (reqrs.next()) {
																
																		JSONObject jobj = new JSONObject();
																		jobj.put("B_date", last7days[i]);
																		jobj.put("B_status", reqrs.getString(2));
																		jobj.put("B_points", reqrs.getString(3));
																		
																		Barr.put(jobj);
																
															}
															
														}else {
															System.out.println("No records in "+last7days[i]+" For breach");
															JSONObject jobj = new JSONObject();
															jobj.put("B_date", last7days[i]);
															jobj.put("B_status","Breach");
															jobj.put("B_points", "0");
															
															Barr.put(jobj);

														}
								
													}
											}
					
									}
				}
			Totalarr.put(BLarr);Totalarr.put(LParr);Totalarr.put(Barr);
			System.out.println("output :"+Totalarr);
			out.print(Totalarr);
			out.close();
			con.close();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
