package com.sla.master;

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
 * Servlet implementation class Fetching_Sub_Series_List
 */
@WebServlet("/Fetching_Sub_Series_List")
public class Fetching_Sub_Series_List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_Sub_Series_List() {
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
		System.out.println(">>>Fetching_Sub_Series_List");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		JSONObject obj = null;
		JSONArray arr = new JSONArray();
	String ssid=""+request.getParameter("id");
		String series_name = "", series_serialNo = "",id="";
		try {
			con = db.connection_get();
			if (con != null) {
				String query = "select isnull(series_serialNo,'')series_serialNo,isnull(series_name,'')series_name ,id from dbo.Mstr_SubReports where Isactive=1 and series_head_id='"+ssid+"' order by order_of_series asc";
				ResultSet rs = db.SelectData(query, con);
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
					
						series_name = "" + rs.getString("series_name");
						if(series_name.equalsIgnoreCase("") || series_name.equalsIgnoreCase("null") || series_name.equalsIgnoreCase(null)){
							series_name="";
						}
						series_name = series_name.trim();
						series_serialNo = "" + rs.getString("series_serialNo");
						if(series_serialNo.equalsIgnoreCase("") || series_serialNo.equalsIgnoreCase("null") || series_serialNo.equalsIgnoreCase(null)){
							series_serialNo="";
						}
						series_serialNo = series_serialNo.trim();
					
						id = "" + rs.getString("id");						
						obj.put("series_serialNo", series_serialNo);
						obj.put("series_name", series_name);											
						obj.put("id", id);
						arr.put(obj);
					}
				}
			}
		//	out.println(aesUtil.encrypt(salt, iv, "data",arr.toString()));
			
			out.println(arr);
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
