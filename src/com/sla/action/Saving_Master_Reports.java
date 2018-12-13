package com.sla.action;

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
import javax.servlet.http.HttpSession;

import org.cloudme.sample.aes.AesUtil;

import Database.Database;

/**
 * Servlet implementation class Saving_Master_Reports
 */
@WebServlet("/Saving_Master_Reports")
public class Saving_Master_Reports extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Saving_Master_Reports() {
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
		response.setContentType("text/html;charset=utf-8");
		System.out.println(">>>Saving_Master_Reports");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;	
		ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		String itcnt = resource.getString("itcnt");
		String ksize = resource.getString("ksize");		
		String salt = resource.getString("salt");
		String iv =  resource.getString("iv");
		int iterationCount = Integer.parseInt(itcnt);
		int keySize = Integer.parseInt(ksize);
		AesUtil aesUtil = new AesUtil(keySize, iterationCount);	
		
		String status="failure";
		session = request.getSession(true);
		String session_vid = session.getAttribute("session_vid").toString();
		String session_Login_Name = session.getAttribute("session_Login_Name").toString();
		
		String cnt="";
		String mode=""+request.getParameter("mode");
		mode=mode.trim();
		if(mode.equalsIgnoreCase("series")) {
			cnt="Mstr_Reports";
		}else {
			cnt="Mstr_SubReports";
		}
		
		String seriesname=""+request.getParameter("seriesname");
		seriesname=seriesname.trim();
		String headername=""+request.getParameter("headername");
		headername=headername.trim();
		String seriesno=""+request.getParameter("seriesno");
		seriesno=seriesno.trim();
		
String query="";
		try {
			con = db.connection_get();
			if (con != null) {
				String existingquery="select count(*)as scnt from "+cnt+" where Series_Name='"+seriesname+"' and Series_SerialNo='"+seriesno+"' and isactive=1 "; 
				ResultSet rs=db.SelectData(existingquery, con);
				if(rs!=null){
					while(rs.next()){
						String scnt=""+rs.getString("scnt");
					if(scnt.equalsIgnoreCase("0")){
						if(mode.equalsIgnoreCase("series")) {	
				 query = "insert into Mstr_Reports (Createdby,Createdbyname,Series_Name,Series_SerialNo,Isactive) values('"+session_vid+"','"+session_Login_Name+"','"+seriesname+"','"+seriesno+"','1')";
						}else {
							 query = "insert into Mstr_SubReports (Createdby,Createdbyname,Series_head_id,Series_Name,Series_SerialNo,Isactive) values('"+session_vid+"','"+session_Login_Name+"','"+headername+"','"+seriesname+"','"+seriesno+"','1')";
						}
				status = db.InsertQuery(query, con);
					}else{
						status="Exists";	
					}
					}
				}
			}
			out.println(aesUtil.encrypt(salt, iv, "data",status));			
			out.close();
			con.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}

