package Database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckDB {
		public static void main(String[] args) throws SQLException
		{
			Database db =  new Database();
			Connection con=null;
			try
			{
				con=db.connection_get();
				ResultSet rs=db.SelectData("select Customername from customer;",con);		
			while(rs.next())
			{
				System.out.println(rs.getString("Customername"));
			}	
			}
			catch(Exception e)
			{
				System.out.println("Exception : "+e);
			}
			/*finally
			{
				con.close();
			}*/
		}
		
	

}
