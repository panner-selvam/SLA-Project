package com.sla.series.store;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.Database;

/**
 * Servlet implementation class Series_save
 */
@WebServlet("/Series_save")
public class Series_save extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Series_save() {
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
		HttpSession session;
		Database db =new Database();
		Connection con;
		PrintWriter out = response.getWriter();
		// TODO Auto-generated method stub
		String tableName="",query="",seriesDate="",status="";	

		seriesDate = request.getParameter("series_date");
		tableName = request.getParameter("table_name");
		session=request.getSession(false);
		String user_id=(String)session.getAttribute("session_vid");

		if(tableName.equals("tbl_2_1_a")){
			String hostName="",ipAddress="",dataCenter="",applicationName="",displayName="",processName="",processAvailability="",overallAvailability="";
			
			hostName = request.getParameter("hostName");
			ipAddress = request.getParameter("ipAddress");
			dataCenter = request.getParameter("dataCenter");
			applicationName = request.getParameter("applicationName");
			displayName = request.getParameter("displayName");
			processName = request.getParameter("processName");
			processAvailability = request.getParameter("processAvailability");
			overallAvailability = request.getParameter("overallAvailability");
			
			query ="INSERT INTO "+tableName+" (UserId,insertdate,Hostname,IPaddress,Data_Center,Application_name,"
					+ "Display_name,Process_name,Process_Availability,Overall_Availability) VALUES "
					+ "('"+user_id+"','"+seriesDate+"','"+hostName+"','"+ipAddress+	"','"+dataCenter+"','"+applicationName+"',"
							+ "'"+displayName+"','"+processName+"','"+processAvailability+"','"+overallAvailability+"')";
		}else if(tableName.equals("tbl_2_1_b")){
			String hostName="",ipAddress="",dataCenter="",applicationName="",processName="",processAvailability="",overallAvailability="" ;
			
			hostName = request.getParameter("hostName");
			ipAddress = request.getParameter("ipAddress");
			dataCenter = request.getParameter("dataCenter");
			applicationName = request.getParameter("applicationName");
			processName = request.getParameter("processName");
			processAvailability = request.getParameter("processAvailability");
			overallAvailability = request.getParameter("overallAvailability");
			
			query ="INSERT INTO "+tableName+" (UserId,insertdate,Hostname,IPaddress,Data_Center,Application_name,"
					+ "Process_name,Process_Availability,Overall_Availability) VALUES "
					+ "('"+user_id+"','"+seriesDate+"','"+hostName+"','"+ipAddress+	"','"+dataCenter+"','"+applicationName+"',"
							+ "'"+processName+"','"+processAvailability+"','"+overallAvailability+"')";
		}else if(tableName.equals("tbl_4_2")){ 
			String vehicle_id="",vehicle_type="",vehicle_no="",currentdate="",avg_online="",avg_offline="",series_date="";
			
			vehicle_id = request.getParameter("vehicle_id"); 
			vehicle_type = request.getParameter("vehicle_type");
			vehicle_no = request.getParameter("vehicle_no");
			currentdate = request.getParameter("current_date");
			avg_online = request.getParameter("avg_online");
			avg_offline = request.getParameter("avg_offline");
			series_date = request.getParameter("series_date");
			
			query ="INSERT INTO "+tableName+" (UserId,VehicleID,VehicleNo,Vehicle_Type,Avg_Online,Avg_Offline,"
					+ "DT,Createddate) VALUES "
					+ "('"+user_id+"','"+vehicle_id+"','"+vehicle_no+"','"+vehicle_type+	"','"+avg_online+"','"+avg_offline+"',"
							+ "'"+series_date+"','"+currentdate+"')";
		}else if(tableName.equals("tbl_5_1")){			
			String series_date="",ip_address="",host_name="",location_name="",up_time="",down_time="";
			
			series_date = request.getParameter("series_date"); 
			ip_address = request.getParameter("ip_address");
			host_name = request.getParameter("host_name");
			location_name = request.getParameter("location_name");
			up_time = request.getParameter("up_time");
			down_time = request.getParameter("down_time");
			
			query ="INSERT INTO "+tableName+" (UserId,date,IPaddress,Hostname,Location,Uptime,Downtime) VALUES "
					+ "('"+user_id+"','"+series_date+"','"+ip_address+"','"+host_name+"','"+location_name+"','"+up_time+"',"
							+ "'"+down_time+"')";
		}else if(tableName.equals("tbl_5_2")){ 
			
			String series_date="",video_wall_ip="",equipemnt_type="",location_name="",up_time="",down_time="";
			series_date = request.getParameter("series_date"); 
			video_wall_ip = request.getParameter("video_wall_ip");
			equipemnt_type = request.getParameter("equipment_type");
			location_name = request.getParameter("location_name");
			up_time = request.getParameter("up_time");
			down_time = request.getParameter("down_time");
			
			query ="INSERT INTO "+tableName+" (UserId,date,Video_wall_ip,Equipment_type,Location,Uptime,Downtime) VALUES "
					+ "('"+user_id+"','"+series_date+"','"+video_wall_ip+"','"+equipemnt_type+"','"+location_name+"','"+up_time+"',"
							+ "'"+down_time+"')";
		}else if(tableName.equals("tbl_5_3")){ 
			String series_date="",ip_address="",hostname="",region="",zone="",up_time="",police_station="",down_time="";
			series_date = request.getParameter("series_date"); 
			ip_address = request.getParameter("ip_address");
			hostname = request.getParameter("hostname");
			region = request.getParameter("region");
			zone = request.getParameter("zone");
			police_station = request.getParameter("police_station");
			up_time = request.getParameter("up_time");
			down_time = request.getParameter("down_time");			
			
			query ="INSERT INTO "+tableName+" (UserId,date,IP_address,Hostname,Region,Zone,Police_station,Uptime,Downtime) VALUES "
					+ "('"+user_id+"','"+series_date+"','"+ip_address+"','"+hostname+"','"+region+"','"+zone+"','"+police_station+"','"+up_time+"',"
							+ "'"+down_time+"')";
			
		}else if(tableName.equals("tbl_5_4")){ 
			
			String series_date="",ip_address="",hostname="",region="",zone="",up_time="",location_name="",down_time="";
			series_date = request.getParameter("series_date"); 
			ip_address = request.getParameter("ip_address");
			hostname = request.getParameter("hostname");
			region = request.getParameter("region");
			zone = request.getParameter("zone");
			location_name = request.getParameter("location_name");
			up_time = request.getParameter("up_time");
			down_time = request.getParameter("down_time");			
			query ="INSERT INTO "+tableName+" (UserId,Date,IP_address,Hostname,Region,Zone,Location,Uptime,Downtime) VALUES "
					+ "('"+user_id+"','"+series_date+"','"+ip_address+"','"+hostname+"','"+region+"','"+zone+"','"+location_name+"','"+up_time+"',"
							+ "'"+down_time+"')";
		}else if(tableName.equals("tbl_6_1")){ 
			
			String series_date="",ip_address="",name="",data_center="",application_name="",up_time="",down_time="";
			series_date = request.getParameter("series_date"); 
			ip_address = request.getParameter("ip_address");
			name = request.getParameter("name");
			data_center = request.getParameter("data_center");
			application_name = request.getParameter("application_name");
			up_time = request.getParameter("up_time");
			down_time = request.getParameter("down_time");			
			
			query ="INSERT INTO "+tableName+" (UserId,Ipaddress,name,datacenter,applicationname,Uptime,Downtime,date) VALUES "
					+ "('"+user_id+"','"+ip_address+"','"+name+"','"+data_center+"','"+application_name+"','"+up_time+"',"
							+ "'"+down_time+"','"+series_date+"')";
		}else if(tableName.equals("tbl_6_2")){ 
			
			String series_date="",ip_address="",hostname="",data_center="",up_time="",down_time="";
			series_date = request.getParameter("series_date"); 
			ip_address = request.getParameter("ip_address");
			hostname = request.getParameter("hostname");
			data_center = request.getParameter("data_center");
			up_time = request.getParameter("up_time");
			down_time = request.getParameter("down_time");			
			
			query ="INSERT INTO "+tableName+" (UserId,Ipaddress,Hostname,datacenter,Uptime,Downtime,date) VALUES "
					+ "('"+user_id+"','"+ip_address+"','"+hostname+"','"+data_center+"','"+up_time+"',"
							+ "'"+down_time+"','"+series_date+"')";
		}else if(tableName.equals("tbl_6_3")){ 
			
			String series_date="",name="",place="",online="",uptime="",offline="";
			series_date = request.getParameter("series_date"); 
			name = request.getParameter("name");
			place = request.getParameter("place");
			online = request.getParameter("online");
			offline = request.getParameter("offline");
			uptime = request.getParameter("uptime");			
			
			query ="INSERT INTO "+tableName+" (UserId,Name,Place,Date,Online,Offline,Uptime) VALUES "
					+ "('"+user_id+"','"+name+"','"+place+"','"+series_date+"','"+online+"',"
							+ "'"+offline+"','"+uptime+"')";
		}else if(tableName.equals("tbl_6_5")){ 
			
			String series_date="",hostname="",ip_address="",Location_name="",uptime="",downtime="";
			series_date = request.getParameter("series_date"); 
			hostname = request.getParameter("hostname");
			ip_address = request.getParameter("ip_address");
			Location_name = request.getParameter("Location_name");
			uptime = request.getParameter("uptime");
			downtime = request.getParameter("downtime");			
			
			query ="INSERT INTO "+tableName+" (UserId,Hostname,Ipaddress,Location,Uptime,Downtime,Date) VALUES "
					+ "('"+user_id+"','"+hostname+"','"+ip_address+"','"+Location_name+"','"+uptime+"',"
							+ "'"+downtime+"','"+series_date+"')";
		}else if(tableName.equals("tbl_7_1")){ 
			
			String series_date="",hostname="",ip_address="",Location_name="",uptime="",downtime="";
			series_date = request.getParameter("series_date"); 
			hostname = request.getParameter("hostname");
			ip_address = request.getParameter("ip_address");
			Location_name = request.getParameter("Location_name");
			uptime = request.getParameter("uptime");
			downtime = request.getParameter("downtime");			
			
			query ="INSERT INTO "+tableName+" (UserId,Hostname,Ipaddress,Location,Uptime,Downtime,datetime) VALUES "
					+ "('"+user_id+"','"+hostname+"','"+ip_address+"','"+Location_name+"','"+uptime+"',"
							+ "'"+downtime+"','"+series_date+"')";
		}else if(tableName.equals("tbl_7_2")){ 
			
			String series_date="",name="",place="",time_value="";
			series_date = request.getParameter("series_date"); 
			name = request.getParameter("name");
			place = request.getParameter("place");
			time_value = request.getParameter("time_value");			
			
			query ="INSERT INTO "+tableName+" (UserId,Name,Place,Time_hrs,Datetime) VALUES "
					+ "('"+user_id+"','"+name+"','"+place+"','"+time_value+"','"+series_date+"')";
		}else if(tableName.equals("tbl_7_3")){ 
			
			String series_date="",name="",place="",compliance="";
			series_date = request.getParameter("series_date"); 
			name = request.getParameter("name");
			place = request.getParameter("place");
			compliance = request.getParameter("compliance");			
			
			query ="INSERT INTO "+tableName+" (UserId,Name,Place,compliance,Datetime) VALUES "
					+ "('"+user_id+"','"+name+"','"+place+"','"+compliance+"','"+series_date+"')";
		}else if(tableName.equals("tbl_7_4")){ 
			
			String series_date="",patch_name="",patch_oem="",compliance="",release_date="",app_start_date="",app_close_date="";
			series_date = request.getParameter("series_date"); 
			patch_name = request.getParameter("patch_name");
			patch_oem = request.getParameter("patch_oem");
			compliance = request.getParameter("compliance");
			app_start_date = request.getParameter("app_start_date");
			app_close_date = request.getParameter("app_close_date");
			release_date = request.getParameter("release_date");
			
			query ="INSERT INTO "+tableName+" (UserId,Patch_Name,Patch_oem,App_Start_Date,App_Close_Date,Compliance,Release_date,datetime) VALUES "
					+ "('"+user_id+"','"+patch_name+"','"+patch_oem+"','"+app_start_date+"','"+app_close_date+"','"+compliance+"','"+release_date+"','"+series_date+"')";
		}else if(tableName.equals("tbl_7_5")){ 
			
			String series_date="",patch_name="",patch_oem="",compliance="",release_date="",app_start_date="",app_close_date="";
			series_date = request.getParameter("series_date"); 
			patch_name = request.getParameter("patch_name");
			patch_oem = request.getParameter("patch_oem");
			compliance = request.getParameter("compliance");
			app_start_date = request.getParameter("app_start_date");
			app_close_date = request.getParameter("app_close_date");
			release_date = request.getParameter("release_date");
			
			query ="INSERT INTO "+tableName+" (UserId,Patch_Name,Patch_oem,App_Start_Date,App_Close_Date,Compliance,Release_date,datetime) VALUES "
					+ "('"+user_id+"','"+patch_name+"','"+patch_oem+"','"+app_start_date+"','"+app_close_date+"','"+compliance+"','"+release_date+"','"+series_date+"')";
		}else if(tableName.equals("tbl_3_1_to_3_4")){ 
			
			String series_date="",mode="",location="",application_name="",success="",failure="";
			series_date = request.getParameter("series_date"); 
			mode = request.getParameter("mode");
			location = request.getParameter("location_name");
			application_name = request.getParameter("application_name");
			success = request.getParameter("success");
			failure = request.getParameter("failure");
			
			query ="INSERT INTO "+tableName+" (UserId,Mode,Location,Date,Application_name,Success,Failure) VALUES "
					+ "('"+user_id+"','"+mode+"','"+location+"','"+series_date+"','"+application_name+"','"+success+"','"+failure+"')";
		}else if(tableName.equals("tbl_6_4")){ 
			
			String series_date="",location="",security_name="",attendance="";
			series_date = request.getParameter("series_date");
			location = request.getParameter("location_name");
			security_name = request.getParameter("security_name");
			attendance = request.getParameter("attendance");
			
			query ="INSERT INTO "+tableName+" (UserId,Date,Security_name,Attendance,Location) VALUES "
					+ "('"+user_id+"','"+series_date+"','"+security_name+"','"+attendance+"','"+location+"')";
		}else if(tableName.equals("tbl_8_1")){ 
			
			String series_date="",calling_parties_number="",destination_parties_number="",calling_time="",answer_time="",call_ring_time="";
			series_date = request.getParameter("series_date");
			calling_parties_number = request.getParameter("calling_parties_number");
			destination_parties_number = request.getParameter("destination_parties_number");
			calling_time = request.getParameter("calling_time");
			answer_time = request.getParameter("answer_time");
			call_ring_time = request.getParameter("call_ring_time");
			
			
			query ="INSERT INTO "+tableName+" (UserId,calling_parties_number,destination_parties_number,calling_time,answer_time,DT,call_ring_time) VALUES "
					+ "('"+user_id+"','"+calling_parties_number+"','"+destination_parties_number+"','"+calling_time+"','"+answer_time+"','"+series_date+"','"+call_ring_time+"')";
		}else if(tableName.equals("tbl_8_2")){ 
			
			String series_date="",total_calls="",lost_calls="",lost_percentage="";
			series_date = request.getParameter("series_date");
			total_calls = request.getParameter("total_calls");
			lost_calls = request.getParameter("lost_calls");
			lost_percentage = request.getParameter("lost_percentage");
			
			query ="INSERT INTO "+tableName+" (UserId,DT,Total_call,lost_call,Lost_percentage) VALUES "
					+ "('"+user_id+"','"+series_date+"','"+total_calls+"','"+lost_calls+"','"+lost_percentage+"')";
		}else if(tableName.equals("tbl_5_5")){ 
			
			String series_date="",ip="",location_name="",uptime="",downtime="";
			series_date = request.getParameter("series_date");
			ip = request.getParameter("ip");
			location_name = request.getParameter("location_name");
			uptime = request.getParameter("uptime");
			downtime = request.getParameter("downtime");
			
			query ="INSERT INTO "+tableName+" (UserId,Date,IP,Location,Uptime,Downtime) VALUES "
					+ "('"+user_id+"','"+series_date+"','"+ip+"','"+location_name+"','"+uptime+"','"+downtime+"')";
		}else if(tableName.equals("tbl_2_2_a_to_2_9")){ 
			
			String series_date="",mode="",location_name="",application_name="",ip_address="",time="";
			series_date = request.getParameter("series_date"); 
			mode = request.getParameter("mode");
			location_name = request.getParameter("location_name");
			application_name = request.getParameter("application_name");
			ip_address = request.getParameter("ip_address");
			time = request.getParameter("time");
			
			query ="INSERT INTO "+tableName+" (UserId,IPAddress,ApplicationName,Location,Time,Mode,Date) VALUES "
					+ "('"+user_id+"','"+ip_address+"','"+application_name+"','"+location_name+"','"+time+"','"+mode+"','"+series_date+"')";
		}else if(tableName.equals("tbl_4_3")){ 
			
			String series_date="",vehicle_no="",road_worthiness="",success="",failure="";
			series_date = request.getParameter("series_date");
			vehicle_no = request.getParameter("vehicle_no");
			road_worthiness = request.getParameter("road_worthiness");
			success = request.getParameter("success");
			failure = request.getParameter("failure");
			
			query ="INSERT INTO "+tableName+" (UserId,VehicleNo,RoadWorthiness,Success,Failure,Date) VALUES "
					+ "('"+user_id+"','"+vehicle_no+"','"+road_worthiness+"','"+success+"','"+failure+"','"+series_date+"')";
		}
		try {
			con = db.connection_get();
			if(con!=null) {
				status = db.InsertQuery(query, con);
				System.out.println(status);
				if(status=="FAILURE") {
					out.println(status);
					System.out.println("data error");
				}
				
			}
		}catch(Exception e) {
			System.out.println(e);
			
		}
		out.println(status);
		
	}

}
