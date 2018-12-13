package com.sla.master;

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

import org.cloudme.sample.aes.AesUtil;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import Database.Database;

/**
 * Servlet implementation class Fetching_Series_List
 */
@WebServlet("/Fetching_Series_List")
public class Fetching_Series_List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_Series_List() {
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
		System.out.println(">>>Fetching_Series_List");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		JSONObject obj = null;
		JSONArray arr = new JSONArray();
	/*	ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		String itcnt = resource.getString("itcnt");
		String ksize = resource.getString("ksize");		
		String salt = resource.getString("salt");
		String iv =  resource.getString("iv");
		int iterationCount = Integer.parseInt(itcnt);
		int keySize = Integer.parseInt(ksize);
		AesUtil aesUtil = new AesUtil(keySize, iterationCount);	*/
		String series_name = "", series_serialNo = "",id="",modifieddatetime="";
		try {
			con = db.connection_get();
			if (con != null) {
				String query = "select isnull(series_name,'')series_name ,id from dbo.Mstr_Reports where Isactive=1 order by series_serialNo asc";
				ResultSet rs = db.SelectData(query, con);
				if (rs != null) {
					while (rs.next()) {
						obj = new JSONObject();
					
						series_name = "" + rs.getString("series_name");
						if(series_name.equalsIgnoreCase("") || series_name.equalsIgnoreCase("null") || series_name.equalsIgnoreCase(null)){
							series_name="";
						}
						series_name = series_name.trim();
					
						id = "" + rs.getString("id");						
					
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
