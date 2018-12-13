package com.sla.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cloudme.sample.aes.AesUtil;

import Database.Database;

/**
 * Servlet implementation class Loginvalid
 */
@WebServlet("/Loginvalid")
public class Loginvalid extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loginvalid() {
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
		//Removing header and cache information
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		//Internet checking		
		ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
		String itcnt = resource.getString("itcnt");
		String ksize = resource.getString("ksize");		
		String salt = resource.getString("salt");
		String iv =  resource.getString("iv");
		int iterationCount = Integer.parseInt(itcnt);
		int keySize = Integer.parseInt(ksize);
		AesUtil aesUtil = new AesUtil(keySize, iterationCount);			
		String req =""+request.getParameter("req");		
		String result = aesUtil.decrypt(salt, iv, "data",req);	
		String reqarr[] = result.split("-");
		String uencrypt[]=reqarr[0].split("#");
		String username=uencrypt[1];
		String pencrypt[]=reqarr[1].split("#");
		String password=pencrypt[1];
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Database db = new Database();
		Connection con = null;
		ResultSet rs = null;
		String status = "";
	
		try {
			con = db.connection_get();
			if (con != null) {
				//Condition based checking 
				if (username != null && password != null) {
									
								String query = "	SELECT * FROM mastr_user Where  username='"+ username+ "' COLLATE SQL_Latin1_General_CP1_CS_AS and pwd='"+ password+"' COLLATE SQL_Latin1_General_CP1_CS_AS and IsActive=1 ";
								rs = db.SelectData(query, con);
								if (rs != null) {
									if (rs.next())
									{
										String vid = ""+ rs.getString("id");
									
										String uname = ""+ rs.getString("username");
										if(uname.equalsIgnoreCase("null") || uname.equalsIgnoreCase(null)){
											uname="";
										}										
										String officername = ""+ rs.getString("officername");
										if(officername.equalsIgnoreCase("null") || officername.equalsIgnoreCase(null)){
											officername="";
										}
										String mobileno = ""+ rs.getString("mobileno");
										String role = ""+ rs.getString("role");
																		
										session = request.getSession(false);
										if (session != null) {
											String sessionId = session.getId();
											session.invalidate();
											Cookie[] cookies = request.getCookies();
											for (Cookie cookie : cookies) {
												if (sessionId.equalsIgnoreCase(cookie.getValue())) {
													cookie.setMaxAge(0);
													cookie.setValue(null);
													cookie.setDomain(request.getServerName());
													cookie.setPath(request.getServletContext().getContextPath()+ "/");
													cookie.setSecure(request.isSecure());
													response.addCookie(cookie);
													break;
												}
											}
										}
										session = request.getSession(true);									
										session.setMaxInactiveInterval(90*60);
										session.setAttribute("session_Login_Name",uname);
										session.setAttribute("session_vid",vid);
										session.setAttribute("session_officername",officername);
										session.setAttribute("session_mobileno",mobileno);
										session.setAttribute("session_Role",role);
										status = aesUtil.encrypt(salt, iv, "data","Success");	
										
										//Start Log Maintain
										
										String chkquery="insert into mastr_user_log ( userid,officername,username,mobileno,role,LogIntime)"
												+ "SELECT id,officername,username,mobileno,role,getdate() as LoginIntime  from mastr_user where id='"+vid+"' and Isactive=1";
										String status1 = db.InsertQuery(chkquery, con);										
										String chkquery1="select max(id)Log_ID from mastr_user_log where userid='"+vid+"'";
										//System.out.println("chkquery1" + chkquery1);
										ResultSet rs2=db.SelectData(chkquery1, con);
										if(rs2!=null){
											try {
												if(rs2.next()){
													try {
													String	status1_userid=""+rs2.getString("Log_ID");
													session.setAttribute("session_status1_userid", status1_userid);
													//System.out.println(">>>session_status1_userid"+status1_userid);
													} catch (SQLException e) {
														// TODO Auto-generated catch block
														e.printStackTrace();
													}
												}
											} catch (SQLException e) {
												// TODO Auto-generated catch block
												e.printStackTrace();
											}
										}
									// End Log closing										
									}
								} else {
									 status = aesUtil.encrypt(salt, iv, "data","Invalid");	
								}
							} else {
								status = aesUtil.encrypt(salt, iv, "data","failure");	
							}
						}				
			
		} catch (Exception e) {
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		out.println(status);	
		out.close();
	}
}
