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
 * Servlet implementation class Fetching_Weekly_Score
 */
@WebServlet("/Fetching_Weekly_Score")
public class Fetching_Weekly_Score extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_Weekly_Score() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		Database db = new Database();
		Connection con = null;
		String days [] = {"two","three","four","five","six","seven","eight"};
		StringBuilder days_query = new StringBuilder();
		String last7days[]=new String[7]; 
		
		PrintWriter out = response.getWriter();
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
								
								
								String req_query = "select CONVERT(varchar(10),dateofresponse,105) AS date,SUM(cast (points as Float))as points from dbo.Bind_SLA_Module_Points where CONVERT(varchar(10),dateofresponse,105) = convert(varchar(10), '"+last7days[i]+"', 105) and isactive=1 group by CONVERT(varchar(10),dateofresponse,105)";
								ResultSet reqrs = db.SelectData(req_query, con);
										
										if (reqrs != null) {
											JSONObject obj = new JSONObject();
											while (reqrs.next()) {
												//System.out.print("Date :"+last7days[i]);
												//System.out.print("DATE :"+reqrs.getString(1));
												//System.out.println("POINTS:"+reqrs.getString(2));
												
												obj.put("DATE",reqrs.getString(1));
												obj.put("POINTS",reqrs.getString(2));
												Totalarr.put(obj);
											}
											
											
										}else {
											JSONObject obj = new JSONObject();
											System.out.println("No records in "+last7days[i]+" For Table");
											obj.put("DATE",last7days[i]);
											obj.put("POINTS","0.0");
											Totalarr.put(obj);

										}							
								
							}
						}
					
					}
				
				}
	
			//System.out.println("output :"+Totalarr);
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
