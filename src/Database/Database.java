package Database;


import java.sql.*;

import CommonConnection.DBCredentials;
import CommonConnection.DBCredentialBean;


public class Database {
		DBCredentials dbcred = new DBCredentials();
		
		private Connection db_con = null;
		private String status = "";
		
		public String getPassword() {
			return dbcred.getPassword();
		}
		public String getUserName() {
			return dbcred.getUserName();
		}
		public String getServerName() {
			return dbcred.getServerName();
		}
		public String getPortNumber() {
			return dbcred.getPortNumber();
		}
		public String getDatabaseName() {
			return dbcred.getDatabaseName();
		}	
	public Connection connection_get(){
		try {
			String db_server = dbcred.getServerName();
			String db_port = dbcred.getPortNumber();
			String db_database = dbcred.getDatabaseName();
			String db_username = dbcred.getUserName();
			String db_password = dbcred.getPassword();

			/*Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://"+db_server+":"+db_port+"/"+db_database+"?noAccessToProcedureBodies=true&user="+db_username+"&password="+db_password;
			*/
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
			//String url = "jdbc:sqlserver://"+db_server+":"+db_port+"/"+db_database+"?noAccessToProcedureBodies=true&user="+db_username+"&password="+db_password;
			 String url = "jdbc:sqlserver://"+db_server+":"+db_port+";databaseName="+db_database+"";   
	            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	            db_con= DriverManager.getConnection(url,db_username,db_password);
	            
			System.out.println(url+db_username+db_password);
			//db_con = DriverManager.getConnection(url,db_username,db_password);
			
			System.out.println("Connected");
		} catch (Exception e) {
			status = "FAILURE";
			System.out.println("SQLException: " + e.getMessage());
		    System.out.println("SQLState: " + ((SQLException) e).getSQLState());
		    System.out.println("VendorError: " + ((SQLException) e).getErrorCode());
		}
		return db_con;
	}
	

//	public String UpdateQuery(String query) {
//		return DeleteQuery(query);
//	}
	
	public String UpdateQuery(String query,Connection connection) {
		return DeleteQuery(query,connection);
	}
	
//	public String InsertQuery(String query){
//		try {
//			Statement stmt;
//			Connection db_con1 = connection_get();
//			if (db_con1 != null) {
//				System.out.println("query"+query);
//				stmt=db_con1.createStatement();
//				int res=stmt.executeUpdate(query);
//				if(res==1)
//				status = "SUCCESS";
//				else
//					status = "FAILURE";
//				
//				System.out.println(status);
//				logout();
//				
//			}
//		} catch (Exception e) {
//			System.out.println("e"+e);
//			status = "FAILURE";
//		}
//		return status;
//	}
	public String InsertQuery(String query,Connection connection){
		try {
			Statement stmt;
			
			if (connection != null) {
				System.out.println("query"+query);
				stmt=connection.createStatement();
				int res=stmt.executeUpdate(query);
				if(res==1)
				status = "SUCCESS";
				else
					status = "FAILURE";
				
				System.out.println(status);
				
			}
		} catch (Exception e) {
			System.out.println("e"+e);
			status = "FAILURE";
		}
		return status;
	}
//	public String DeleteQuery(String query){
//		try {
//			Connection db_con1 = connection_get();
//			if (db_con1 != null) {
//				System.out.println("query"+query);
//				PreparedStatement pstmt = db_con.prepareStatement(query);
//				pstmt.executeUpdate();
//				status = "SUCCESS";
//			}
//		} catch (Exception e) {
//			status = "FAILURE";
//		}
//		return status;
//	}
	
	public String DeleteQuery(String query, Connection connection){
		try {
			
			if (connection != null) {
				System.out.println("query"+query);
				PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.executeUpdate();
				status = "SUCCESS";
			}
		} catch (Exception e) {
			status = "FAILURE";
		}
		return status;
	}
	
//	public ResultSet SelectData(String query){
//		ResultSet rs = null;		
//		try {
//			Connection db_con1 = connection_get();
//			if (db_con1 != null) {
//				System.out.println("query"+query);
//				Statement stmt = db_con1.createStatement();
//				rs = stmt.executeQuery(query);
//				if(!rs.next()){
//					rs = null;
//				}else{
//					rs = stmt.executeQuery(query);
//				}
//			}
//		} catch (Exception e) {
//			status = "FAILURE";
//		}
//		return rs;
//	}
	
	public ResultSet SelectData(String query,Connection connection){
		ResultSet rs = null;		
		try {

			if (connection != null) {
				System.out.println("query"+query);
				Statement stmt = connection.createStatement();
				rs = stmt.executeQuery(query); 
				if(!rs.next()){
					rs = null;
				}else{
					rs = stmt.executeQuery(query);
				}
			}
		} catch (Exception e) {
			status = "FAILURE";
		}
		return rs;
	}
	
	public void logout() throws SQLException{
		if(db_con != null){
			db_con.close();
		}
	}
	

	public void logout(Connection connection) throws SQLException{
		if(connection != null){
			connection.close();
		}
	}
	
}
