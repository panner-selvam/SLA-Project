package com.sla.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.Database;



/**
 * Servlet implementation class Sessionterminate
 */
@WebServlet("/Sessionterminate")
public class Sessionterminate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  HttpSession session;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sessionterminate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		session = request.getSession(false);
		session = request.getSession(true);
		Database db = new Database();
		Connection con = null;
		con = db.connection_get();
		try{
		if (con != null) {
		String session_logid = session.getAttribute("session_vid").toString();
		String session_status1_userid= session.getAttribute("session_status1_userid").toString();		
		String chkquery1="update mastr_user_log set logouttime=getdate() where userid='"+session_logid+"' and  id='"+session_status1_userid+"' ";
		String status=db.UpdateQuery(chkquery1, con);
		//System.out.println(chkquery1+"#"+status);	
	}if(session!=null){
		String sessionId = session.getId();
		//System.out.println(">>session id start"+sessionId);
		session.invalidate();
		//System.out.println(">>session id second"+sessionId);
		Cookie[] cookies = request.getCookies();
	    for (Cookie cookie : cookies) {
	      if (sessionId.equalsIgnoreCase(cookie.getValue())) {
	        cookie.setMaxAge(0);
	        cookie.setValue(null);
	        cookie.setDomain(request.getServerName());
	        cookie.setPath(request.getServletContext().getContextPath() + "/");
	        cookie.setSecure(request.isSecure());
	        response.addCookie(cookie);
	        break;
	      }
	}
	  //  System.out.println(">>session id"+sessionId);
		}
		else{
			
		}
	    response.setStatus(307); //this makes the redirection keep your requesting method as is.
	    
	 String url=request.getContextPath()+"/Login.jsp";
	    response.addHeader("Location", url);
		
		}catch(Exception e){
		//	System.out.println("elsecatch");					
			/*ResourceBundle resource = ResourceBundle.getBundle("commonvariables");
			String webpiuurl=resource.getString("webpiuurl");*/
			 String url=request.getContextPath()+"/Login.jsp";
			    response.addHeader("Location", url);
			    //System.out.println("url"+url);
			    response.sendRedirect(url);  
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
