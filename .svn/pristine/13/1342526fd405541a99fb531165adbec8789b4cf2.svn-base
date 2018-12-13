package com.sla.report;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

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
 * Servlet implementation class Fetching_yearly_chart_value
 */
@WebServlet("/Fetching_yearly_chart_value")
public class Fetching_yearly_chart_value extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String year = request.getParameter("year"); System.out.println(">>>>"+year);
		int no_record_count=0;
		PrintWriter out = response.getWriter();
		Connection con = null;
		Database db=new Database();
		JSONArray obj1 =new JSONArray();
		JSONArray obj2 =new JSONArray();
		JSONArray obj3 =new JSONArray();
		JSONArray obj4 =new JSONArray();
		JSONArray obj5 =new JSONArray();
		JSONArray obj6 =new JSONArray();
		
		JSONArray arr= new JSONArray();
		JSONObject newobj = new JSONObject();
		String module_name1="",module_name2="",module_name3="",module_name4="",module_name5="",query=""; 
		
			try {
				con = db.connection_get(); 
				if(con!=null) {
					for(int i=1;i<=12;i++) {
						
						int number = i;
					    String numberAsString = String.format("%02d", number);
					    //System.out.println(numberAsString);
					   
					    if(year.equals("search_all")) { 
					    	query ="select distinct module_name,module_no, SUM(cast (points as Float)) as points "
					    			+ "from Bind_SLA_Module_Points where module_no in (1,2,3,4,5) group  by module_name,module_no";
						}
					    else 
					    { 
				    		query ="select distinct module_name,module_no, SUM(cast (points as Float)) as points  "
								+ "from Bind_SLA_Module_Points where module_no in (1,2,3,4,5) and RIGHT(CONVERT(VARCHAR(10), dateofresponse, 103), 7)='"+numberAsString+"/"+year+"'  "
								+ "group  by module_name,module_no";
					    }
						
						
						ResultSet req = db.SelectData(query, con);
						if(req!=null) {
							
							while(req.next()) {
								int temp = Integer.parseInt(req.getString(2));
								
								if(temp == 1) {
									JSONObject obj = new JSONObject();
									obj.put("month",numberAsString);
									obj.put("module_1", req.getString(3));
									module_name1 = req.getString(1);
									obj1.put(obj);
								}
								else if(temp == 2) {
									JSONObject obj = new JSONObject();
									obj.put("month",numberAsString);
									obj.put("module_2", req.getString(3));
									module_name2 = req.getString(1);
									obj2.put(obj);
								}
								else if(temp == 3) {
									JSONObject obj = new JSONObject();
									obj.put("month",numberAsString);
									obj.put("module_3", req.getString(3));
									module_name3 = req.getString(1);
									obj3.put(obj);
								}
								else if(temp == 4) {
									JSONObject obj = new JSONObject();
									obj.put("month",numberAsString);
									obj.put("module_4", req.getString(3));
									module_name4 = req.getString(1);
									obj4.put(obj);
								}
								else if(temp == 5) {
									JSONObject obj = new JSONObject();
									obj.put("month",numberAsString);
									obj.put("module_5", req.getString(3));
									module_name5 = req.getString(1);
									obj5.put(obj);
								}				
								
							}
						}
						else {
							no_record_count+=1;
							System.out.println("No records for "+numberAsString+"/"+year);
							JSONObject nullobj1 = new JSONObject();
							nullobj1.put("month",numberAsString);
							nullobj1.put("module_1", "0.0");
							obj1.put(nullobj1);
							
							JSONObject nullobj2 = new JSONObject();
							nullobj2.put("month",numberAsString);
							nullobj2.put("module_2", "0.0");
							obj2.put(nullobj2);
							
							JSONObject nullobj3 = new JSONObject();
							nullobj3.put("month",numberAsString);
							nullobj3.put("module_3", "0.0");
							obj3.put(nullobj3);
							
							JSONObject nullobj4 = new JSONObject();
							nullobj4.put("month",numberAsString);
							nullobj4.put("module_4", "0.0");
							obj4.put(nullobj4);
							
							JSONObject nullobj5 = new JSONObject();
							nullobj5.put("month",numberAsString);
							nullobj5.put("module_5", "0.0");
							obj5.put(nullobj5);
							
						}
						
						
						
						
					}
					newobj.put("module_1",module_name1);
					newobj.put("module_2",module_name2);
					newobj.put("module_3",module_name3);
					newobj.put("module_4",module_name4);
					newobj.put("module_5",module_name5);
					obj6.put(newobj);
					
				}
				
			}catch(Exception e) {
				System.out.println("err :"+e);
			}
			arr.put(obj1);arr.put(obj2);arr.put(obj3);arr.put(obj4);arr.put(obj5);arr.put(obj6);
			System.out.println("No record count :"+no_record_count);
			if(no_record_count>=12) { 
				System.out.println("No_records");
				JSONObject empty=new JSONObject();
				try {
					empty.put("No_record_month","12");
					out.println(empty);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				out.println(arr);
			}
		
	}

}
