package com.sla.calendar;

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
import org.json.JSONException;
import org.json.JSONObject;

import Database.Database;

/**
 * Servlet implementation class Fetching_Calendar_List
 */
@WebServlet("/Fetching_Calendar_List")
public class Fetching_Calendar_List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_Calendar_List() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	doGet(request, response);
		
		// TODO Auto-generated method stub
				response.setContentType("text/html;charset=utf-8");
				// response.setContentType("text/html");
				System.out.println(">>>Fetching_Meeting_List");
				String month = request.getParameter("month");
				String year = request.getParameter("year");
				
				PrintWriter out = response.getWriter();
				Database db = new Database();
				Connection con = null;
				JSONObject obj = null;
				JSONArray arr = new JSONArray();
				
				try {
					con = db.connection_get();
					if (con != null) {
						
						
						String query = " select a.points,a.year,a.month,a.Startdate,a.Enddate,a.dateofresponse from  ( "
								+" select  convert(numeric(10,2),( ROUND(SUM( cast (points as Float) ) / COUNT(*), 2)) ) points, "
								+" dateofresponse,LTRIM(RIGHT(CONVERT(VARCHAR(4), isnull(dateofresponse,''), 111)   , 4) ) as Year,  "
								+" LTRIM(RIGHT(CONVERT(VARCHAR(2), isnull(dateofresponse,''), 101), 4) ) as month , "
								+" (LTRIM(RIGHT(CONVERT(VARCHAR(10),isnull(dateofresponse,''),121), 10)))+' '+(CONVERT(VARCHAR(8), isnull(dateofresponse,''), 114)) "
								+" as Startdate,(LTRIM(RIGHT(CONVERT(VARCHAR(10),isnull(dateofresponse,''),121), 10)))+' '+(CONVERT(VARCHAR(8), isnull(dateofresponse,''), 114)) as Enddate " 
								+" from Bind_SLA_Module_Points where Isactive=1 group by dateofresponse)a where a.month='"+month+"' and a.year='"+year+"' ";
						
						ResultSet rs3 = db.SelectData(query, con);
						if (rs3 != null) {
							while (rs3.next()) {
								obj = new JSONObject();				
							
								String points=""+rs3.getString("points");	
								 float f = Float.parseFloat(points);
							        System.out.println(f);
								String Startdate=""+rs3.getString("Startdate");
								String Enddate=""+rs3.getString("Enddate");	
								
								String color="";
								if(f>0.00){
									color="#00e600";	
								}else{
									color="#ff9999";	
								}
								
								
								obj.put("points", f);	
								obj.put("title", "Points"+" "+f);
								obj.put("start", Startdate);	
								obj.put("end", Enddate);	
								obj.put("color", color);	
								
								arr.put(obj);
							}
						}
					}
					System.out.println(">>>>arr"+arr);
					out.print(arr);
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
