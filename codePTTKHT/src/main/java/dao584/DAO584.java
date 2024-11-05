package dao584;
import java.sql.*;

public class DAO584 {
	public static Connection con;
	public DAO584() {
		if(con == null) {
			String dbUrl = 
			"jdbc:mysql://localhost:3306/qlnh?autoReconnect=true&useSSL=false";
			System.out.println("here");
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(dbUrl, "root", "phongpro");
				System.out.println("connected");
			}
			catch (ClassNotFoundException e) {
                System.out.println("MySQL JDBC Driver not found.");
                e.printStackTrace();
            } catch (SQLException e) {
                System.out.println("Connection failed! SQLState: " + e.getSQLState());
                System.out.println("Error Code: " + e.getErrorCode());
                e.printStackTrace();
            }
		}
	}
}