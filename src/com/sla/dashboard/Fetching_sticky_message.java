package com.sla.dashboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import Database.Database;
/**
 * Servlet implementation class Fetching_sticky_message
 */
@WebServlet("/Fetching_sticky_message")
public class Fetching_sticky_message extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	Connection con=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetching_sticky_message() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		PrintWriter out = response.getWriter();
		session=request.getSession(false);
		String id=(String)session.getAttribute("session_vid");
		 ResultSet rs=null;
		 Database db=new Database();
		 JSONObject obj=new JSONObject();
		 JSONArray arr=new JSONArray();
		 try {
			 con = db.connection_get();
			 if(con!=null) {
				 String query = "SELECT isnull(message,'')message FROM Bind_messages WHERE user_id='"+id+"'";
				 rs = db.SelectData(query, con); 
				 if (rs != null) {
					 if(rs.next()) {
						 obj.put("message", ""+rs.getString(1));
					 }
				 }
				 arr.put(obj);
			 }
		 	}catch(NullPointerException NPe) {
		 		System.out.println(NPe);
		 	}
		 	catch(Exception e) {
		 		System.out.println(e);
		 	}
		 	out.print(arr);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		session = request.getSession(false);
		String id = (String) session.getAttribute("session_vid"); 
		String msg = request.getParameter("msg");
		Database db = new Database();
		ResultSet rs = null;
		String query = "", status = "",query1="";
		try {
			con = db.connection_get();
			if (con != null) {
				 query1 = "SELECT count(*)cnt FROM Bind_messages WHERE user_id='" + id + "'";
				rs = db.SelectData(query1, con);
				if (rs != null) {

					if (rs.next()) {
						int cnt = rs.getInt("cnt"); System.out.println("count :"+cnt);
						if (cnt == 0) {
							query = "INSERT INTO Bind_messages (message,user_id)VALUES ('"+msg+"','" + id + "')";
							status = db.InsertQuery(query, con);
						} else {

							query = "UPDATE Bind_messages SET message='" + msg + "' WHERE user_id='" + id + "'";							
							status = db.UpdateQuery(query, con);
						}
					}
				}
				out.println(status);

			}
		} catch (Exception e) {
			System.out.println("err:" + e);
		}

	}

}
